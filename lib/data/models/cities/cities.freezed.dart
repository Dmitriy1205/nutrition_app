// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cities _$CitiesFromJson(Map<String, dynamic> json) {
  return _Cities.fromJson(json);
}

/// @nodoc
mixin _$Cities {
  String? get country => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CitiesCopyWith<Cities> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitiesCopyWith<$Res> {
  factory $CitiesCopyWith(Cities value, $Res Function(Cities) then) =
      _$CitiesCopyWithImpl<$Res, Cities>;
  @useResult
  $Res call({String? country, String? name, String? lat, String? lng});
}

/// @nodoc
class _$CitiesCopyWithImpl<$Res, $Val extends Cities>
    implements $CitiesCopyWith<$Res> {
  _$CitiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = freezed,
    Object? name = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CitiesCopyWith<$Res> implements $CitiesCopyWith<$Res> {
  factory _$$_CitiesCopyWith(_$_Cities value, $Res Function(_$_Cities) then) =
      __$$_CitiesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? country, String? name, String? lat, String? lng});
}

/// @nodoc
class __$$_CitiesCopyWithImpl<$Res>
    extends _$CitiesCopyWithImpl<$Res, _$_Cities>
    implements _$$_CitiesCopyWith<$Res> {
  __$$_CitiesCopyWithImpl(_$_Cities _value, $Res Function(_$_Cities) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = freezed,
    Object? name = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_$_Cities(
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cities implements _Cities {
  const _$_Cities({this.country, this.name, this.lat, this.lng});

  factory _$_Cities.fromJson(Map<String, dynamic> json) =>
      _$$_CitiesFromJson(json);

  @override
  final String? country;
  @override
  final String? name;
  @override
  final String? lat;
  @override
  final String? lng;

  @override
  String toString() {
    return 'Cities(country: $country, name: $name, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cities &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, country, name, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CitiesCopyWith<_$_Cities> get copyWith =>
      __$$_CitiesCopyWithImpl<_$_Cities>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CitiesToJson(
      this,
    );
  }
}

abstract class _Cities implements Cities {
  const factory _Cities(
      {final String? country,
      final String? name,
      final String? lat,
      final String? lng}) = _$_Cities;

  factory _Cities.fromJson(Map<String, dynamic> json) = _$_Cities.fromJson;

  @override
  String? get country;
  @override
  String? get name;
  @override
  String? get lat;
  @override
  String? get lng;
  @override
  @JsonKey(ignore: true)
  _$$_CitiesCopyWith<_$_Cities> get copyWith =>
      throw _privateConstructorUsedError;
}
