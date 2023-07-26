import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutrition_app/data/repositories/user_repository.dart';

import '../../../common/exceptions.dart';
import '../../../data/models/account/account.dart';
import '../auth/auth_bloc.dart';

part 'create_account_event.dart';

part 'create_account_state.dart';

part 'create_account_bloc.freezed.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  final AuthBloc _authBloc;
  final UserRepository _userRepository;

  late StreamSubscription _subscription;

  CreateAccountBloc(
      {required AuthBloc authBloc, required UserRepository userRepository})
      : _authBloc = authBloc,
        _userRepository = userRepository,
        super(const CreateAccountState.initial()) {
    on<CreateAccountEvent>(_mapBlocToState);
    _subscription = _authBloc.stream.listen((state) {
      state.maybeMap(
          authenticated: (state) {
            add(CreateAccountEvent.checkIfUserCreatedProfile(
                id: state.user.uid));
          },
          unauthenticated: (_) {
            add(const CreateAccountEvent.reset());
          },
          orElse: () {});
    });
  }

  Future<void> _mapBlocToState(
      CreateAccountEvent event, Emitter<CreateAccountState> emit) async {
    await event.map(
        createFields: (e) => _createFields(e, emit),
        checkIfUserCreatedProfile: (e) => _checkIfUserCreatedProfile(e, emit),
        reset: (e) => _reset(e, emit),
        accountCreated: (e) => _accountCreated(e, emit));
  }

  Future<void> _checkIfUserCreatedProfile(_CheckIfUserCreatedAccount event,
      Emitter<CreateAccountState> emit) async {
    final profile = await _userRepository.getAccount(id: event.id);

    if (profile.isInitialized) {
      emit(const CreateAccountState.success());
    } else {
      emit(const CreateAccountState.profileNotCreated());
    }
  }

  Future<void> _createFields(
      _CreateFields event, Emitter<CreateAccountState> emit) async {
    final previousState = state;
    emit(const CreateAccountState.loading());
    try {
      var currentUser = _authBloc.state.user!;

      await _userRepository.createUser(
          data: event.account, userId: currentUser.uid);
      emit(const CreateAccountState.success());
    } on BadRequestException catch (e) {
      emit(CreateAccountState.error(error: e.message));
      emit(previousState);
    }
  }

  Future<void> _reset(_Reset event, Emitter<CreateAccountState> emit) async {
    emit(const CreateAccountState.initial());
  }

  Future<void> _accountCreated(
      _AccountCreated event, Emitter<CreateAccountState> emit) async {
    emit(const CreateAccountState.success());
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
