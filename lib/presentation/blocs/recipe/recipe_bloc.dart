import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutrition_app/common/exceptions.dart';

import '../../../common/functions.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../data/repositories/recipe_repository.dart';

part 'recipe_event.dart';

part 'recipe_state.dart';

part 'recipe_bloc.freezed.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository _recipeRepository;
  final AuthRepository _authRepository;

  RecipeBloc(
      {required RecipeRepository recipeRepository,
      required AuthRepository authRepository})
      : _recipeRepository = recipeRepository,
        _authRepository = authRepository,
        super(const RecipeState.textGenerating()) {
    on<RecipeEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
      RecipeEvent event, Emitter<RecipeState> emit) async {
    await event.map(
      generateRecipe: (e) => _generateRecipe(e, emit),
      generateImage: (e) => _generateImage(e, emit),
    );
  }

  Future<void> _generateRecipe(
      _GenerateRecipe event, Emitter<RecipeState> emit) async {
    emit(const RecipeState.textGenerating());
    try {
      String userId = _authRepository.currentUser()!.uid;
      final String currentTime = getMealTime();
      String recipeText = await _recipeRepository.getRecipe(
        userId: userId,
        phase: event.phase,
        timeOfTheDay: currentTime,
        mood: event.mood,
        exclude: event.exclude,
        recipeName: event.recipeName,
      );
      emit(RecipeState.textGenerated(recipeText: recipeText));
    } on BadRequestException catch (e) {
      emit(RecipeState.error(error: e.message));
    }
  }

  Future<void> _generateImage(
      _GenerateImage event, Emitter<RecipeState> emit) async {
    emit(const RecipeState.imageGenerating());
    try {
      String recipeImage =
          await _recipeRepository.getRecipeImage(recipeName: event.recipeName);

      emit(RecipeState.imageGenerated(recipeImage: recipeImage));
    } on BadRequestException catch (e) {
      emit(RecipeState.error(error: e.message));
    }
  }
}
