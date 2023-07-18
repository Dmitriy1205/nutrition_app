// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      name: json['name'] as String?,
      birthDate: json['birthDate'] as String?,
      location: json['location'] as Map<String, dynamic>?,
      dayCycle: json['dayCycle'] as String?,
      cycleLength: json['cycleLength'] as String?,
      periodLength: json['periodLength'] as String?,
      irregularCycle: json['irregularCycle'] as bool?,
      haveAllergy: json['haveAllergy'] as bool?,
      allergy:
          (json['allergy'] as List<dynamic>?)?.map((e) => e as String).toList(),
      foodDontIt: (json['foodDontIt'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthDate': instance.birthDate,
      'location': instance.location,
      'dayCycle': instance.dayCycle,
      'cycleLength': instance.cycleLength,
      'periodLength': instance.periodLength,
      'irregularCycle': instance.irregularCycle,
      'haveAllergy': instance.haveAllergy,
      'allergy': instance.allergy,
      'foodDontIt': instance.foodDontIt,
    };
