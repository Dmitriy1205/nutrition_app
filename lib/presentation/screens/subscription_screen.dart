import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/blocs/profile/profile_bloc.dart';
import 'package:nutrition_app/presentation/widgets/app_checkbox.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';
import 'package:nutrition_app/presentation/widgets/app_transparent_button.dart';

import '../../common/icons.dart';
import '../../common/theme.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {

  bool trialSwitch = false;
  bool isTrial = false;
  bool isOneYear = false;
  bool isOneMonth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocListener<ProfileBloc, ProfileState>(
  listener: (context, state) {
    state.maybeMap(
        initialized: (_) => Navigator.pop(context), orElse: () {});
  },
  child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/image.png',
                  // color: Colors.blue.shade600,
                  // colorBlendMode: BlendMode.colorDodge,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  right: 24,
                  top: 47,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          color: AppColors.violetLight,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                // shrinkWrap: true,
                padding: const EdgeInsets.all(24.0),
                children: [
                  Text(
                    AppStrings.premiumSubscription,
                    style: AppTheme.themeData.textTheme.titleLarge!
                        .copyWith(fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                          AppStrings.unlimitedCustomRecipes,
                          style: AppTheme.themeData.textTheme.bodyMedium!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 10),
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
                          AppStrings.groceriesForEveryPhase,
                          style: AppTheme.themeData.textTheme.bodyMedium!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                          AppStrings.healthCycle,
                          style: AppTheme.themeData.textTheme.bodyMedium!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.violetLight.withOpacity(0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.stillNotSure,
                                style: AppTheme.themeData.textTheme.titleMedium,
                              ),
                              Text(
                                AppStrings.activateYourFreeTrial.toUpperCase(),
                                style: AppTheme.themeData.textTheme.titleMedium!
                                    .copyWith(
                                        color: AppColors.violet, fontSize: 12),
                              ),
                            ],
                          ),
                          FlutterSwitch(
                            width: 43,
                            height: 23,
                            padding: 2,
                            toggleSize: 18,
                            activeColor: AppColors.violet,
                            value: trialSwitch,
                            onToggle: (v) {
                              setState(() {
                                trialSwitch =v;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  SizedBox(
                    height: 87,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: isOneYear
                                      ? AppColors.violet
                                      : AppColors.violetLight,
                                  width: 2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.oneYear,
                                        style: AppTheme
                                            .themeData.textTheme.titleMedium,
                                      ),
                                      Text(
                                        AppStrings.onlyMonth,
                                        style: AppTheme
                                            .themeData.textTheme.titleMedium!
                                            .copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: AppCheckbox(
                                        value: isOneYear,
                                        onChanged: (v) {
                                          setState(() {
                                            isOneYear = v!;
                                            isOneMonth = false;
                                            isTrial = false;
                                          });
                                        },
                                        borderColor: AppColors.violet),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 20,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.violet,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child: Text(
                                'Save 32%',
                                style: AppTheme.themeData.textTheme.labelMedium,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: isOneMonth
                              ? AppColors.violet
                              : AppColors.violetLight,
                          width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.oneMonth,
                            style: AppTheme.themeData.textTheme.titleMedium,
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: AppCheckbox(
                                value: isOneMonth,
                                onChanged: (v) {
                                  setState(() {
                                    isOneMonth = v!;
                                    isOneYear = false;
                                    isTrial = false;
                                  });
                                },
                                borderColor: AppColors.violet),
                          ),
                        ],
                      ),
                    ),
                  ),
                 !trialSwitch ? const SizedBox():Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: isTrial
                                  ? AppColors.violet
                                  : AppColors.violetLight,
                              width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.trial,
                                style: AppTheme.themeData.textTheme.titleMedium,
                              ),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: AppCheckbox(
                                    value: isTrial,
                                    onChanged: (v) {
                                      setState(() {
                                        isTrial = v!;
                                        isOneMonth = false;
                                        isOneYear = false;
                                      });
                                    },
                                    borderColor: AppColors.violet),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  !isTrial && !isOneYear && !isOneMonth
                      ? const SizedBox()
                      : AppElevatedButton(
                          text: isTrial
                              ? AppStrings.startFreeTrial
                              : isOneYear
                                  ? AppStrings.getYear
                                  : AppStrings.oneMonth,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.white),
                          onPressed: () {
                            isTrial
                                ? context.read<ProfileBloc>().add(
                                    const ProfileEvent.subscribe(
                                        isTrial: true, isSubscribed: true))
                                : isOneYear
                                    ? context.read<ProfileBloc>().add(
                                        const ProfileEvent.subscribe(
                                            isOneYear: true,
                                            isSubscribed: true))
                                    : context.read<ProfileBloc>().add(
                                        const ProfileEvent.subscribe(
                                            isOneMonth: true,
                                            isSubscribed: true));
                          }),
                  const SizedBox(
                    height: 27,
                  ),
                  SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        Flexible(
                          child: AppTransparentButton(
                              padding: 2,
                              backgroundColor:
                                  AppColors.violetLight.withOpacity(0.5),
                              text: AppStrings.restorePurchase,
                              style: AppTheme.themeData.textTheme.titleMedium!
                                  .copyWith(
                                      color: AppColors.violet, fontSize: 12),
                              onPressed: () {}),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: AppTransparentButton(
                              padding: 2,
                              backgroundColor:
                                  AppColors.violetLight.withOpacity(0.5),
                              text: AppStrings.redeemCode,
                              style: AppTheme.themeData.textTheme.titleMedium!
                                  .copyWith(
                                      color: AppColors.violet, fontSize: 12),
                              onPressed: () {}),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      AppStrings.terms,
                      style: AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(color: AppColors.violet),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      AppStrings.policy,
                      style: AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(color: AppColors.violet),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
),
    );
  }
}
