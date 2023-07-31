part of 'generate_recipes_bloc.dart';

@freezed
class GenerateRecipesEvent with _$GenerateRecipesEvent {
  const factory GenerateRecipesEvent.generateRecipes({
    required String season,
    required List<String> cravings,
    required List<String> exclude,
  }) = _GenerateRecipes;
}
