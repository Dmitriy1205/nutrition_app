import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repositories/recipe_repository.dart';

part 'generate_recipes_event.dart';

part 'generate_recipes_state.dart';

part 'generate_recipes_bloc.freezed.dart';

class GenerateRecipesBloc
    extends Bloc<GenerateRecipesEvent, GenerateRecipesState> {
  final RecipeRepository _recipeRepository;

  GenerateRecipesBloc({required RecipeRepository recipeRepository})
      : _recipeRepository = recipeRepository,
        super(const GenerateRecipesState.initial()) {
    on<GenerateRecipesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
