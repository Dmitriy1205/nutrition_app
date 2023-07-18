part of 'create_account_bloc.dart';

@freezed
class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState.initial() = _Initial;

  const factory CreateAccountState.profileNotCreated() = _ProfileNotCreated;

  const factory CreateAccountState.success() = _Success;
  const factory CreateAccountState.created() = _Created;

  const factory CreateAccountState.loading() = _Loading;

  const factory CreateAccountState.error({required String error}) = _Error;
}
