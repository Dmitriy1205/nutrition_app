part of 'create_account_bloc.dart';

@freezed
class CreateAccountEvent with _$CreateAccountEvent {
  const factory CreateAccountEvent.createFields({
    required Map<String,dynamic>? account
  }) = _CreateFields;

  const factory CreateAccountEvent.checkIfUserCreatedProfile(
      {required String id}) = _CheckIfUserCreatedAccount;

  const factory CreateAccountEvent.accountCreated() = _AccountCreated;
  const factory CreateAccountEvent.reset() = _Reset;
}
