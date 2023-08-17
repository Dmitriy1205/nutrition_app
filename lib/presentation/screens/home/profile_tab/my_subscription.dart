import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/icons.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';

import '../../../../common/theme.dart';
import '../../../widgets/app_transparent_button.dart';
import '../../../widgets/colored_container.dart';

class MySubscription extends StatelessWidget {
  final void Function() previousPage;

  const MySubscription({super.key, required this.previousPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 51.0),
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
                            previousPage();
                          },
                        ),
                        Text(
                          AppStrings.mySubscription.toUpperCase(),
                          style: AppTheme.themeData.textTheme.headlineLarge!
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
                  height: 248,
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
                              'Text for subscription pluses',
                              style: AppTheme.themeData.textTheme.bodyMedium,
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
                                'Text for subscription pluses',
                                style: AppTheme.themeData.textTheme.bodyMedium,
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
                                'Text for subscription pluses\ntwo line text',
                                style: AppTheme.themeData.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
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
                                'Text for subscription pluses',
                                style: AppTheme.themeData.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.startDate,
                                  style:
                                      AppTheme.themeData.textTheme.bodyMedium,
                                ),
                                Text(
                                  '23.07.2023',
                                  style:
                                      AppTheme.themeData.textTheme.titleMedium,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 57,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.endDate,
                                  style:
                                      AppTheme.themeData.textTheme.bodyMedium,
                                ),
                                Text(
                                  '23.07.2024',
                                  style:
                                      AppTheme.themeData.textTheme.titleMedium,
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
    );
  }
}

showUnsibscribeBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 2.55,
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
                child: Row(
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
                          onPressed: () {}),
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
