import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/app/providers.dart';
import 'package:nutrition_app/common/theme.dart';
import 'package:nutrition_app/presentation/screens/home/home_screen.dart';

import '../presentation/blocs/auth/auth_bloc.dart';
import '../presentation/screens/auth/sign_in_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Providers(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
    );
  }
}
