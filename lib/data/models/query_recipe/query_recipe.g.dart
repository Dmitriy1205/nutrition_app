// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QueryRecipe _$$_QueryRecipeFromJson(Map<String, dynamic> json) =>
    _$_QueryRecipe(
      recipeName: json['recipeName'] as String?,
      image: json['image'] as String?,
      recipeBody: json['recipeBody'] as String?,
      dateTime: json['dateTime'] as String?,
    );

Map<String, dynamic> _$$_QueryRecipeToJson(_$_QueryRecipe instance) =>
    <String, dynamic>{
      'recipeName': instance.recipeName,
      'image': instance.image,
      'recipeBody': instance.recipeBody,
      'dateTime': instance.dateTime,
    };
