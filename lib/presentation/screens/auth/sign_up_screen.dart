import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/extensions/validation.dart';

import '../../../common/colors.dart';
import '../../../common/services/service_locator.dart';
import '../../../common/strings.dart';
import '../../../common/theme.dart';
import '../../blocs/sign_up/signup_bloc.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/loading_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignupBloc _bloc = sl<SignupBloc>();
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
      body: BlocConsumer<SignupBloc, SignupState>(
        bloc: _bloc,
        listener: (context, state) {
          state.maybeMap(
              success: (_) => Navigator.pop(context),
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
            orElse: () => SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 34,
                      right: 34,
                      top: MediaQuery.of(context).size.height / 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              autocorrect: false,
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
                      const SizedBox(
                        height: 30,
                      ),
                      AppElevatedButton(
                          text: AppStrings.signUp.toUpperCase(),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            _formKey.currentState!.save();
                            _bloc.add(SignupEvent.signUpWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text));
                          }),
                      const Flexible(
                        child: SizedBox(
                          height: 77,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style:
                                      AppTheme.themeData.textTheme.titleMedium,
                                  children: [
                                    const TextSpan(
                                      text: AppStrings.alreadyHaveAccount,
                                    ),
                                    TextSpan(
                                        text: AppStrings.signIn,
                                        style: const TextStyle(
                                          color: AppColors.red,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pop(context);
                                          }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
