import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/extensions/validation.dart';

import '../../../common/colors.dart';
import '../../../common/strings.dart';
import '../../../common/theme.dart';
import '../../../data/models/account/account.dart';
import '../../blocs/create_account/create_account_bloc.dart';
import '../../widgets/app_checkbox.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/loading_indicator.dart';

class Third extends StatefulWidget {
  final String name;
  final String birthDate;
  final Map<String, dynamic> location;
  final String selectedDay;
  final String selectedLength;
  final String selectedPeriod;
  final bool irregularCycle;

  const Third(
      {super.key,
      required this.name,
      required this.birthDate,
      required this.location,
      required this.irregularCycle,
      required this.selectedDay,
      required this.selectedLength,
      required this.selectedPeriod});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController allergyController = TextEditingController();
  TextEditingController foodController = TextEditingController();

  bool allergy = false;
  List<String> allergyList = [];
  List<String> foodList = [];

  @override
  void dispose() {
    allergyController.dispose();
    foodController.dispose();
    super.dispose();
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
                  AppStrings.foodPreferences,
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
                            value: allergy,
                            onChanged: (v) {
                              setState(() {
                                allergy = v!;
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
                                        text: '${AppStrings.haveAllergy}\n',
                                        // style: AppTheme.themeData.textTheme.titleMedium,
                                      ),
                                      TextSpan(
                                          text: AppStrings.dietaryRestrictions
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                !allergy
                    ? const SizedBox()
                    : TextFormField(
                        maxLines: 3,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: allergyController,
                        decoration: InputDecoration(
                          fillColor: AppColors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          hintText: AppStrings.allergy,
                          hintStyle: AppTheme.themeData.textTheme.titleSmall!
                              .copyWith(color: AppColors.greu),
                          prefix: const SizedBox(
                            width: 10,
                          ),
                        ),
                        validator: context.validateFieldNotEmpty,
                        onChanged: (text) {
                          allergyList = text
                              .split(',')
                              .map((letter) => letter.trim())
                              .toList();
                        },
                      ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  maxLines: 3,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: foodController,
                  decoration: InputDecoration(
                    fillColor: AppColors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    hintText: AppStrings.foodIDontEat,
                    hintStyle: AppTheme.themeData.textTheme.titleSmall!
                        .copyWith(color: AppColors.greu),
                    prefix: const SizedBox(
                      width: 10,
                    ),
                  ),
                  // validator: context.validateFieldNotEmpty,
                  onChanged: (text) {
                    setState(() {
                      foodList = text
                          .split(',')
                          .map((letter) => letter.trim())
                          .toList();
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: allergy
                          ? MediaQuery.of(context).size.height / 4.5
                          : MediaQuery.of(context).size.height / 3),
                  child: AppElevatedButton(
                      text: AppStrings.next,
                      style: AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(color: AppColors.white),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState!.save();
                        context.read<CreateAccountBloc>().add(
                              CreateAccountEvent.createFields(
                                account: UserAccount(
                                  name: widget.name,
                                  birthDate: widget.birthDate,
                                  location: widget.location,
                                  dayCycle: widget.selectedDay,
                                  cycleLength: widget.selectedLength,
                                  periodLength: widget.selectedPeriod,
                                  irregularCycle: widget.irregularCycle,
                                  haveAllergy: allergy,
                                  allergy: allergyList,
                                  foodDontIt: foodList,
                                ),
                              ),
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
