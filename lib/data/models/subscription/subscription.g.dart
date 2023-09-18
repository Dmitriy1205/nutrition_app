// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Subscription _$$_SubscriptionFromJson(Map<String, dynamic> json) =>
    _$_Subscription(
      isSubscribed: json['isSubscribed'] as bool? ?? false,
      isOneYear: json['isOneYear'] as bool? ?? false,
      isOneMonth: json['isOneMonth'] as bool? ?? false,
      isTrial: json['isTrial'] as bool? ?? false,
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
    );

Map<String, dynamic> _$$_SubscriptionToJson(_$_Subscription instance) =>
    <String, dynamic>{
      'isSubscribed': instance.isSubscribed,
      'isOneYear': instance.isOneYear,
      'isOneMonth': instance.isOneMonth,
      'isTrial': instance.isTrial,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
