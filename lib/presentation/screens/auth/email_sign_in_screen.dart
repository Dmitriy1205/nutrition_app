import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition_app/common/extensions/validation.dart';
import 'package:nutrition_app/common/icons.dart';

import '../../../common/colors.dart';
import '../../../common/services/service_locator.dart';
import '../../../common/strings.dart';
import '../../../common/theme.dart';
import '../../blocs/sign_in/signin_bloc.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/bottomCornerGradient.dart';
import 'forgot_password.dart';


class EmailSignInScreen extends StatefulWidget {
  const EmailSignInScreen({super.key});

  @override
  State<EmailSignInScreen> createState() => _EmailSignInScreenState();
}

class _EmailSignInScreenState extends State<EmailSignInScreen> {
  final SigninBloc _bloc = sl<SigninBloc>();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  bool isObscure = true;

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
              success: (_)=>Navigator.pop(context),
              orElse: () {});
        },
        builder: (context, state) {
          return Stack(
            children: [
              const BottomCornerGradient(),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 34, right: 34, bottom: 34, top: 34),
                  child: ListView(
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
                        height: 14,
                      ),
                      Text(
                        AppStrings.signIn,
                        style: AppTheme.themeData.textTheme.headlineLarge,
                      ),
                      const Text(AppStrings.welcomeBack),
                      const SizedBox(
                        height: 125,
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _emailController,
                              style: AppTheme.themeData.textTheme.labelSmall!
                                  .copyWith(fontSize: 14),
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _passwordController,
                              obscureText: isObscure,
                              style: AppTheme.themeData.textTheme.labelSmall!
                                  .copyWith(fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 17, horizontal: 15),
                                hintText: AppStrings.yourPass,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                  icon: isObscure
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
                                      text: AppStrings.signIn,
                                      style: AppTheme
                                          .themeData.textTheme.titleMedium!
                                          .copyWith(color: AppColors.white),
                                      onPressed: () {
                                        if (!_formKey.currentState!
                                            .validate()) {
                                          return;
                                        }
                                        _formKey.currentState!.save();

                                        _bloc.add(
                                          SigninEvent
                                              .signInWithEmailAndPassword(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          ),
                                        );
                                      }),
                                ),
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
                                        style: AppTheme
                                            .themeData.textTheme.titleMedium!
                                            .copyWith(color: AppColors.violet),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 140,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: AppTheme
                                            .themeData.textTheme.titleSmall,
                                        children: [
                                          const TextSpan(
                                            text: AppStrings.dontHaveAccount,
                                          ),
                                          TextSpan(
                                              text: AppStrings.signUp,
                                              style: const TextStyle(
                                                color: AppColors.violet,
                                                fontWeight: FontWeight.w600,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bloc.close();
    super.dispose();
  }
}
