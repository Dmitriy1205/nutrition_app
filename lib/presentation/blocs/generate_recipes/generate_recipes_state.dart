part of 'generate_recipes_bloc.dart';

@freezed
class GenerateRecipesState with _$GenerateRecipesState {
  const GenerateRecipesState._();

  List<String>? get recipes => maybeMap(
      generated: (state) => state.recipes,
      orElse: () {
        return null;
      });

  const factory GenerateRecipesState.initial() = _Initial;

  const factory GenerateRecipesState.generating() = _Generating;

  const factory GenerateRecipesState.generated(
      {required List<String> recipes}) = _Generated;

  const factory GenerateRecipesState.error({required String error}) =
      _ErrorState;
}
