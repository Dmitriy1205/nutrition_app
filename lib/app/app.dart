import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/app/providers.dart';
import 'package:nutrition_app/common/theme.dart';
import 'package:nutrition_app/presentation/blocs/create_account/create_account_bloc.dart';
import 'package:nutrition_app/presentation/screens/account_creation.dart';
import 'package:nutrition_app/presentation/screens/create_account_screen.dart';
import 'package:nutrition_app/presentation/screens/home/home_screen.dart';

import '../presentation/blocs/auth/auth_bloc.dart';
import '../presentation/screens/auth/sign_in_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Providers(
      child: BlocListener<CreateAccountBloc, CreateAccountState>(
        listener: (context, state) {
          state.maybeMap(
            profileNotCreated: (_) {
              navigatorKey.currentState?.pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const AccountCreation(),
                  ),
                  (route) => false);
            },
            success: (_) {
              navigatorKey.currentState?.pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false);
            },
            orElse: () {},
          );
        },
        listenWhen: (oldState, newState){
          return oldState.maybeMap(
              error: (_){
                return newState.maybeMap(
                    profileNotCreated: (_){
                      return false;
                    },
                    orElse: (){
                      return true;
                    });
              },
              orElse: (){return true;});
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: AppTheme.themeData,
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return state.maybeMap(
                authenticated: (_) => const HomeScreen(),
                orElse: () => const SignInScreen(),
              );
            },
          ),
        ),
      ),
    );
  }
}
