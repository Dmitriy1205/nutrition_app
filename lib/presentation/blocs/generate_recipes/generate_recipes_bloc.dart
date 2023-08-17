import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutrition_app/common/functions/functions.dart';

import '../../../common/exceptions.dart';
import '../../../data/repositories/recipe_repository.dart';

part 'generate_recipes_event.dart';

part 'generate_recipes_state.dart';

part 'generate_recipes_bloc.freezed.dart';

class GenerateRecipesBloc
    extends Bloc<GenerateRecipesEvent, GenerateRecipesState> {
  final RecipeRepository _recipeRepository;

  GenerateRecipesBloc({required RecipeRepository recipeRepository})
      : _recipeRepository = recipeRepository,
        super(const GenerateRecipesState.generating()) {
    on<GenerateRecipesEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
      GenerateRecipesEvent event, Emitter<GenerateRecipesState> emit) async {
    await event.map(
      generateRecipes: (e) => _generateRecipes(e, emit),
    );
  }

  Future<void> _generateRecipes(
      _GenerateRecipes event, Emitter<GenerateRecipesState> emit) async {
    emit(const GenerateRecipesState.generating());
    try {
      final String currentTime = getMealTime();
      final List<String> generatedRecipes =
          await _recipeRepository.generateRecipes(
        season: event.season,
        cravings: event.cravings,
        currentTime: currentTime,
        exclude: event.exclude,
      );
      print('=================> $currentTime');
      print('=================> ${event.season}');
      emit(GenerateRecipesState.generated(recipes: generatedRecipes));
    } on BadRequestException catch (e) {
      emit(GenerateRecipesState.error(error: e.message));
    }
  }
}
