import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/icons.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/blocs/profile/profile_bloc.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';

import '../../../../common/theme.dart';
import '../../../widgets/app_transparent_button.dart';
import '../../../widgets/colored_container.dart';

class MySubscription extends StatelessWidget {
  const MySubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            colors: [
              const Color(0xFFDEF3F2).withOpacity(0.5),
              const Color(0xFFD6CFFF).withOpacity(0.5),
            ],
            stops: const [
              0.3,
              0.9,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              state.maybeMap(
                  initialized: (_) => Navigator.pop(context), orElse: () {});
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 61.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      ColoredContainer(
                        radius: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(20),
                                child: Ink(
                                  width: 20,
                                  height: 20,
                                  child: const Center(
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Text(
                                AppStrings.mySubscription.toUpperCase(),
                                style: AppTheme
                                    .themeData.textTheme.headlineLarge!
                                    .copyWith(fontSize: 12),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // height: 248,
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.checkbox,
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Unlimited Custom Recipes',
                                    style:
                                        AppTheme.themeData.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.checkbox,
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Groceries for every Phase',
                                      style: AppTheme
                                          .themeData.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.checkbox,
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Health & Cycle Support with\nNeeded Nutrients',
                                      style: AppTheme
                                          .themeData.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(vertical: 8.0),
                              //   child: Row(
                              //     children: [
                              //       SvgPicture.asset(
                              //         AppIcons.checkbox,
                              //         width: 20,
                              //         height: 20,
                              //       ),
                              //       SizedBox(
                              //         width: 10,
                              //       ),
                              //       Text(
                              //         'Text for subscription pluses',
                              //         style: AppTheme
                              //             .themeData.textTheme.bodyMedium,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.startDate,
                                        style: AppTheme
                                            .themeData.textTheme.bodyMedium,
                                      ),
                                      Text(
                                        context
                                            .read<ProfileBloc>()
                                            .state
                                            .user!
                                            .subscription!['startDate'],
                                        style: AppTheme
                                            .themeData.textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 57,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.endDate,
                                        style: AppTheme
                                            .themeData.textTheme.bodyMedium,
                                      ),
                                      Text(
                                        context
                                            .read<ProfileBloc>()
                                            .state
                                            .user!
                                            .subscription!['endDate'],
                                        style: AppTheme
                                            .themeData.textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  AppElevatedButton(
                      text: AppStrings.unsubscribe,
                      style: AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(color: AppColors.white),
                      onPressed: () {
                        showUnsibscribeBottomSheet(context);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

showUnsibscribeBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return SizedBox(
        height:Platform.isAndroid ? MediaQuery.of(context).size.height / 2.2 : MediaQuery.of(context).size.height / 2.55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 35),
          child: Column(
            children: [
              Container(
                  width: 38,
                  height: 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff353535))),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Text(AppStrings.unsubscribe.toUpperCase(),
                    style: AppTheme.themeData.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    )),
              ),
              const Divider(
                color: Color(0xFFEEEEEE),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(AppStrings.areYouSureUnsubscribe,
                    style: AppTheme.themeData.textTheme.titleMedium),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child:Platform.isAndroid ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 139,
                      child: AppTransparentButton(
                          backgroundColor: AppColors.transparentBlue,
                          text: AppStrings.cancel,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.violet,fontSize: 14),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    SizedBox(
                      width: 139,
                      child: AppElevatedButton(
                          text: AppStrings.unsubscribe,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.white,fontSize: 14),
                          onPressed: () {
                            Navigator.pop(context);
                            context
                                .read<ProfileBloc>()
                                .add(const ProfileEvent.unsubscribe());
                          }),
                    ),
                  ],
                ) : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 159,
                      child: AppTransparentButton(
                          backgroundColor: AppColors.transparentBlue,
                          text: AppStrings.cancel,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.violet),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    SizedBox(
                      width: 159,
                      child: AppElevatedButton(
                          text: AppStrings.unsubscribe,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.white),
                          onPressed: () {
                            Navigator.pop(context);
                            context
                                .read<ProfileBloc>()
                                .add(const ProfileEvent.unsubscribe());
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
