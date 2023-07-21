import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/exceptions.dart';
import '../../../data/repositories/auth_repository.dart';
import '../auth/auth_bloc.dart';

part 'signup_event.dart';

part 'signup_state.dart';

part 'signup_bloc.freezed.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _authRepository;
  final AuthBloc _authBloc;

  SignupBloc({
    required AuthRepository auth,
    required AuthBloc authBloc,
  })  : _authBloc = authBloc,
        _authRepository = auth,
        super(const SignupState.initial()) {
    on<SignupEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(SignupEvent event, Emitter<SignupState> emit) =>
      event.map(
        signUpWithEmailAndPassword: (e) => _signUpWithEmailAndPassword(e, emit),
      );

  Future<void> _signUpWithEmailAndPassword(
      SignupEvent event, Emitter<SignupState> emit) async {
    emit(const SignupState.loading());

    try {
      await _authRepository.signUp(
        email: event.email.toString(),
        password: event.password.toString(),
      );
      // _authBloc.emit(AuthState.authenticated(user: _authBloc.state.user!));


      emit(const SignupState.success());
    } on BadRequestException catch (e) {
      emit(SignupState.error(error: e.message));
    }
  }
}
