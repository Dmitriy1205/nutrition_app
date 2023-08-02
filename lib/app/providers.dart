import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/presentation/blocs/create_account/create_account_bloc.dart';
import 'package:nutrition_app/presentation/blocs/profile/profile_bloc.dart';
import 'package:nutrition_app/presentation/blocs/recipe/recipe_bloc.dart';
import 'package:nutrition_app/presentation/blocs/tutorial/tutorial_bloc.dart';

import '../common/services/service_locator.dart';
import '../presentation/blocs/auth/auth_bloc.dart';
import '../presentation/blocs/mood/mood_bloc.dart';

class Providers extends StatelessWidget {
  final Widget child;

  const Providers({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<CreateAccountBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<RecipeBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<TutorialBloc>(),
          lazy: false,
        ),
        BlocProvider(create: (context)=> sl<ProfileBloc>(),
          lazy: false,),
        BlocProvider(create: (context)=> sl<MoodBloc>(),
          lazy: false,),
      ],
      child: child,
    );
  }
}
