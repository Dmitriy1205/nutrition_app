import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/screens/auth/email_sign_in_screen.dart';
import 'package:nutrition_app/presentation/screens/auth/sign_up_screen.dart';
import 'package:nutrition_app/presentation/widgets/bottomCornerGradient.dart';

import '../../../common/theme.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/apple_signin_button.dart';
import '../../widgets/google_signin_button.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
            children: [
              const BottomCornerGradient(),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(

                      left: 34,
                      right: 34,
                      bottom: 34
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 94,),
                      Text(
                        AppStrings.start,
                        style: AppTheme.themeData.textTheme.headlineLarge,
                      ),
                      const Text(AppStrings.weHappy),

                      const Spacer(),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppElevatedButton(
                          text: AppStrings.continueWithEmail,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const SignUpScreen(),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      GoogleSignInButton(),
                      const SizedBox(
                        height: 15,
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
                                  style: AppTheme
                                      .themeData.textTheme.titleSmall,
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
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

    );
  }
}
