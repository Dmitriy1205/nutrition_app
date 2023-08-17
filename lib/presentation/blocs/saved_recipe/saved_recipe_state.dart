part of 'saved_recipe_bloc.dart';

@freezed
class SavedRecipeState with _$SavedRecipeState {
  const SavedRecipeState._();

  List<SavedRecipe>? get recipes =>
      maybeMap(success: (state) => state.recipes, orElse: () => null);
  const factory SavedRecipeState.initial() = _Initial;
  const factory SavedRecipeState.saving() = _Saving;
  const factory SavedRecipeState.loading() = _Loading;
  const factory SavedRecipeState.deleted() = _Deleted;
  const factory SavedRecipeState.saved() = _Saved;
  const factory SavedRecipeState.success({required List<SavedRecipe> recipes}) = _Success;
  const factory SavedRecipeState.error({required String error}) = _ErrorState;
}
