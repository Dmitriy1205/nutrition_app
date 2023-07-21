import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/app/providers.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/theme.dart';
import 'package:nutrition_app/presentation/blocs/create_account/create_account_bloc.dart';
import 'package:nutrition_app/presentation/screens/account_creation.dart';
import 'package:nutrition_app/presentation/screens/home/home_screen.dart';
import 'package:nutrition_app/presentation/widgets/loading_indicator.dart';

import '../presentation/blocs/auth/auth_bloc.dart';
import '../presentation/screens/auth/sign_in_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/app/providers.dart';
import 'package:nutrition_app/common/theme.dart';
import 'package:nutrition_app/presentation/blocs/create_account/create_account_bloc.dart';
import 'package:nutrition_app/presentation/screens/account_creation.dart';
import 'package:nutrition_app/presentation/screens/home/home_screen.dart';

import '../presentation/blocs/auth/auth_bloc.dart';
import '../presentation/screens/auth/sign_in_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Providers(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: AppTheme.themeData,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.maybeMap(
              authenticated: (_) {
                BlocProvider.of<CreateAccountBloc>(context).add(
                    CreateAccountEvent.checkIfUserCreatedProfile(
                        id: state.user!.uid));
                return _handleAccountCreationState(context);
              },
              unauthenticated: (_) => const SignInScreen(),
              orElse: () => const SignInScreen(),
            );
          },
        ),
      ),
    );
  }

  Widget _handleAccountCreationState(BuildContext context) {
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      builder: (context, state) {
        return state.maybeMap(
            loading: (_) =>  Scaffold(
                  body: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFDEF3F2).withOpacity(0.7),
                              const Color(0xFFD6CFFF).withOpacity(0.7),
                            ],
                            stops: const [
                              0.3,
                              0.9,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                      const LoadingIndicator(),
                    ],
                  ),
                ),
            success: (_) => const HomeScreen(),
            profileNotCreated: (_) => const AccountCreation(),
            orElse: () => const Scaffold(
                backgroundColor: AppColors.white, body: LoadingIndicator()));
      },
    );
  }
}
