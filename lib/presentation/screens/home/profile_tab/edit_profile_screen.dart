import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/extensions/validation.dart';
import 'package:nutrition_app/data/models/account/account.dart';
import 'package:nutrition_app/presentation/blocs/profile/profile_bloc.dart';
import 'package:nutrition_app/presentation/widgets/app_checkbox.dart';
import 'package:nutrition_app/presentation/widgets/colored_container.dart';
import '../../../../common/icons.dart';
import '../../../../common/strings.dart';
import '../../../../common/theme.dart';
import '../../../../data/models/cities/cities.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../widgets/app_elevated_button.dart';
import '../../../widgets/app_transparent_button.dart';
import '../../../widgets/birthdate_picker.dart';
import '../../../widgets/loading_indicator.dart';

class EditProfileScreen extends StatefulWidget {
  final void Function() previousPage;

  const EditProfileScreen({
    super.key,
    required this.previousPage,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
    foodList = user.foodDontIt!;
    allergyList = user.allergy!;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: ColoredContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
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
                    widget.previousPage();
                  },
                ),
                Text(
                  AppStrings.editProfile.toUpperCase(),
                  style: AppTheme.themeData.textTheme.headlineLarge!
                      .copyWith(fontSize: 16),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ),
      ),
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
                horizontal: 24,
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppStrings.nameSurname,
                      style: AppTheme.themeData.textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 20),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: nameController,
                        decoration: InputDecoration(
                          fillColor: AppColors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 15),
                          hintText: AppStrings.enterName,
                          hintStyle: AppTheme.themeData.textTheme.titleSmall!
                              .copyWith(color: AppColors.greu),
                          prefix: const SizedBox(
                            width: 10,
                          ),
                        ),
                        validator: context.validateFieldNotEmpty,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppStrings.birthday,
                      style: AppTheme.themeData.textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 20),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: birthDateController,
                        decoration: InputDecoration(
                          fillColor: AppColors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 15),
                          hintText: AppStrings.date,
                          hintStyle: AppTheme.themeData.textTheme.titleSmall!
                              .copyWith(color: AppColors.greu),
                          prefix: const SizedBox(
                            width: 10,
                          ),
                          suffixIcon: Transform.scale(
                            scale: 0.55,
                            child: SvgPicture.asset(
                              AppIcons.calendar,
                              color: AppColors.greu,
                            ),
                          ),
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
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppStrings.location,
                      style: AppTheme.themeData.textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 20),
                      child: Autocomplete<String>(
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
                                  .contains(
                                      textEditingValue.text.toLowerCase()))
                              .map((city) => '${city.name}, ${city.country}')
                              .toList();
                        },
                        onSelected: (String value) {
                          final pickedCity = _items.firstWhere(
                              (city) =>
                                  '${city.name}, ${city.country}' == value,
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            focusNode: focusNode,
                            validator: context.validateFieldNotEmpty,
                            decoration: InputDecoration(
                              fillColor: AppColors.white,
                              filled: true,
                              border: const OutlineInputBorder(),
                              hintText: AppStrings.enterYourLocation,
                              prefix: const SizedBox(
                                width: 10,
                              ),
                              suffixIcon: Transform.scale(
                                  scale: 0.55,
                                  child: SvgPicture.asset(
                                    AppIcons.location,
                                    color: AppColors.greu,
                                  )),
                              hintStyle: AppTheme
                                  .themeData.textTheme.titleSmall!
                                  .copyWith(color: AppColors.greu),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                            ),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Row(
                        children: [
                          AppCheckbox(
                              value: irregularCycle,
                              onChanged: (v) {
                                setState(() {
                                  irregularCycle = v!;
                                });
                              },
                              borderColor: AppColors.violet),
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
                    !irregularCycle
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                AppStrings.dayCycle,
                                style: AppTheme.themeData.textTheme.titleMedium,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 20),
                                child: DropdownButtonFormField<String>(
                                  menuMaxHeight: 200,
                                  // borderRadius:
                                  //     BorderRadius.circular(10),
                                  dropdownColor: Colors.white,

                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  style: AppTheme
                                      .themeData.textTheme.labelMedium!
                                      .copyWith(fontSize: 18),
                                  value: selectedDay,
                                  iconSize: 15,
                                  decoration: InputDecoration(
                                    fillColor: AppColors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 17, horizontal: 15),
                                    hintText: AppStrings.enterName,
                                    hintStyle: AppTheme
                                        .themeData.textTheme.titleSmall!
                                        .copyWith(color: AppColors.greu),
                                    prefix: const SizedBox(
                                      width: 10,
                                    ),
                                  ),
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
                                            style: AppTheme
                                                .themeData.textTheme.labelSmall!
                                                .copyWith(fontSize: 16),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (day) {
                                    selectedDay = day;
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return AppStrings.fieldIsRequired;
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                AppStrings.cycleLength,
                                style: AppTheme.themeData.textTheme.titleMedium,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 20),
                                child: DropdownButtonFormField<String>(
                                  menuMaxHeight: 200,
                                  borderRadius: BorderRadius.circular(10),
                                  dropdownColor: Colors.white,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  style: AppTheme
                                      .themeData.textTheme.labelMedium!
                                      .copyWith(fontSize: 18),
                                  value: selectedLength,
                                  iconSize: 15,
                                  decoration: InputDecoration(
                                    fillColor: AppColors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 17, horizontal: 15),
                                    hintText: AppStrings.enterName,
                                    hintStyle: AppTheme
                                        .themeData.textTheme.titleSmall!
                                        .copyWith(color: AppColors.greu),
                                    prefix: const SizedBox(
                                      width: 10,
                                    ),
                                  ),
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
                                            style: AppTheme
                                                .themeData.textTheme.labelSmall!
                                                .copyWith(fontSize: 16),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (length) {
                                    selectedLength = length;
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return AppStrings.fieldIsRequired;
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                AppStrings.periodLength,
                                style: AppTheme.themeData.textTheme.titleMedium,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 20),
                                child: DropdownButtonFormField<String>(
                                  menuMaxHeight: 200,
                                  borderRadius: BorderRadius.circular(10),
                                  dropdownColor: Colors.white,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  style: AppTheme
                                      .themeData.textTheme.labelMedium!
                                      .copyWith(fontSize: 18),
                                  value: selectedPeriod,
                                  iconSize: 15,
                                  decoration: InputDecoration(
                                    fillColor: AppColors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 17, horizontal: 15),
                                    hintText: AppStrings.enterName,
                                    hintStyle: AppTheme
                                        .themeData.textTheme.titleSmall!
                                        .copyWith(color: AppColors.greu),
                                    prefix: const SizedBox(
                                      width: 10,
                                    ),
                                  ),
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
                                            style: AppTheme
                                                .themeData.textTheme.labelSmall!
                                                .copyWith(fontSize: 16),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (period) {
                                    selectedPeriod = period;
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return AppStrings.fieldIsRequired;
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          AppCheckbox(
                              value: allergy,
                              onChanged: (v) {
                                setState(() {
                                  allergy = v!;
                                });
                              },
                              borderColor: AppColors.violet),
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
                                  AppStrings.dietaryRestrictionsShort,
                                  style:
                                      AppTheme.themeData.textTheme.titleMedium,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 20),
                                child: TextFormField(
                                  maxLines: 3,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: allergyController,
                                  decoration: InputDecoration(
                                    fillColor: AppColors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 17, horizontal: 15),
                                    hintText: AppStrings.allergy,
                                    hintStyle: AppTheme
                                        .themeData.textTheme.titleSmall!
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
                              ),
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        AppStrings.foodPreferencesShort,
                        style: AppTheme.themeData.textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 20),
                      child: TextFormField(
                        maxLines: 3,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: foodController,
                        decoration: InputDecoration(
                          fillColor: AppColors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 15),
                          hintText: AppStrings.foodIDontEat,
                          hintStyle: AppTheme.themeData.textTheme.titleSmall!
                              .copyWith(color: AppColors.greu),
                          prefix: const SizedBox(
                            width: 10,
                          ),
                        ),
                        // validator: context.validateFieldNotEmpty,
                        onChanged: (text) {
                          // setState(() {
                          foodList = text
                              .split(',')
                              .map((letter) => letter.trim())
                              .toList();
                          // });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 140,
                          child: AppElevatedButton(
                            text: AppStrings.save,
                            style: AppTheme.themeData.textTheme.titleMedium!
                                .copyWith(color: AppColors.white),
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              DateTime currentDate = DateTime.now();
                              String formattedDate = DateFormat('yyyy-M-d').format(currentDate);
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
                                        currentDate: formattedDate,
                                      ),
                                    ),
                                  );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            AppStrings.or,
                            style: AppTheme.themeData.textTheme.titleSmall,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showDeleteBottomSheet(context);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text( AppStrings.deleteMyAccount,
                            style: AppTheme.themeData.textTheme.titleMedium!
                                .copyWith(color: AppColors.violet),),
                        ),
                      ],
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

showDeleteBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height/2.55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 35),
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
                child: Text(AppStrings.deleteYourAccount.toUpperCase(),
                    style: AppTheme.themeData.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    )),
              ),
              const Divider(color: Color(0xFFEEEEEE),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(AppStrings.areYouSureDeleteAccount,
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
                              .copyWith(color: AppColors.violet), onPressed: () {Navigator.pop(context);}),
                    ),
                    SizedBox(
                      width: 159,

                      child: AppElevatedButton(

                          text: AppStrings.delete, style: AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(color: AppColors.white),onPressed: () {}),
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
