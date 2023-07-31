part of 'recipe_bloc.dart';

@freezed
class RecipeEvent with _$RecipeEvent {
  const factory RecipeEvent.generateRecipe({
    required String phase,
    required String mood,
    required List<String> exclude,
    required String recipeName,
  }) = _GenerateRecipe;

  const factory RecipeEvent.generateImage({required String recipeName}) = _GenerateImage;
}
