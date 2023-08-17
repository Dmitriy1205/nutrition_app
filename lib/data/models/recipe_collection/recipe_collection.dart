import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_collection.freezed.dart';

part 'recipe_collection.g.dart';

@freezed
abstract class RecipeCollection with _$RecipeCollection {
  const factory RecipeCollection({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'recipe_id') String? recipeId,
  }) = _RecipeCollection;

  factory RecipeCollection.fromJson(Map<String, dynamic> json) =>
      _$RecipeCollectionFromJson(json);
}
