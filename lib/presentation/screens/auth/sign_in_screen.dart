import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/extensions/validation.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/screens/auth/sign_up_screen.dart';

import '../../../common/services/service_locator.dart';
import '../../../common/theme.dart';
import '../../blocs/sign_in/signin_bloc.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/apple_signin_button.dart';
import '../../widgets/google_signin_button.dart';
import '../../widgets/loading_indicator.dart';
import 'forgot_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SigninBloc _bloc = sl<SigninBloc>();

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SigninBloc, SigninState>(
        bloc: _bloc,
        listener: (context, state) {
          state.maybeMap(
              error: (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.red,
                    duration: const Duration(seconds: 5),
                    content: Text(
                      e.error,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeMap(
            loading: (_) => const LoadingIndicator(),
            orElse: () => SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 34,
                  right: 34,
                ),
                child: ListView(
                  children: [
                    Center(
                        child: Image.asset(
                      'assets/images/logo.png',
                      scale: 4,
                    )),
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _emailController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              hintText: AppStrings.email,
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                  left: 12,
                                  bottom: 10,
                                  top: 13,
                                ),
                                child: Icon(
                                  Icons.email,
                                  size: 25,
                                ),
                              ),
                            ),
                            validator: context.validateEmailAddress,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _passwordController,
                            obscureText: true,
                            style: AppTheme.themeData.textTheme.labelSmall!
                                .copyWith(fontSize: 14),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              hintText: AppStrings.password,
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    left: 12, bottom: 10, top: 12),
                                child: Icon(
                                  Icons.lock,
                                  size: 25,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' Password cant be empty';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPassword(),
                                  ),
                                );
                              },
                              child: Text(
                                AppStrings.forgotPassword,
                                style: AppTheme.themeData.textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AppElevatedButton(
                        text: AppStrings.signIn.toUpperCase(),
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _formKey.currentState!.save();
                          _bloc.add(
                            SigninEvent.signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Flexible(
                          child: Divider(
                            color: Colors.black,
                            height: 3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            AppStrings.or,
                            style: AppTheme.themeData.textTheme.labelSmall,
                          ),
                        ),
                        const Flexible(
                          child: Divider(
                            color: Colors.black,
                            height: 3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    GoogleSignInButton(),
                    const SizedBox(
                      height: 21,
                    ),
                    Platform.isIOS ? AppleSignInButton() : const SizedBox(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: AppTheme.themeData.textTheme.titleMedium,
                                children: [
                                  const TextSpan(
                                    text: AppStrings.dontHaveAccount,
                                  ),
                                  TextSpan(
                                      text: AppStrings.signUp,
                                      style: const TextStyle(
                                        color: AppColors.red,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignUpScreen(),
                                            ),
                                          );
                                        }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
