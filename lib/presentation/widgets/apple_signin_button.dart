import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/colors.dart';
import '../../common/services/service_locator.dart';
import '../../common/strings.dart';
import '../../common/theme.dart';
import '../blocs/apple_sign_in/apple_signin_bloc.dart';

class AppleSignInButton extends StatelessWidget {
  AppleSignInButton({Key? key}) : super(key: key);
  final AppleSigninBloc _bloc = sl<AppleSigninBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppleSigninBloc, AppleSigninState>(
      bloc: _bloc,
      builder: (context, state) {
        return Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(customBorder:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

            onTap: () {
              state.maybeMap(
                  loading: (_) => null,
                  initial: (_) =>
                      _bloc.add(const AppleSigninEvent.signInWithApple()),
                  orElse: () =>
                      _bloc.add(const AppleSigninEvent.signInWithApple()));
            },
            child: Ink(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.white),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: state.maybeMap(
                  loading: (_) => const Center(
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: AppColors.background,
                        )),
                  ),
                  orElse: () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.apple,
                        size: 30,
                        color: Colors.black,
                      ),
                      Text(
                        AppStrings.signInApple,
                        style: AppTheme.themeData.textTheme.titleMedium,
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
