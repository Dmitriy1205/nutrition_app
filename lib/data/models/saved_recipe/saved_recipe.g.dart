// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedRecipe _$$_SavedRecipeFromJson(Map<String, dynamic> json) =>
    _$_SavedRecipe(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      recipeText: json['text'] as String?,
      img: json['img'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$_SavedRecipeToJson(_$_SavedRecipe instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'text': instance.recipeText,
      'img': instance.img,
      'date': instance.date,
    };
