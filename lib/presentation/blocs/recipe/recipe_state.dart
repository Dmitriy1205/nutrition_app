part of 'recipe_bloc.dart';

@freezed
class RecipeState with _$RecipeState {
  const RecipeState._();

  String? get recipeText =>
      maybeMap(textGenerated: (state) => state.recipeText, orElse: () => null);

  String? get recipeImage => maybeMap(
      imageGenerated: (state) => state.recipeImage, orElse: () => null);

  const factory RecipeState.initial() = _Initial;

  const factory RecipeState.textGenerating() = _TextGenerating;
  const factory RecipeState.imageGenerating() = _ImageGenerating;

  const factory RecipeState.textGenerated({required String recipeText}) =
      _TextGenerated;

  const factory RecipeState.imageGenerated({required String recipeImage}) =
      _ImageGenerated;

  const factory RecipeState.error({required String error}) = _ErrorState;
}
