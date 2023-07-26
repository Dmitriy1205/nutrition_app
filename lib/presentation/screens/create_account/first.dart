import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nutrition_app/common/extensions/validation.dart';
import 'package:nutrition_app/common/icons.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';

import '../../../common/colors.dart';
import '../../../common/theme.dart';
import '../../../data/models/cities/cities.dart';
import '../../widgets/birthdate_picker.dart';

class First extends StatefulWidget {
  final void Function(String name, String birthDate, Map<String, dynamic> location) nextPage;

  const First({super.key, required this.nextPage});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  late Cities location;

  List<Cities> _items = [];

  String selectedCity = '';

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    birthDateController.dispose();
    searchController.dispose();
    super.dispose();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/cities/cities.json');
    final data = await json.decode(response);
    setState(() {
      _items = (data as List).map((e) => Cities.fromJson(e)).toList();
    });
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
                  AppStrings.accountConfirmation,
                  style: AppTheme.themeData.textTheme.headlineLarge,
                ),
                Text(
                  AppStrings.letsPersonalize,
                  style: AppTheme.themeData.textTheme.titleSmall!
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppStrings.nameSurname,
                  style: AppTheme.themeData.textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: nameController,
                  style: AppTheme.themeData.textTheme.labelSmall!
                      .copyWith(fontSize: 14),
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
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppStrings.birthday,
                  style: AppTheme.themeData.textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: birthDateController,
                  style: AppTheme.themeData.textTheme.labelSmall!
                      .copyWith(fontSize: 14),
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
                        )),
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
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppStrings.location,
                  style: AppTheme.themeData.textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    // final items = _items.where((city) => city.name!.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                    // city = Cities(name: items.)
                    // final showCity = items.map((city) => '${city.name}, ${city.country}').toList();
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
                      FocusScope.of(context).unfocus();
                    });
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: AppTheme.themeData.textTheme.labelSmall!
                          .copyWith(fontSize: 14),
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
                            )),
                        hintStyle: AppTheme.themeData.textTheme.titleSmall!
                            .copyWith(color: AppColors.greu),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                      ),
                      onChanged: (value) {
                        // ...
                      },
                      onFieldSubmitted: (value) {
                        focusNode.unfocus();
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
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
                                    splashColor: AppColors.red.withOpacity(0.5),
                                    child: ListTile(
                                      title: Text(
                                        suggestion,
                                        style: const TextStyle(fontSize: 16),
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
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 6),
                  child: AppElevatedButton(
                      text: AppStrings.next,
                      style: AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(color: AppColors.white),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState!.save();
                        widget.nextPage(
                          nameController.text,
                          birthDateController.text,
                          location.toJson(),
                        );
                        // context
                        //     .read<CreateAccountBloc>()
                        //     .add(CreateAccountEvent.createFields(account: {
                        //       'name': nameController.text,
                        //       'birthDate': birthDateController.text,
                        //       'location': location.toJson()
                        //     }));
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
