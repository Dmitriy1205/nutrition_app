part of 'saved_recipe_bloc.dart';

@freezed
class SavedRecipeEvent with _$SavedRecipeEvent {
  const factory SavedRecipeEvent.saveRecipe({
    required String recipeName,
    required String recipeText,
    required String recipeImage,
  }) = _SaveRecipe;
  const factory SavedRecipeEvent.deleteRecipe({required String recipeId}) = _DeleteRecipe;
  const factory SavedRecipeEvent.getRecipes() = _GetRecipes;
}
