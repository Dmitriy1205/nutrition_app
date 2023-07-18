import 'package:freezed_annotation/freezed_annotation.dart';

part 'cities.freezed.dart';

part 'cities.g.dart';

@freezed
class Cities with _$Cities {
  const factory Cities({
    String? country,
    String? name,
    String? lat,
    String? lng,
  }) = _Cities;

  factory Cities.fromJson(Map<String, dynamic> json) => _$CitiesFromJson(json);
}
