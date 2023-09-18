import 'package:freezed_annotation/freezed_annotation.dart';


part 'subscription.freezed.dart';

part 'subscription.g.dart';

@freezed
class Subscription with _$Subscription{
  const factory Subscription({
    @Default(false)bool isSubscribed,
    @Default(false)bool isOneYear,
    @Default(false)bool isOneMonth,
    @Default(false)bool isTrial,
    @Default('')String startDate,
    @Default('')String endDate,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}