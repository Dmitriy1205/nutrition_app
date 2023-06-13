import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/extensions/validation.dart';
import '../../../common/colors.dart';
import '../../../common/services/service_locator.dart';
import '../../../common/strings.dart';
import '../../../common/theme.dart';
import '../../blocs/forgot_password/forgot_password_bloc.dart';
import '../../widgets/app_elevated_button.dart';
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
            orElse: () => Padding(
              padding: const EdgeInsets.only(
                left: 34,
                right: 34,
                top: 45,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      child: Ink(
                        width: 40,
                        height: 40,
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back,
                            size: 25,
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
                    style: AppTheme.themeData.textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    AppStrings.enterYourEmailAddress,
                    style: AppTheme.themeData.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 57,
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
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppElevatedButton(
                      text: AppStrings.reset.toUpperCase(),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState!.save();
                        _bloc.add(ForgotPasswordEvent.resetPassword(
                            email: _emailController.text));
                      }),
                  const SizedBox(
                    height: 47,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
