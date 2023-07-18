import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutrition_app/data/models/account/account.dart';

import '../../../common/exceptions.dart';
import '../../../data/repositories/user_repository.dart';
import '../auth/auth_bloc.dart';
import '../create_account/create_account_bloc.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  final AuthBloc _authBloc;
  final CreateAccountBloc _createAccountBloc;

  late StreamSubscription _createAccountSubscription;
  late StreamSubscription _authSubscription;

  UserBloc(
      {required UserRepository userRepository,
      required AuthBloc authBloc,
      required CreateAccountBloc createAccountBloc})
      : _userRepository = userRepository,
        _authBloc = authBloc,
        _createAccountBloc = createAccountBloc,
        super(const UserState.initial()) {
    on<UserEvent>(_mapBlocToState);
    _createAccountSubscription = _createAccountBloc.stream.listen((event) {
      event.maybeMap(
          success: (state) =>
              add(UserEvent.fetchData(userId: authBloc.state.user!.uid)),
          orElse: () {});
    });
    _authSubscription = authBloc.stream.listen((state) {
      state.maybeMap(
          unauthenticated: (_) {
            add(const UserEvent.reset());
          },
          orElse: () {});
    });
  }

  Future<void> _mapBlocToState(UserEvent event, Emitter<UserState> emit) async {
    await event.map(
      fetchData: (e) => _fetchData(e, emit),
      reset: (e) => _reset(e, emit),
    );
  }

  Future<void> _fetchData(_FetchData event, Emitter<UserState> emit) async {
    emit(const UserState.loading());
    try {
      final currentUser = _authBloc.state.user!.uid;
      final user = await _userRepository.getAccount(id: currentUser);

      emit(UserState.initialized(user: user));
    } on BadRequestException catch (e) {
      emit(UserState.error(error: e.message));
    }
  }

  Future<void> _reset(_Reset event, Emitter<UserState> emit) async {
    emit(const UserState.initial());
  }

  @override
  Future<void> close() {
    _createAccountSubscription.cancel();
    _authSubscription.cancel();
    return super.close();
  }
}
