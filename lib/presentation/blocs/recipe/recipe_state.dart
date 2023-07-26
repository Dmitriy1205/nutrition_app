part of 'recipe_bloc.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState.initial() = _Initial;

  const factory RecipeState.generating() = _Generating;

  const factory RecipeState.success() = _Success;

  const factory RecipeState.error({required String error}) = _ErrorState;
}
