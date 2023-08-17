import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_recipe.freezed.dart';

part 'query_recipe.g.dart';

@freezed
class QueryRecipe with _$QueryRecipe {
  const factory QueryRecipe({
    String? recipeName,
    String? image,
    String? recipeBody,
    String? dateTime,
  }) = _QueryRecipe;

  factory QueryRecipe.fromJson(Map<String, dynamic> json) =>
      _$QueryRecipeFromJson(json);
}