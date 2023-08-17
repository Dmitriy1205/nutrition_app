import 'package:freezed_annotation/freezed_annotation.dart';


part 'saved_recipe.freezed.dart';

part 'saved_recipe.g.dart';

@freezed
abstract class SavedRecipe with _$SavedRecipe {
  const factory SavedRecipe({
    @JsonKey(name: '_id') String? id,
    String? name,
    @JsonKey(name: 'text') String? recipeText,
    String? img,
  }) = _SavedRecipe;

  factory SavedRecipe.fromJson(Map<String, dynamic> json) =>
      _$SavedRecipeFromJson(json);
}