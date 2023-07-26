part of 'recipe_bloc.dart';

@freezed
class RecipeEvent with _$RecipeEvent {
  const factory RecipeEvent.generateRecipe() = _GenerateRecipe;
  const factory RecipeEvent.generateImage() = _GenerateImage;
}
