import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/colors.dart';
import '../../../common/strings.dart';
import '../../../common/theme.dart';
import '../../widgets/app_checkbox.dart';
import '../../widgets/app_elevated_button.dart';

class Second extends StatefulWidget {
  final void Function(
    String selectedDay,
    String selectedLength,
    String selectedPeriod,
    bool irregularCycle,
  ) nextPage;

  const Second({super.key, required this.nextPage});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final _formKey = GlobalKey<FormState>();
  String? selectedDay;

  String? selectedLength;

  String? selectedPeriod;

  bool irregularCycle = false;

  @override
  void initState() {
    selectedDay = AppStrings.daysOfCycle[0];
    selectedLength = AppStrings.lengthOfCycle[7];
    selectedPeriod = AppStrings.periodLengthOfCycle[2];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.cycleRegularity,
                  style: AppTheme.themeData.textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        AppCheckbox(
                            value: irregularCycle,
                            onChanged: (v) {
                              setState(() {
                                irregularCycle = v!;
                              });
                            },
                            borderColor: AppColors.greu),
                        const SizedBox(
                          width: 20,
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
                                        .themeData.textTheme.titleMedium,
                                    children: [
                                      const TextSpan(
                                        text: '${AppStrings.irregularCycle}\n',
                                        // style: AppTheme.themeData.textTheme.titleMedium,
                                      ),
                                      TextSpan(
                                          text: AppStrings.activateMoon
                                              .toUpperCase(),
                                          style: const TextStyle(
                                            color: AppColors.violet,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {}),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       AppStrings.irregularCycle,
                        //       style: AppTheme.themeData.textTheme.titleMedium,
                        //     ),
                        //     TextButton(
                        //
                        //        onPressed: () {  }, child: Text(AppStrings.irregularCycle,),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppStrings.dayCycle,
                  style: !irregularCycle
                      ? AppTheme.themeData.textTheme.titleMedium
                      : AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(color: AppColors.greu),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: DropdownButtonFormField<String>(
                    menuMaxHeight: 200,
                    borderRadius: BorderRadius.circular(10),
                    dropdownColor: Colors.white,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: AppTheme.themeData.textTheme.labelMedium!
                        .copyWith(fontSize: 18),
                    value: selectedDay,
                    iconSize: 15,
                    decoration: const InputDecoration(
                        fillColor: AppColors.white,
                        filled: true,
                        isDense: true,
                        // hintText: AppStrings.days,
                        // hintStyle: AppTheme.themeData.textTheme.titleSmall!
                        //     .copyWith(color: AppColors.greu),
                        prefix: SizedBox(
                          width: 6,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        border: OutlineInputBorder()),
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: FaIcon(FontAwesomeIcons.chevronDown),
                    ),
                    items: AppStrings.daysOfCycle
                        .map(
                          (day) => DropdownMenuItem<String>(
                            value: day,
                            child: Text(
                              day,
                              style: AppTheme.themeData.textTheme.labelSmall!
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: !irregularCycle
                        ? (day) {
                            selectedDay = day!;
                          }
                        : null,
                    validator: (value) {
                      if (value == null) {
                        return AppStrings.fieldIsRequired;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppStrings.cycleLength,
                  style: !irregularCycle
                      ? AppTheme.themeData.textTheme.titleMedium
                      : AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(color: AppColors.greu),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: DropdownButtonFormField<String>(
                    menuMaxHeight: 200,
                    borderRadius: BorderRadius.circular(10),
                    dropdownColor: Colors.white,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: AppTheme.themeData.textTheme.labelMedium!
                        .copyWith(fontSize: 18),
                    value: selectedLength,
                    iconSize: 15,
                    decoration: const InputDecoration(
                        fillColor: AppColors.white,
                        filled: true,
                        isDense: true,
                        // hintText: AppStrings.days,
                        // hintStyle: AppTheme.themeData.textTheme.titleSmall!
                        //     .copyWith(color: AppColors.greu),
                        prefix: SizedBox(
                          width: 6,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        border: OutlineInputBorder()),
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: FaIcon(FontAwesomeIcons.chevronDown),
                    ),
                    items: AppStrings.lengthOfCycle
                        .map(
                          (day) => DropdownMenuItem<String>(
                            value: day,
                            child: Text(
                              day,
                              style: AppTheme.themeData.textTheme.labelSmall!
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: !irregularCycle
                        ? (length) {
                            selectedLength = length!;
                          }
                        : null,
                    validator: (value) {
                      if (value == null) {
                        return AppStrings.fieldIsRequired;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppStrings.periodLength,
                  style: !irregularCycle
                      ? AppTheme.themeData.textTheme.titleMedium
                      : AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(color: AppColors.greu),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: DropdownButtonFormField<String>(
                    menuMaxHeight: 200,
                    borderRadius: BorderRadius.circular(10),
                    dropdownColor: Colors.white,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: AppTheme.themeData.textTheme.labelMedium!
                        .copyWith(fontSize: 18),
                    value: selectedPeriod,
                    iconSize: 15,
                    decoration: const InputDecoration(
                        fillColor: AppColors.white,
                        filled: true,
                        isDense: true,
                        // hintText: AppStrings.days,
                        // hintStyle: AppTheme.themeData.textTheme.titleSmall!
                        //     .copyWith(color: AppColors.greu),
                        prefix: SizedBox(
                          width: 6,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        border: OutlineInputBorder()),
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: FaIcon(FontAwesomeIcons.chevronDown),
                    ),
                    items: AppStrings.periodLengthOfCycle
                        .map(
                          (day) => DropdownMenuItem<String>(
                            value: day,
                            child: Text(
                              day,
                              style: AppTheme.themeData.textTheme.labelSmall!
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: !irregularCycle
                        ? (period) {
                            selectedPeriod = period!;
                          }
                        : null,
                    validator: (value) {
                      if (value == null) {
                        return AppStrings.fieldIsRequired;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 7.7),
                  child: AppElevatedButton(
                      text: AppStrings.next,
                      style: AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(color: AppColors.white),
                      onPressed: irregularCycle
                          ? () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              _formKey.currentState!.save();
                              widget.nextPage(
                                '',
                                '',
                                '',
                                irregularCycle,
                              );
                            }
                          : () {
                              _formKey.currentState!.save();
                              widget.nextPage(
                                selectedDay!,
                                selectedLength!,
                                selectedPeriod!,
                                irregularCycle,
                              );
                            }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
