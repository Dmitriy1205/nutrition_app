import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition_app/common/extensions/validation.dart';
import 'package:nutrition_app/presentation/screens/policy.dart';
import 'package:nutrition_app/presentation/screens/terms.dart';

import '../../../common/colors.dart';
import '../../../common/icons.dart';
import '../../../common/services/service_locator.dart';
import '../../../common/strings.dart';
import '../../../common/theme.dart';
import '../../blocs/sign_up/signup_bloc.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/bottomCornerGradient.dart';
import '../../widgets/loading_indicator.dart';
import 'email_sign_in_screen.dart';

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
  final _confirmPassController = TextEditingController();
  bool isPassObscure = true;
  bool isConfirmObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
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
          return SingleChildScrollView(
            child: Stack(children: [
              const BottomCornerGradient(),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 34,
                    right: 34,
                    top: 34,
                  ),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          child: Ink(
                            width: 20,
                            height: 20,
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        AppStrings.signUp,
                        style: AppTheme.themeData.textTheme.headlineLarge,
                      ),
                      const Text(AppStrings.ourRegistration),
                      const SizedBox(
                        height: 75,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.email,
                              style: AppTheme.themeData.textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              autocorrect: false,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              style: AppTheme.themeData.textTheme.labelSmall!
                                  .copyWith(fontSize: 14),
                              controller: _emailController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 17, horizontal: 15),
                                hintText: AppStrings.yourEmail,
                              ),
                              validator: context.validateEmailAddress,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              AppStrings.password,
                              style: AppTheme.themeData.textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: isPassObscure,
                              style: AppTheme.themeData.textTheme.labelSmall!
                                  .copyWith(fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 17, horizontal: 15),
                                hintText: AppStrings.yourPass,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPassObscure = !isPassObscure;
                                    });
                                  },
                                  icon: isPassObscure
                                      ? SvgPicture.asset(AppIcons.closedEye)
                                      : SvgPicture.asset(AppIcons.openEye),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' Password cant be empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              AppStrings.confirmPassword,
                              style: AppTheme.themeData.textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _confirmPassController,
                              obscureText: isConfirmObscure,
                              style: AppTheme.themeData.textTheme.labelSmall!
                                  .copyWith(fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 17, horizontal: 15),
                                hintText: AppStrings.yourPass,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isConfirmObscure = !isConfirmObscure;
                                    });
                                  },
                                  icon: isConfirmObscure
                                      ? SvgPicture.asset(AppIcons.closedEye)
                                      : SvgPicture.asset(AppIcons.openEye),
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
                        height: 20,
                      ),
                      Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: state.maybeMap(
                            loading: (_) => 70,
                            orElse: () =>
                            MediaQuery.of(context).size.width,
                          ),
                          height: 60,
                          child: state.maybeMap(
                            loading: (_) => Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: AppColors.violet,
                                  borderRadius:
                                  BorderRadius.circular(40)),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  valueColor:
                                  AlwaysStoppedAnimation<Color>(
                                      AppColors.white),
                                ),
                              ),
                            ),
                            orElse: () => AppElevatedButton(
                                text: AppStrings.signUp,
                                style: AppTheme.themeData.textTheme.titleMedium!
                                    .copyWith(color: AppColors.white),
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  _formKey.currentState!.save();
                                  _bloc.add(SignupEvent.signUpWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text));
                                }),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: [
                            const TextSpan(text: AppStrings.agreement),
                            TextSpan(
                                text: AppStrings.terms,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.violet,
                                  fontSize: 15,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const TermsScreen()));
                                  }),
                            const TextSpan(text: AppStrings.and),
                            TextSpan(
                                text: AppStrings.policy,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.violet,
                                  fontSize: 15,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const PolicyScreen()));
                                  }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style:
                                  AppTheme.themeData.textTheme.titleSmall,
                                  children: [
                                    const TextSpan(
                                      text: AppStrings.alreadyHaveAccount,
                                    ),
                                    TextSpan(
                                        text: AppStrings.signIn,
                                        style: const TextStyle(
                                          color: AppColors.violet,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                const EmailSignInScreen(),
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
                      const SizedBox(
                        height: 27,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
