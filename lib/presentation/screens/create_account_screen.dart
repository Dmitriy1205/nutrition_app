// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:nutrition_app/common/colors.dart';
// import 'package:nutrition_app/common/extensions/validation.dart';
// import 'package:nutrition_app/data/models/account/account.dart';
// import 'package:nutrition_app/presentation/widgets/app_checkbox.dart';
//
// import '../../common/strings.dart';
// import '../../common/theme.dart';
// import '../../data/models/cities/cities.dart';
// import '../blocs/create_account/create_account_bloc.dart';
// import '../widgets/app_elevated_button.dart';
// import '../widgets/birthdate_picker.dart';
// import '../widgets/loading_indicator.dart';
//
// class CreateAccountScreen extends StatefulWidget {
//   const CreateAccountScreen({super.key});
//
//   @override
//   State<CreateAccountScreen> createState() => _CreateAccountScreenState();
// }
//
// class _CreateAccountScreenState extends State<CreateAccountScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController birthDateController = TextEditingController();
//   TextEditingController searchController = TextEditingController();
//   TextEditingController allergyController = TextEditingController();
//   TextEditingController foodController = TextEditingController();
//
//   String? selectedDay;
//   String? selectedLength;
//   String? selectedPeriod;
//   bool allergy = false;
//   bool irregularCycle = false;
//   List<Cities> _items = [];
//   List<String> allergyList = [];
//   List<String> foodList = [];
//   late Cities location;
//
//   String selectedCity = '';
//
//   @override
//   void initState() {
//     readJson();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     birthDateController.dispose();
//     searchController.dispose();
//     allergyController.dispose();
//     foodController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<CreateAccountBloc, CreateAccountState>(
//         listener: (context, state) {
//           state.maybeMap(
//               error: (e) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     backgroundColor: AppColors.red,
//                     duration: const Duration(seconds: 5),
//                     content: Text(
//                       e.error,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 );
//               },
//               orElse: () {});
//         },
//         builder: (context, state) {
//           return state.maybeMap(
//             loading: (_) => const LoadingIndicator(),
//             orElse: () => Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 34,
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: ListView(
//                   children: [
//                     const SizedBox(
//                       height: 20,
//                     ),
//
//                     Align(
//                         alignment: Alignment.center,
//                         child: Text(
//                           AppStrings.accountConfirmation,
//                           style: AppTheme.themeData.textTheme.headlineLarge,
//                         )),
//
//                     Align(
//                         alignment: Alignment.center,
//                         child: Text(
//                           AppStrings.letsPersonalize,
//                           style: AppTheme.themeData.textTheme.headlineSmall,
//                         )),
//                     const SizedBox(
//                       height: 70,
//                     ),
//                     TextFormField(
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       controller: nameController,
//                       decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 10),
//                         hintText: AppStrings.nameSurname,
//                         hintStyle: AppTheme.themeData.textTheme.titleSmall,
//                         prefix: const SizedBox(
//                           width: 10,
//                         ),
//                       ),
//                       validator: context.validateFieldNotEmpty,
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     TextFormField(
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       controller: birthDateController,
//                       decoration: InputDecoration(
//                         contentPadding:
//                             EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                         hintText: AppStrings.birthday,
//                         hintStyle: AppTheme.themeData.textTheme.titleSmall,
//                         prefix: const SizedBox(
//                           width: 10,
//                         ),
//                       ),
//                       validator: context.validateFieldNotEmpty,
//                       onTap: () async {
//                         DateTime? date = DateTime(1900);
//
//                         FocusScope.of(context).requestFocus(FocusNode());
//                         date = await Picker().birthDatePicker(context);
//
//                         final formattedDate =
//                             DateFormat('d/MMM/yyyy').format(date!);
//                         birthDateController.text = formattedDate;
//                       },
//                       onSaved: (value) {
//                         birthDateController.text = value!.trim();
//                       },
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     // DropdownButtonFormField<String>(
//                     //   autovalidateMode: AutovalidateMode.onUserInteraction,
//                     //   style: AppTheme.themeData.textTheme.labelMedium!
//                     //       .copyWith(fontSize: 18),
//                     //   value: selectedPhaze,
//                     //   iconSize: 15,
//                     //   decoration: const InputDecoration(
//                     //     hintText: 'Cycle Phase',
//                     //       isDense: true,
//                     //       prefix: SizedBox(
//                     //         width: 6,
//                     //       ),
//                     //       contentPadding:
//                     //           EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                     //       border: OutlineInputBorder()),
//                     //   icon: const Padding(
//                     //     padding: EdgeInsets.only(right: 8.0),
//                     //     child: FaIcon(FontAwesomeIcons.chevronDown),
//                     //   ),
//                     //   items: AppStrings.phazes
//                     //       .map(
//                     //         (phaze) => DropdownMenuItem<String>(
//                     //           value: phaze,
//                     //           child: Text(
//                     //             phaze,
//                     //             style: AppTheme.themeData.textTheme.labelSmall!
//                     //                 .copyWith(fontSize: 16),
//                     //           ),
//                     //         ),
//                     //       )
//                     //       .toList(),
//                     //   onChanged: (role) {
//                     //     setState(() {
//                     //       selectedPhaze = role;
//                     //     });
//                     //   },
//                     //   validator: (value) {
//                     //     if (value == null) {
//                     //       return AppStrings.fieldIsRequired;
//                     //     }
//                     //   },
//                     // ),
//                     // TextFormField(
//                     //   autovalidateMode: AutovalidateMode.onUserInteraction,
//                     //   // controller: _emailController,
//                     //   decoration: InputDecoration(
//                     //     contentPadding: EdgeInsets.symmetric(
//                     //         vertical: 15, horizontal: 10),
//                     //     hintText: AppStrings.location,
//                     //     hintStyle: AppTheme.themeData.textTheme.titleSmall,
//                     //     prefix: SizedBox(
//                     //       width: 10,
//                     //     ),
//                     //   ),
//                     //   validator: context.validateFieldNotEmpty,
//                     // ),
//                     Autocomplete<String>(
//                       optionsBuilder: (TextEditingValue textEditingValue) {
//                         if (textEditingValue.text.isEmpty) {
//                           return const Iterable<String>.empty();
//                         }
//                         // final items = _items.where((city) => city.name!.toLowerCase().contains(textEditingValue.text.toLowerCase()));
//                         // city = Cities(name: items.)
//                         // final showCity = items.map((city) => '${city.name}, ${city.country}').toList();
//                         return _items
//                             .where((city) => city.name!
//                                 .toLowerCase()
//                                 .contains(textEditingValue.text.toLowerCase()))
//                             .map((city) => '${city.name}, ${city.country}')
//                             .toList();
//                       },
//                       onSelected: (String value) {
//                         final pickedCity = _items.firstWhere(
//                             (city) => '${city.name}, ${city.country}' == value,
//                             orElse: () => const Cities());
//                         setState(() {
//                           location = Cities(
//                             country: pickedCity.country,
//                             name: pickedCity.name,
//                             lat: pickedCity.lat,
//                             lng: pickedCity.lng,
//                           );
//                           selectedCity = value;
//                           searchController.text = value;
//                         });
//                       },
//                       fieldViewBuilder: (BuildContext context,
//                           TextEditingController textEditingController,
//                           FocusNode focusNode,
//                           VoidCallback onFieldSubmitted) {
//                         return TextFormField(
//                           controller: textEditingController,
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           focusNode: focusNode,
//                           validator: context.validateFieldNotEmpty,
//                           decoration: InputDecoration(
//                             border: const OutlineInputBorder(),
//                             hintText: AppStrings.enterYourLocation,
//                             prefix: const SizedBox(
//                               width: 10,
//                             ),
//                             hintStyle: AppTheme.themeData.textTheme.titleSmall,
//                             contentPadding: const EdgeInsets.symmetric(
//                                 vertical: 15, horizontal: 10),
//                           ),
//                           onChanged: (value) {
//                             // ...
//                           },
//                           onFieldSubmitted: (value) {
//                             onFieldSubmitted();
//                           },
//                         );
//                       },
//                       optionsViewBuilder: (BuildContext context,
//                           void Function(String) onSelected,
//                           Iterable<String> options) {
//                         return Align(
//                           alignment: Alignment.topLeft,
//                           child: Material(
//                             child: Container(
//                               height: 220,
//                               width: MediaQuery.of(context).size.width / 1.2,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(8.0)),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.5),
//                                     spreadRadius: 2,
//                                     blurRadius: 5,
//                                     offset: const Offset(0, 3),
//                                   ),
//                                 ],
//                               ),
//                               child: Scrollbar(
//                                 child: ListView(
//                                   padding: EdgeInsets.zero,
//                                   shrinkWrap: true,
//                                   children: options.map((String suggestion) {
//                                     return Material(
//                                       child: InkWell(
//                                         onTap: () {
//                                           onSelected(suggestion);
//                                         },
//                                         splashColor:
//                                             AppColors.red.withOpacity(0.5),
//                                         child: ListTile(
//                                           title: Text(
//                                             suggestion,
//                                             style:
//                                                 const TextStyle(fontSize: 16),
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//
//                     !irregularCycle
//                         ? Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 AppStrings.cycleRegularity,
//                                 style: AppTheme.themeData.textTheme.titleMedium,
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         AppStrings.dayCycle,
//                                         style: AppTheme
//                                             .themeData.textTheme.labelSmall,
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 100,
//                                         child: DropdownButtonFormField<String>(
//                                           menuMaxHeight: 200,
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           dropdownColor: Colors.white,
//                                           autovalidateMode: AutovalidateMode
//                                               .onUserInteraction,
//                                           style: AppTheme
//                                               .themeData.textTheme.labelMedium!
//                                               .copyWith(fontSize: 18),
//                                           value: selectedDay,
//                                           iconSize: 15,
//                                           decoration: InputDecoration(
//                                               isDense: true,
//                                               hintText: '_',
//                                               hintStyle: AppTheme.themeData
//                                                   .textTheme.titleSmall,
//                                               prefix: const SizedBox(
//                                                 width: 6,
//                                               ),
//                                               contentPadding:
//                                                   const EdgeInsets.symmetric(
//                                                       vertical: 15,
//                                                       horizontal: 10),
//                                               border:
//                                                   const OutlineInputBorder()),
//                                           icon: const Padding(
//                                             padding:
//                                                 EdgeInsets.only(right: 8.0),
//                                             child: FaIcon(
//                                                 FontAwesomeIcons.chevronDown),
//                                           ),
//                                           items: AppStrings.daysOfCycle
//                                               .map(
//                                                 (day) =>
//                                                     DropdownMenuItem<String>(
//                                                   value: day,
//                                                   child: Text(
//                                                     day,
//                                                     style: AppTheme.themeData
//                                                         .textTheme.labelSmall!
//                                                         .copyWith(fontSize: 16),
//                                                   ),
//                                                 ),
//                                               )
//                                               .toList(),
//                                           onChanged: (day) {
//                                             selectedDay = day;
//                                           },
//                                           validator: (value) {
//                                             if (value == null) {
//                                               return AppStrings.fieldIsRequired;
//                                             }
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         AppStrings.cycleLength,
//                                         style: AppTheme
//                                             .themeData.textTheme.labelSmall,
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 100,
//                                         child: DropdownButtonFormField<String>(
//                                           menuMaxHeight: 200,
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           dropdownColor: Colors.white,
//                                           autovalidateMode: AutovalidateMode
//                                               .onUserInteraction,
//                                           style: AppTheme
//                                               .themeData.textTheme.labelMedium!
//                                               .copyWith(fontSize: 18),
//                                           value: selectedLength,
//                                           iconSize: 15,
//                                           decoration: InputDecoration(
//                                               isDense: true,
//                                               hintText: '_',
//                                               hintStyle: AppTheme.themeData
//                                                   .textTheme.titleSmall,
//                                               prefix: SizedBox(
//                                                 width: 6,
//                                               ),
//                                               contentPadding:
//                                                   EdgeInsets.symmetric(
//                                                       vertical: 15,
//                                                       horizontal: 10),
//                                               border: OutlineInputBorder()),
//                                           icon: const Padding(
//                                             padding:
//                                                 EdgeInsets.only(right: 8.0),
//                                             child: FaIcon(
//                                                 FontAwesomeIcons.chevronDown),
//                                           ),
//                                           items: AppStrings.lengthOfCycle
//                                               .map(
//                                                 (day) =>
//                                                     DropdownMenuItem<String>(
//                                                   value: day,
//                                                   child: Text(
//                                                     day,
//                                                     style: AppTheme.themeData
//                                                         .textTheme.labelSmall!
//                                                         .copyWith(fontSize: 16),
//                                                   ),
//                                                 ),
//                                               )
//                                               .toList(),
//                                           onChanged: (length) {
//                                             selectedLength = length;
//                                           },
//                                           validator: (value) {
//                                             if (value == null) {
//                                               return AppStrings.fieldIsRequired;
//                                             }
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         AppStrings.periodLength,
//                                         style: AppTheme
//                                             .themeData.textTheme.labelSmall,
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 100,
//                                         child: DropdownButtonFormField<String>(
//                                           menuMaxHeight: 200,
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           dropdownColor: Colors.white,
//                                           autovalidateMode: AutovalidateMode
//                                               .onUserInteraction,
//                                           style: AppTheme
//                                               .themeData.textTheme.labelMedium!
//                                               .copyWith(fontSize: 18),
//                                           value: selectedPeriod,
//                                           iconSize: 15,
//                                           decoration: InputDecoration(
//                                               isDense: true,
//                                               hintText: '_',
//                                               hintStyle: AppTheme.themeData
//                                                   .textTheme.titleSmall,
//                                               prefix: const SizedBox(
//                                                 width: 6,
//                                               ),
//                                               contentPadding:
//                                                   const EdgeInsets.symmetric(
//                                                       vertical: 15,
//                                                       horizontal: 10),
//                                               border:
//                                                   const OutlineInputBorder()),
//                                           icon: const Padding(
//                                             padding:
//                                                 EdgeInsets.only(right: 8.0),
//                                             child: FaIcon(
//                                                 FontAwesomeIcons.chevronDown),
//                                           ),
//                                           items: AppStrings.periodOfCycle
//                                               .map(
//                                                 (day) =>
//                                                     DropdownMenuItem<String>(
//                                                   value: day,
//                                                   child: Text(
//                                                     day,
//                                                     style: AppTheme.themeData
//                                                         .textTheme.labelSmall!
//                                                         .copyWith(fontSize: 16),
//                                                   ),
//                                                 ),
//                                               )
//                                               .toList(),
//                                           onChanged: (period) {
//                                             selectedPeriod = period;
//                                           },
//                                           validator: (value) {
//                                             if (value == null) {
//                                               return AppStrings.fieldIsRequired;
//                                             }
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 30,
//                               ),
//                             ],
//                           )
//                         : const SizedBox(),
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 0),
//                       child: Row(
//                         children: [
//                           AppCheckbox(
//                               value: irregularCycle,
//                               onChanged: (v) {
//                                 setState(() {
//                                   irregularCycle = v!;
//                                 });
//                               },
//                               borderColor: AppColors.red),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Text(
//                             AppStrings.irregularCycle,
//                             style: AppTheme.themeData.textTheme.titleMedium,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: Row(
//                         children: [
//                           AppCheckbox(
//                               value: allergy,
//                               onChanged: (v) {
//                                 setState(() {
//                                   allergy = v!;
//                                 });
//                               },
//                               borderColor: AppColors.red),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Text(
//                             AppStrings.allergyAsk,
//                             style: AppTheme.themeData.textTheme.titleMedium,
//                           ),
//                         ],
//                       ),
//                     ),
//                     allergy
//                         ? Column(
//                             children: [
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               TextFormField(
//                                 maxLines: 3,
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                                 controller: allergyController,
//                                 decoration: InputDecoration(
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       vertical: 15, horizontal: 10),
//                                   hintText: AppStrings.allergy,
//                                   hintStyle:
//                                       AppTheme.themeData.textTheme.titleSmall,
//                                   prefix: const SizedBox(
//                                     width: 10,
//                                   ),
//                                 ),
//                                 validator: context.validateFieldNotEmpty,
//                                 onChanged: (text) {
//                                   allergyList = text
//                                       .split(',')
//                                       .map((letter) => letter.trim())
//                                       .toList();
//                                 },
//                               ),
//                             ],
//                           )
//                         : const SizedBox(),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     TextFormField(
//                       maxLines: 3,
//                       // autovalidateMode: AutovalidateMode.onUserInteraction,
//                       controller: foodController,
//                       decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 10),
//                         hintText: AppStrings.foodIDontEat,
//                         hintStyle: AppTheme.themeData.textTheme.titleSmall,
//                         prefix: const SizedBox(
//                           width: 10,
//                         ),
//                       ),
//                       // validator: context.validateFieldNotEmpty,
//                       onChanged: (text) {
//                         setState(() {
//                           foodList = text
//                               .split(',')
//                               .map((letter) => letter.trim())
//                               .toList();
//                         });
//                       },
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     AppElevatedButton(
//                         text: AppStrings.confirm.toUpperCase(),
//                         onPressed: () {
//                           if (!_formKey.currentState!.validate()) {
//                             return;
//                           }
//                           _formKey.currentState!.save();
//
//                           // context.read<CreateAccountBloc>().add(
//                           //       CreateAccountEvent.createFields(
//                           //         account: UserAccount(
//                           //           name: nameController.text,
//                           //           birthDate: birthDateController.text,
//                           //           location: location.toJson(),
//                           //           dayCycle: selectedDay ?? '',
//                           //           cycleLength: selectedLength ?? '',
//                           //           periodLength: selectedPeriod ?? '',
//                           //           irregularCycle: irregularCycle,
//                           //           haveAllergy: allergy,
//                           //           allergy: allergyList,
//                           //           foodDontIt: foodList,
//                           //         ),
//                           //       ),
//                           //     );
//                         }),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> readJson() async {
//     final String response =
//         await rootBundle.loadString('assets/cities/cities.json');
//     final data = await json.decode(response);
//     setState(() {
//       _items = (data as List).map((e) => Cities.fromJson(e)).toList();
//     });
//   }
// }
