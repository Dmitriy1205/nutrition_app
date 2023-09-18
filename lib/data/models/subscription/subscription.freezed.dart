// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return _Subscription.fromJson(json);
}

/// @nodoc
mixin _$Subscription {
  bool get isSubscribed => throw _privateConstructorUsedError;
  bool get isOneYear => throw _privateConstructorUsedError;
  bool get isOneMonth => throw _privateConstructorUsedError;
  bool get isTrial => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionCopyWith<Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCopyWith<$Res> {
  factory $SubscriptionCopyWith(
          Subscription value, $Res Function(Subscription) then) =
      _$SubscriptionCopyWithImpl<$Res, Subscription>;
  @useResult
  $Res call(
      {bool isSubscribed,
      bool isOneYear,
      bool isOneMonth,
      bool isTrial,
      String startDate,
      String endDate});
}

/// @nodoc
class _$SubscriptionCopyWithImpl<$Res, $Val extends Subscription>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubscribed = null,
    Object? isOneYear = null,
    Object? isOneMonth = null,
    Object? isTrial = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      isOneYear: null == isOneYear
          ? _value.isOneYear
          : isOneYear // ignore: cast_nullable_to_non_nullable
              as bool,
      isOneMonth: null == isOneMonth
          ? _value.isOneMonth
          : isOneMonth // ignore: cast_nullable_to_non_nullable
              as bool,
      isTrial: null == isTrial
          ? _value.isTrial
          : isTrial // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubscriptionCopyWith<$Res>
    implements $SubscriptionCopyWith<$Res> {
  factory _$$_SubscriptionCopyWith(
          _$_Subscription value, $Res Function(_$_Subscription) then) =
      __$$_SubscriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubscribed,
      bool isOneYear,
      bool isOneMonth,
      bool isTrial,
      String startDate,
      String endDate});
}

/// @nodoc
class __$$_SubscriptionCopyWithImpl<$Res>
    extends _$SubscriptionCopyWithImpl<$Res, _$_Subscription>
    implements _$$_SubscriptionCopyWith<$Res> {
  __$$_SubscriptionCopyWithImpl(
      _$_Subscription _value, $Res Function(_$_Subscription) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubscribed = null,
    Object? isOneYear = null,
    Object? isOneMonth = null,
    Object? isTrial = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$_Subscription(
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      isOneYear: null == isOneYear
          ? _value.isOneYear
          : isOneYear // ignore: cast_nullable_to_non_nullable
              as bool,
      isOneMonth: null == isOneMonth
          ? _value.isOneMonth
          : isOneMonth // ignore: cast_nullable_to_non_nullable
              as bool,
      isTrial: null == isTrial
          ? _value.isTrial
          : isTrial // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Subscription implements _Subscription {
  const _$_Subscription(
      {this.isSubscribed = false,
      this.isOneYear = false,
      this.isOneMonth = false,
      this.isTrial = false,
      this.startDate = '',
      this.endDate = ''});

  factory _$_Subscription.fromJson(Map<String, dynamic> json) =>
      _$$_SubscriptionFromJson(json);

  @override
  @JsonKey()
  final bool isSubscribed;
  @override
  @JsonKey()
  final bool isOneYear;
  @override
  @JsonKey()
  final bool isOneMonth;
  @override
  @JsonKey()
  final bool isTrial;
  @override
  @JsonKey()
  final String startDate;
  @override
  @JsonKey()
  final String endDate;

  @override
  String toString() {
    return 'Subscription(isSubscribed: $isSubscribed, isOneYear: $isOneYear, isOneMonth: $isOneMonth, isTrial: $isTrial, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subscription &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.isOneYear, isOneYear) ||
                other.isOneYear == isOneYear) &&
            (identical(other.isOneMonth, isOneMonth) ||
                other.isOneMonth == isOneMonth) &&
            (identical(other.isTrial, isTrial) || other.isTrial == isTrial) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isSubscribed, isOneYear,
      isOneMonth, isTrial, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubscriptionCopyWith<_$_Subscription> get copyWith =>
      __$$_SubscriptionCopyWithImpl<_$_Subscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubscriptionToJson(
      this,
    );
  }
}

abstract class _Subscription implements Subscription {
  const factory _Subscription(
      {final bool isSubscribed,
      final bool isOneYear,
      final bool isOneMonth,
      final bool isTrial,
      final String startDate,
      final String endDate}) = _$_Subscription;

  factory _Subscription.fromJson(Map<String, dynamic> json) =
      _$_Subscription.fromJson;

  @override
  bool get isSubscribed;
  @override
  bool get isOneYear;
  @override
  bool get isOneMonth;
  @override
  bool get isTrial;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriptionCopyWith<_$_Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}
