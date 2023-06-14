import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/extensions/validation.dart';
import 'package:nutrition_app/presentation/widgets/app_checkbox.dart';

import '../../common/strings.dart';
import '../../common/theme.dart';
import '../widgets/app_elevated_button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedPhaze;
  String? selectedDay;
  String? selectedLength;
  String? selectedPeriod;
  bool allergy = false;
  bool irregularCycle = false;

  TextEditingController searchController = TextEditingController();
  String selectedCity = '';
  List<String> cities = [
    'New York',
    'Paris',
    'Tokyo',
    'TT',
    'pp'
    // Add more cities as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34,),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [const SizedBox(
              height: 40,
            ),

              Align(alignment: Alignment.center,child: Text(AppStrings.accountConfirmation,style: AppTheme.themeData.textTheme.headlineLarge,)),

              Align(alignment: Alignment.center,child: Text(AppStrings.letsPersonalize,style: AppTheme.themeData.textTheme.headlineSmall,)),
              const SizedBox(
                height: 70,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // controller: _emailController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  hintText: AppStrings.fullName,
                  hintStyle: AppTheme.themeData.textTheme.titleSmall,
                  prefix: SizedBox(
                    width: 10,
                  ),
                ),
                validator: context.validateFieldNotEmpty,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // controller: _emailController,
                decoration:  InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  hintText: AppStrings.birthDate,
                  hintStyle: AppTheme.themeData.textTheme.titleSmall,
                  prefix: SizedBox(
                    width: 10,
                  ),
                ),
                validator: context.validateFieldNotEmpty,
              ),
              const SizedBox(
                height: 30,
              ),
              // DropdownButtonFormField<String>(
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   style: AppTheme.themeData.textTheme.labelMedium!
              //       .copyWith(fontSize: 18),
              //   value: selectedPhaze,
              //   iconSize: 15,
              //   decoration: const InputDecoration(
              //     hintText: 'Cycle Phase',
              //       isDense: true,
              //       prefix: SizedBox(
              //         width: 6,
              //       ),
              //       contentPadding:
              //           EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              //       border: OutlineInputBorder()),
              //   icon: const Padding(
              //     padding: EdgeInsets.only(right: 8.0),
              //     child: FaIcon(FontAwesomeIcons.chevronDown),
              //   ),
              //   items: AppStrings.phazes
              //       .map(
              //         (phaze) => DropdownMenuItem<String>(
              //           value: phaze,
              //           child: Text(
              //             phaze,
              //             style: AppTheme.themeData.textTheme.labelSmall!
              //                 .copyWith(fontSize: 16),
              //           ),
              //         ),
              //       )
              //       .toList(),
              //   onChanged: (role) {
              //     setState(() {
              //       selectedPhaze = role;
              //     });
              //   },
              //   validator: (value) {
              //     if (value == null) {
              //       return AppStrings.fieldIsRequired;
              //     }
              //   },
              // ),
              // TextFormField(
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   // controller: _emailController,
              //   decoration: InputDecoration(
              //     contentPadding: EdgeInsets.symmetric(
              //         vertical: 15, horizontal: 10),
              //     hintText: AppStrings.location,
              //     hintStyle: AppTheme.themeData.textTheme.titleSmall,
              //     prefix: SizedBox(
              //       width: 10,
              //     ),
              //   ),
              //   validator: context.validateFieldNotEmpty,
              // ),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return cities.where((city) =>
                      city.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                },
                onSelected: (String value) {
                  setState(() {
                    selectedCity = value;
                    searchController.text = value;
                  });
                },
                fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
                    FocusNode focusNode, VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a city',
                      prefix: SizedBox(
                        width: 10,
                      ),
                      hintStyle: AppTheme.themeData.textTheme.titleSmall,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                    ),
                    onChanged: (value) {
                      // ...
                    },
                    onSubmitted: (value) {
                      onFieldSubmitted();
                    },
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),

              !irregularCycle
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.cycleRegularity,style: AppTheme.themeData.textTheme.titleMedium,),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField<String>(
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          style: AppTheme
                              .themeData.textTheme.labelMedium!
                              .copyWith(fontSize: 18),
                          value: selectedDay,
                          iconSize: 15,
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Day',
                              hintStyle: AppTheme.themeData.textTheme.titleSmall,
                              prefix: SizedBox(
                                width: 6,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              border: OutlineInputBorder()),
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child:
                            FaIcon(FontAwesomeIcons.chevronDown),
                          ),
                          items: AppStrings.daysOfCycle
                              .map(
                                (day) => DropdownMenuItem<String>(
                              value: day,
                              child: Text(
                                day,
                                style: AppTheme.themeData
                                    .textTheme.labelSmall!
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                          )
                              .toList(),
                          onChanged: (role) {
                            selectedPhaze = role;
                          },
                          validator: (value) {
                            if (value == null) {
                              return AppStrings.fieldIsRequired;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField<String>(
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          style: AppTheme
                              .themeData.textTheme.labelMedium!
                              .copyWith(fontSize: 18),
                          value: selectedLength,
                          iconSize: 15,
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Length',
                              hintStyle: AppTheme.themeData.textTheme.titleSmall,
                              prefix: SizedBox(
                                width: 6,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              border: OutlineInputBorder()),
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child:
                            FaIcon(FontAwesomeIcons.chevronDown),
                          ),
                          items: AppStrings.lengthOfCycle
                              .map(
                                (day) => DropdownMenuItem<String>(
                              value: day,
                              child: Text(
                                day,
                                style: AppTheme.themeData
                                    .textTheme.labelSmall!
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                          )
                              .toList(),
                          onChanged: (role) {
                            selectedPhaze = role;
                          },
                          validator: (value) {
                            if (value == null) {
                              return AppStrings.fieldIsRequired;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField<String>(
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          style: AppTheme
                              .themeData.textTheme.labelMedium!
                              .copyWith(fontSize: 18),
                          value: selectedPeriod,
                          iconSize: 15,
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Period',
                              hintStyle: AppTheme.themeData.textTheme.titleSmall,
                              prefix: SizedBox(
                                width: 6,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              border: OutlineInputBorder()),
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child:
                            FaIcon(FontAwesomeIcons.chevronDown),
                          ),
                          items: AppStrings.periodOfCycle
                              .map(
                                (day) => DropdownMenuItem<String>(
                              value: day,
                              child: Text(
                                day,
                                style: AppTheme.themeData
                                    .textTheme.labelSmall!
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                          )
                              .toList(),
                          onChanged: (role) {
                            selectedPhaze = role;
                          },
                          validator: (value) {
                            if (value == null) {
                              return AppStrings.fieldIsRequired;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )
                  : const SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  children: [
                    AppCheckbox(
                        value: irregularCycle,
                        onChanged: (v) {
                          setState(() {
                            irregularCycle = v!;
                          });
                        },
                        borderColor: AppColors.red),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(AppStrings.irregularCycle,style: AppTheme.themeData.textTheme.titleMedium,),


                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    AppCheckbox(
                        value: allergy,
                        onChanged: (v) {
                          setState(() {
                            allergy = v!;
                          });
                        },
                        borderColor: AppColors.red),
                    const SizedBox(
                      width: 20,
                    ),
                     Text(AppStrings.allergyAsk,style: AppTheme.themeData.textTheme.titleMedium,),


                  ],
                ),
              ),
              allergy
                  ? Column(
                    children: [
                      SizedBox(height: 20,),
                      TextFormField(
                        maxLines: 3,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          hintText: AppStrings.allergy,

                          hintStyle: AppTheme.themeData.textTheme.titleSmall,
                          prefix: SizedBox(
                            width: 10,
                          ),
                        ),
                        validator: context.validateFieldNotEmpty,
                      ),
                    ],
                  )
                  : const SizedBox(),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                maxLines: 3,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // controller: _emailController,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 10),
                  hintText: AppStrings.foodIDontEat,
                  hintStyle: AppTheme.themeData.textTheme.titleSmall,
                  prefix: SizedBox(
                    width: 10,
                  ),
                ),
                validator: context.validateFieldNotEmpty,
              ),
              const SizedBox(
                height: 40,
              ),


              AppElevatedButton(
                  text: AppStrings.confirm.toUpperCase(),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();
                    // _bloc.add(
                    //   SigninEvent.signInWithEmailAndPassword(
                    //     email: _emailController.text,
                    //     password: _passwordController.text,
                    //   ),
                    // );
                  }),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
