import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/extensions/validation.dart';
import 'package:nutrition_app/data/models/account/account.dart';
import 'package:nutrition_app/presentation/blocs/profile/profile_bloc.dart';
import 'package:nutrition_app/presentation/widgets/app_checkbox.dart';
import '../../../common/strings.dart';
import '../../../common/theme.dart';
import '../../../data/models/cities/cities.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/tutorial/tutorial_bloc.dart';
import '../../widgets/birthdate_picker.dart';
import '../../widgets/loading_indicator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isFormFilled = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController allergyController = TextEditingController();
  TextEditingController foodController = TextEditingController();

  String? selectedDay;
  String? selectedLength;
  String? selectedPeriod;
  late bool allergy;

  late bool irregularCycle;

  List<Cities> _items = [];
  List<String> allergyList = [];
  List<String> foodList = [];
  late Cities location;
  late UserAccount user;

  String selectedCity = '';

  @override
  void initState() {

    readJson();
    user = context.read<ProfileBloc>().state.user!;

    nameController.text = user.name!;
    birthDateController.text = user.birthDate!;
    searchController.text =
        user.location!.entries.firstWhere((entry) => entry.key == 'name').value;
    allergyController.text = user.allergy!.join(', ');
    foodController.text = user.foodDontIt!.join(', ');
    allergy = user.haveAllergy!;
    irregularCycle = user.irregularCycle!;
    selectedDay = user.dayCycle!.isNotEmpty ? user.dayCycle : null;
    selectedLength = user.cycleLength!.isNotEmpty ? user.cycleLength : null;
    selectedPeriod = user.periodLength!.isNotEmpty ? user.periodLength : null;
    location = Cities(
      country: user.location!.entries
          .firstWhere((entry) => entry.key == 'country')
          .value,
      name: user.location!.entries
          .firstWhere((entry) => entry.key == 'name')
          .value,
      lat: user.location!.entries
          .firstWhere((entry) => entry.key == 'lat')
          .value,
      lng: user.location!.entries
          .firstWhere((entry) => entry.key == 'lng')
          .value,
    );
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    birthDateController.dispose();
    searchController.dispose();
    allergyController.dispose();
    foodController.dispose();
    super.dispose();
  }

  void _updateFloatingActionButtonVisibility() {
    final formValid = _formKey.currentState?.validate() ?? false;
    // final valuesNotEmpty =
    //     _textFieldController1.text.isNotEmpty || _textFieldController2.text.isNotEmpty;
    setState(() {
      isFormFilled = formValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent,
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.maybeMap(
              error: (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.red,
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
          return state.maybeMap(
            loading: (_) => const LoadingIndicator(),
            orElse: () => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 34,
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  // physics: const ClampingScrollPhysics(),
                  children: [
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    //
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 20,),
                          Text(
                            AppStrings.profile.toUpperCase(),
                            style: AppTheme.themeData.textTheme.headlineLarge,
                          ),
                          PopupMenuButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              itemBuilder: (context) {
                                return [
                                  const PopupMenuItem<int>(
                                    value: 0,
                                    child: Text(
                                      AppStrings.logout,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ];
                              },
                              onSelected: (value) {
                                if (value == 0) {
                                  showAlertDialog(context);
                                }
                              }),
                        ],
                      ),
                    ),
                    //
                    // Align(
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       AppStrings.letsPersonalize,
                    //       style: AppTheme.themeData.textTheme.headlineSmall,
                    //     )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppStrings.fullName,
                      style: AppTheme.themeData.textTheme.titleMedium,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: nameController,
                      decoration: buildInputDecoration(
                        hint: AppStrings.nameSurname,
                      ),
                      validator: context.validateFieldNotEmpty,
                      onChanged: (v) {
                        _updateFloatingActionButtonVisibility();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppStrings.dateOfBirth,
                      style: AppTheme.themeData.textTheme.titleMedium,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: birthDateController,
                      decoration: buildInputDecoration(
                        hint: AppStrings.birthday,
                      ),
                      validator: context.validateFieldNotEmpty,
                      onTap: () async {
                        DateTime? date = DateTime(1900);

                        FocusScope.of(context).requestFocus(FocusNode());
                        date = await Picker().birthDatePicker(context);

                        final formattedDate =
                            DateFormat('d/MMM/yyyy').format(date!);
                        birthDateController.text = formattedDate;
                      },
                      onSaved: (value) {
                        birthDateController.text = value!.trim();
                      },
                      onChanged: (v) {
                        _updateFloatingActionButtonVisibility();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppStrings.location,
                      style: AppTheme.themeData.textTheme.titleMedium,
                    ),
                    Autocomplete<String>(
                      initialValue: TextEditingValue(
                        text: user.location!.entries
                            .firstWhere((entry) => entry.key == 'name')
                            .value,
                      ),
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        }
                        return _items
                            .where((city) => city.name!
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase()))
                            .map((city) => '${city.name}, ${city.country}')
                            .toList();
                      },
                      onSelected: (String value) {
                        final pickedCity = _items.firstWhere(
                            (city) => '${city.name}, ${city.country}' == value,
                            orElse: () => const Cities());
                        setState(() {
                          location = Cities(
                            country: pickedCity.country,
                            name: pickedCity.name,
                            lat: pickedCity.lat,
                            lng: pickedCity.lng,
                          );
                          selectedCity = value;
                          searchController.text = value;
                        });
                      },
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController textEditingController,
                          FocusNode focusNode,
                          VoidCallback onFieldSubmitted) {
                        return TextFormField(
                          controller: textEditingController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          focusNode: focusNode,
                          validator: context.validateFieldNotEmpty,
                          decoration: buildInputDecoration(
                            hint: AppStrings.enterYourLocation,
                          ),
                          onChanged: (value) {
                            _updateFloatingActionButtonVisibility();
                          },
                          onFieldSubmitted: (value) {
                            onFieldSubmitted();
                          },
                        );
                      },
                      optionsViewBuilder: (BuildContext context,
                          void Function(String) onSelected,
                          Iterable<String> options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            child: Container(
                              height: 220,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Scrollbar(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  children: options.map((String suggestion) {
                                    return Material(
                                      child: InkWell(
                                        onTap: () {
                                          onSelected(suggestion);
                                        },
                                        splashColor:
                                            AppColors.red.withOpacity(0.5),
                                        child: ListTile(
                                          title: Text(
                                            suggestion,
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    !irregularCycle
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.cycleRegularity,
                                style: AppTheme.themeData.textTheme.titleMedium,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppStrings.dayCycle,
                                          style: AppTheme
                                              .themeData.textTheme.labelSmall,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 50,
                                          child:
                                              DropdownButtonFormField<String>(
                                            menuMaxHeight: 200,
                                            // borderRadius:
                                            //     BorderRadius.circular(10),
                                            dropdownColor: Colors.white,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            style: AppTheme.themeData.textTheme
                                                .labelMedium!
                                                .copyWith(fontSize: 18),
                                            value: selectedDay,
                                            iconSize: 15,
                                            decoration:
                                                buildInputDecoration(hint: '_'),
                                            icon: const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: FaIcon(
                                                  FontAwesomeIcons.chevronDown),
                                            ),
                                            items: AppStrings.daysOfCycle
                                                .map(
                                                  (day) =>
                                                      DropdownMenuItem<String>(
                                                    value: day,
                                                    child: Text(
                                                      day,
                                                      style: AppTheme.themeData
                                                          .textTheme.labelSmall!
                                                          .copyWith(
                                                              fontSize: 16),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                            onChanged: (day) {
                                              selectedDay = day;
                                            },
                                            validator: (value) {
                                              if (value == null) {
                                                return AppStrings
                                                    .fieldIsRequired;
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const VerticalDivider(
                                      thickness: 0.5,
                                      color: AppColors.blackBlue,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppStrings.cycleLength,
                                          style: AppTheme
                                              .themeData.textTheme.labelSmall,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 50,
                                          child:
                                              DropdownButtonFormField<String>(
                                            menuMaxHeight: 200,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            dropdownColor: Colors.white,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            style: AppTheme.themeData.textTheme
                                                .labelMedium!
                                                .copyWith(fontSize: 18),
                                            value: selectedLength,
                                            iconSize: 15,
                                            decoration:
                                                buildInputDecoration(hint: '_'),
                                            icon: const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: FaIcon(
                                                  FontAwesomeIcons.chevronDown),
                                            ),
                                            items: AppStrings.lengthOfCycle
                                                .map(
                                                  (day) =>
                                                      DropdownMenuItem<String>(
                                                    value: day,
                                                    child: Text(
                                                      day,
                                                      style: AppTheme.themeData
                                                          .textTheme.labelSmall!
                                                          .copyWith(
                                                              fontSize: 16),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                            onChanged: (length) {
                                              selectedLength = length;
                                            },
                                            validator: (value) {
                                              if (value == null) {
                                                return AppStrings
                                                    .fieldIsRequired;
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const VerticalDivider(
                                      thickness: 0.5,
                                      color: AppColors.blackBlue,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppStrings.periodLength,
                                          style: AppTheme
                                              .themeData.textTheme.labelSmall,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 50,
                                          child:
                                              DropdownButtonFormField<String>(
                                            menuMaxHeight: 200,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            dropdownColor: Colors.white,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            style: AppTheme.themeData.textTheme
                                                .labelMedium!
                                                .copyWith(fontSize: 18),
                                            value: selectedPeriod,
                                            iconSize: 15,
                                            decoration:
                                                buildInputDecoration(hint: '_'),
                                            icon: const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: FaIcon(
                                                  FontAwesomeIcons.chevronDown),
                                            ),
                                            items: AppStrings.periodLengthOfCycle
                                                .map(
                                                  (day) =>
                                                      DropdownMenuItem<String>(
                                                    value: day,
                                                    child: Text(
                                                      day,
                                                      style: AppTheme.themeData
                                                          .textTheme.labelSmall!
                                                          .copyWith(
                                                              fontSize: 16),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                            onChanged: (period) {
                                              selectedPeriod = period;
                                            },
                                            validator: (value) {
                                              if (value == null) {
                                                return AppStrings
                                                    .fieldIsRequired;
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          )
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Row(
                        children: [
                          AppCheckbox(
                              value: irregularCycle,
                              onChanged: (v) {
                                _updateFloatingActionButtonVisibility();
                                setState(() {
                                  irregularCycle = v!;
                                });
                              },
                              borderColor: AppColors.red),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            AppStrings.irregularCycle,
                            style: AppTheme.themeData.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          AppCheckbox(
                              value: allergy,
                              onChanged: (v) {
                                _updateFloatingActionButtonVisibility();
                                setState(() {
                                  allergy = v!;
                                });
                              },
                              borderColor: AppColors.red),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            AppStrings.allergyAsk,
                            style: AppTheme.themeData.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    allergy
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  AppStrings.haveAllergy,
                                  style:
                                      AppTheme.themeData.textTheme.titleMedium,
                                ),
                              ),
                              TextFormField(
                                maxLines: 3,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: allergyController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  hintText: AppStrings.allergy,
                                  hintStyle:
                                      AppTheme.themeData.textTheme.titleSmall,
                                  prefix: const SizedBox(
                                    width: 10,
                                  ),
                                ),
                                validator: context.validateFieldNotEmpty,
                                onChanged: (text) {
                                  _updateFloatingActionButtonVisibility();
                                  allergyList = text
                                      .split(',')
                                      .map((letter) => letter.trim())
                                      .toList();
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        AppStrings.food,
                        style: AppTheme.themeData.textTheme.titleMedium,
                      ),
                    ),
                    TextFormField(
                      maxLines: 3,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: foodController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        hintText: AppStrings.foodIDontEat,
                        hintStyle: AppTheme.themeData.textTheme.titleSmall,
                        prefix: const SizedBox(
                          width: 10,
                        ),
                      ),
                      // validator: context.validateFieldNotEmpty,
                      onChanged: (text) {
                        _updateFloatingActionButtonVisibility();
                        setState(() {
                          foodList = text
                              .split(',')
                              .map((letter) => letter.trim())
                              .toList();
                        });
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: isFormFilled
          ? FloatingActionButton(
              backgroundColor: AppColors.red,
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                _formKey.currentState!.save();
                context.read<ProfileBloc>().add(
                      ProfileEvent.updateData(
                        account: UserAccount(
                          name: nameController.text,
                          birthDate: birthDateController.text,
                          location: location.toJson(),
                          dayCycle: selectedDay ?? '',
                          cycleLength: selectedLength ?? '',
                          periodLength: selectedPeriod ?? '',
                          irregularCycle: irregularCycle,
                          haveAllergy: allergy,
                          allergy: allergyList,
                          foodDontIt: foodList,
                          currentDate: user.currentDate,
                        ),
                      ),
                    );
                setState(() {
                  isFormFilled = false;
                });
              },
              child: const Text(
                AppStrings.save,
                style: TextStyle(fontSize: 14),
              ),
            )
          : const SizedBox(),
    );
  }

  InputDecoration buildInputDecoration({required String hint}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      hintText: hint,
      hintStyle: AppTheme.themeData.textTheme.titleSmall,
      // prefix: const SizedBox(
      //   width: 10,
      // ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )),
    );
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/cities/cities.json');
    final data = await json.decode(response);
    setState(() {
      _items = (data as List).map((e) => Cities.fromJson(e)).toList();
    });
  }
}
showAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: const Text(
      AppStrings.cancel,
      style: TextStyle(color: AppColors.blackBlue),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text(
      AppStrings.logout,
      style: TextStyle(color: AppColors.blackBlue),
    ),
    onPressed: () {
      context.read<AuthBloc>().add(const AuthEvent.logout());
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    title: Text(AppStrings.warning,
        style: AppTheme.themeData.textTheme.titleSmall),
    content: Text(AppStrings.areYouSure,
        style: AppTheme.themeData.textTheme.bodySmall!
            .copyWith(color: Colors.black)),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}