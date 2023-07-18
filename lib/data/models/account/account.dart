import 'package:freezed_annotation/freezed_annotation.dart';


part 'account.freezed.dart';

part 'account.g.dart';

@freezed
class UserAccount with _$UserAccount {
  const UserAccount._();
  bool get isInitialized => haveAllergy != null || foodDontIt != null ;

  const factory UserAccount({
    String? name,
    String? birthDate,
    Map<String, dynamic>? location,
    String? dayCycle,
    String? cycleLength,
    String? periodLength,
    bool? irregularCycle,
    bool? haveAllergy,
    List<String>? allergy,
    List<String>? foodDontIt,
  }) = _Account;

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);
}
