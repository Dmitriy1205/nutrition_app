part of 'generate_recipes_bloc.dart';

@freezed
class GenerateRecipesState with _$GenerateRecipesState {
  const factory GenerateRecipesState.initial() = _Initial;

  const factory GenerateRecipesState.generating() = _Generating;

  const factory GenerateRecipesState.generated() = _Generated;

  const factory GenerateRecipesState.error({required String error}) =
      _ErrorState;
}
