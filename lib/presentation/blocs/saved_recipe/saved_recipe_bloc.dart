import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutrition_app/common/exceptions.dart';
import 'package:nutrition_app/data/models/recipe_collection/recipe_collection.dart';

import '../../../data/models/saved_recipe/saved_recipe.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../data/repositories/recipe_repository.dart';

part 'saved_recipe_event.dart';

part 'saved_recipe_state.dart';

part 'saved_recipe_bloc.freezed.dart';

class SavedRecipeBloc extends Bloc<SavedRecipeEvent, SavedRecipeState> {
  final RecipeRepository _recipeRepository;
  final AuthRepository _authRepository;

  SavedRecipeBloc(
      {required RecipeRepository recipeRepository,
      required AuthRepository authRepository})
      : _recipeRepository = recipeRepository,
        _authRepository = authRepository,
        super(const SavedRecipeState.initial()) {
    on<SavedRecipeEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
          SavedRecipeEvent event, Emitter<SavedRecipeState> emit) async =>
      await event.map(
        saveRecipe: (e) => _saveRecipe(e, emit),
        deleteRecipe: (e) => _deleteRecipe(e, emit),
        getRecipes: (e) => _getRecipes(e, emit),
      );

  Future<void> _saveRecipe(
      _SaveRecipe event, Emitter<SavedRecipeState> emit) async {
    try {
      emit(const SavedRecipeState.saving());
      final currentUserId = _authRepository.currentUser()!.uid;
      final String recipeId = await _recipeRepository.saveRecipeOnDatabase(
          recipeName: event.recipeName,
          recipeText: event.recipeText,
          recipeImage: event.recipeImage);
      await _recipeRepository.saveRecipeToUserCollection(
          currentUserId: currentUserId, recipeId: recipeId);
      emit(const SavedRecipeState.saved());
    } on BadRequestException catch (e) {
      emit(SavedRecipeState.error(error: e.message));
    }
  }

  Future<void> _getRecipes(
      _GetRecipes event, Emitter<SavedRecipeState> emit) async {
    emit(const SavedRecipeState.loading());
    try {
      List<SavedRecipe> recipesSavedByCurrentUser = [];
      final currentUserId = _authRepository.currentUser()!.uid;
      List<SavedRecipe> allSavedRecipes =
          await _recipeRepository.getAllRecipes();
      List<RecipeCollection> recipeCollection =
          await _recipeRepository.getSavedRecipesFromUserCollection();
      recipeCollection
          .removeWhere((element) => element.userId != currentUserId);
      recipesSavedByCurrentUser = allSavedRecipes
          .where((recipe) =>
              recipeCollection.any((element) => element.recipeId == recipe.id))
          .toList();

      emit(SavedRecipeState.success(recipes: recipesSavedByCurrentUser));
    } on BadRequestException catch (e) {
      emit(SavedRecipeState.error(error: e.message));
    }
  }

  Future<void> _deleteRecipe(
      _DeleteRecipe event, Emitter<SavedRecipeState> emit) async {
    try {
      List<RecipeCollection> recipeCollection =
          await _recipeRepository.getSavedRecipesFromUserCollection();
      String? foundId = recipeCollection
          .firstWhere((collection) => collection.recipeId == event.recipeId)
          .id;
      await _recipeRepository.deleteFromSavedRecipeCollection(
          savedRecipeId: foundId!);
      await _recipeRepository.deleteFromRecipeCollection(
          recipeId: event.recipeId);
      emit(const SavedRecipeState.deleted());
    } on BadRequestException catch (e) {
      emit(SavedRecipeState.error(error: e.message));
    }
  }
}
