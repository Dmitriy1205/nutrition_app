import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../common/colors.dart';
import '../../common/icons.dart';
import '../../common/services/service_locator.dart';
import '../../common/strings.dart';
import '../../common/theme.dart';
import '../blocs/google_sign_in/google_signin_bloc.dart';

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({Key? key}) : super(key: key);
  final GoogleSigninBloc _bloc = sl<GoogleSigninBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleSigninBloc, GoogleSigninState>(
      bloc: _bloc,
      listener: (context, state) {
        state.maybeMap(
            error: (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.orange,
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
        return Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            customBorder:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onTap: () {
              state.maybeMap(
                  loading: (_) => null,
                  initial: (_) =>
                      _bloc.add(const GoogleSigninEvent.signInWithGoogle()),
                  orElse: () =>
                      _bloc.add(const GoogleSigninEvent.signInWithGoogle()));
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
                  initial: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(AppIcons.google),
                      Text(
                        AppStrings.signInGoogle,
                        style: AppTheme.themeData.textTheme.titleMedium,
                      ),
                      const SizedBox(),
                    ],
                  ),
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
                      SvgPicture.asset(AppIcons.google),
                      Text(
                        AppStrings.signInGoogle,
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
