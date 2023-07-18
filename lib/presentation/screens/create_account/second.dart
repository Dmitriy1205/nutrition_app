import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/colors.dart';
import '../../../common/strings.dart';
import '../../../common/theme.dart';
import '../../blocs/create_account/create_account_bloc.dart';
import '../../widgets/app_checkbox.dart';
import '../../widgets/app_elevated_button.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final _formKey = GlobalKey<FormState>();
  String? selectedDay;

  String? selectedLength;

  String? selectedPeriod;

  bool allergy = false;

  bool irregularCycle = false;

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
                                    style:
                                        AppTheme.themeData.textTheme.titleMedium,
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
                  style: !irregularCycle ? AppTheme.themeData.textTheme.titleMedium : AppTheme.themeData.textTheme.titleMedium!.copyWith(color: AppColors.greu),
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
                    decoration: InputDecoration(
                        fillColor: AppColors.white,
                        filled: true,
                        isDense: true,
                        hintText: AppStrings.days,
                        hintStyle: AppTheme.themeData.textTheme.titleSmall!.copyWith(color: AppColors.greu),
                        prefix: const SizedBox(
                          width: 6,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        border: const OutlineInputBorder()),
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
                    onChanged: !irregularCycle  ? (day) {
                      selectedDay = day;
                    } : null,
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
                  style: !irregularCycle ? AppTheme.themeData.textTheme.titleMedium : AppTheme.themeData.textTheme.titleMedium!.copyWith(color: AppColors.greu),
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
                    decoration: InputDecoration(
                        fillColor: AppColors.white,
                        filled: true,
                        isDense: true,
                        hintText: AppStrings.days,
                        hintStyle: AppTheme.themeData.textTheme.titleSmall!.copyWith(color: AppColors.greu),
                        prefix: const SizedBox(
                          width: 6,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                    onChanged:!irregularCycle  ? (length) {
                      selectedLength = length;
                    } : null,
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
                  style: !irregularCycle ? AppTheme.themeData.textTheme.titleMedium : AppTheme.themeData.textTheme.titleMedium!.copyWith(color: AppColors.greu),
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
                    decoration: InputDecoration(
                        fillColor: AppColors.white,
                        filled: true,
                        isDense: true,
                        hintText: AppStrings.days,
                        hintStyle: AppTheme.themeData.textTheme.titleSmall!.copyWith(color: AppColors.greu),
                        prefix: const SizedBox(
                          width: 6,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        border: const OutlineInputBorder()),
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: FaIcon(FontAwesomeIcons.chevronDown),
                    ),
                    items: AppStrings.periodOfCycle
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
                    onChanged: !irregularCycle  ? (period) {
                      selectedPeriod = period;
                    }: null,
                    validator: (value) {
                      if (value == null) {
                        return AppStrings.fieldIsRequired;
                      }
                    },
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/7.7),
                  child: AppElevatedButton(
                      text: AppStrings.next,
                      style: AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(color: AppColors.white),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState!.save();
                        context
                            .read<CreateAccountBloc>()
                            .add(CreateAccountEvent.createFields(account: {
                          'irregularCycle': irregularCycle,
                          'dayCycle': selectedDay ?? '',
                          'cycleLength': selectedLength ?? '',
                          'periodLength': selectedPeriod ?? '',
                        }));
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
