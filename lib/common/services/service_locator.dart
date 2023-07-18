import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:nutrition_app/common/services/firestore_service.dart';
import 'package:nutrition_app/data/repositories/user_repository.dart';
import 'package:nutrition_app/presentation/blocs/create_account/create_account_bloc.dart';
import 'package:nutrition_app/presentation/blocs/profile/profile_bloc.dart';
import 'package:nutrition_app/presentation/blocs/user/user_bloc.dart';
import 'package:nutrition_app/presentation/screens/create_account_screen.dart';

import '../../data/repositories/auth_repository.dart';
import '../../presentation/blocs/apple_sign_in/apple_signin_bloc.dart';
import '../../presentation/blocs/auth/auth_bloc.dart';
import '../../presentation/blocs/forgot_password/forgot_password_bloc.dart';
import '../../presentation/blocs/google_sign_in/google_signin_bloc.dart';
import '../../presentation/blocs/sign_in/signin_bloc.dart';
import '../../presentation/blocs/sign_up/signup_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //services
  sl.registerLazySingleton(() => FirestoreService(firestore: firestore));

  //Repositories
  sl.registerLazySingleton(() => AuthRepository(auth: auth));
  sl.registerLazySingleton(() => UserRepository(firestoreService: sl()));

  //Blocs
  sl.registerLazySingleton(() => AuthBloc(authRepository: sl()));
  sl.registerFactory(() => SignupBloc(auth: sl(), authBloc: sl()));
  sl.registerFactory(() => SigninBloc(auth: sl()));
  sl.registerFactory(() => ForgotPasswordBloc(auth: sl()));
  sl.registerFactory(() => GoogleSigninBloc(auth: sl()));
  sl.registerFactory(() => AppleSigninBloc(auth: sl()));
  sl.registerLazySingleton(
      () => CreateAccountBloc(authBloc: sl(), userRepository: sl()));
  sl.registerLazySingleton(() =>
      UserBloc(userRepository: sl(), authBloc: sl(), createAccountBloc: sl()));
  sl.registerFactory(() => ProfileBloc(
      userRepository: sl(), authBloc: sl(), createAccountBloc: sl()));
}
