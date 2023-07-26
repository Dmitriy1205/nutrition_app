import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/extensions/validation.dart';
import '../../../common/colors.dart';
import '../../../common/services/service_locator.dart';
import '../../../common/strings.dart';
import '../../../common/theme.dart';
import '../../blocs/forgot_password/forgot_password_bloc.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/bottomCornerGradient.dart';
import '../../widgets/loading_indicator.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final ForgotPasswordBloc _bloc = sl<ForgotPasswordBloc>();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        bloc: _bloc,
        listener: (context, state) {
          state.maybeMap(
              error: (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 5),
                    content: Text(
                      e.error,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              success: (_) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: AppColors.green,
                    duration: Duration(seconds: 5),
                    content: Text(
                      'Check your Email',
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
            orElse: () => Stack(
              children: [
                const BottomCornerGradient(),
                Padding(
                padding: const EdgeInsets.only(
                  left: 34,
                  right: 34,
                  top: 55,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      height: 26,
                    ),
                    Text(
                      AppStrings.forgotPassword,
                      style: AppTheme.themeData.textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      AppStrings.enterYourEmailAddress,
                    ),
                    // const SizedBox(
                    //   height: 57,
                    // ),
                    const Spacer(),
                    Text(
                      AppStrings.email,
                      style: AppTheme.themeData.textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _emailController,
                        style: AppTheme.themeData.textTheme.labelSmall!
                            .copyWith(fontSize: 14),
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                          hintText: AppStrings.yourEmail,
                        ),
                        validator: context.validateEmailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppElevatedButton(
                        text: AppStrings.reset,
                        style: AppTheme.themeData.textTheme.titleMedium!
                            .copyWith(color: AppColors.white),
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _formKey.currentState!.save();
                          _bloc.add(ForgotPasswordEvent.resetPassword(
                              email: _emailController.text));
                        }),
                    const Spacer(flex: 2,),
                  ],
                ),
              ),],
            ),
          );
        },
      ),
    );
  }
}
