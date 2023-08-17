// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nutrition_app/presentation/blocs/saved_recipe/saved_recipe_bloc.dart';
// import 'package:nutrition_app/presentation/blocs/saved_recipe/saved_recipe_bloc.dart';
//
// import '../../common/colors.dart';
// import '../../common/strings.dart';
// import '../../common/theme.dart';
// import '../screens/home/gallery_tab/gallery_screen.dart';
// import '../screens/recipe_description.dart';
// import 'app_elevated_button.dart';
// import 'app_transparent_button.dart';
// import 'colored_container.dart';
// import 'loading_indicator.dart';
//
// class CustomExpandedList extends StatefulWidget {
//   final List<Recipe> recipe;
//   final String header;
//
//   const CustomExpandedList({
//     super.key,
//     required this.recipe,
//     required this.header,
//   });
//
//   @override
//   State<CustomExpandedList> createState() => _CustomExpandedListState();
// }
//
// class _CustomExpandedListState extends State<CustomExpandedList> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0),
//       child: ExpandablePanel(
//         theme: const ExpandableThemeData(
//           hasIcon: false,
//           tapHeaderToExpand: true,
//         ),
//         header: SizedBox(
//           height: 40,
//           child: ColoredContainer(
//             child: Center(
//               child: Text(
//                 widget.header.toUpperCase(),
//                 style: AppTheme.themeData.textTheme.headlineLarge!
//                     .copyWith(fontSize: 17),
//               ),
//             ),
//           ),
//         ),
//         expanded: const SizedBox(),
//         collapsed: Padding(
//           padding: const EdgeInsets.only(top: 20.0),
//           child: BlocBuilder<SavedRecipeBloc, SavedRecipeState>(
//             builder: (context, state) {
//               return state.recipes == null ? SizedBox() :state.maybeMap(
//                 error: (e)=> Center(child: Text(e.error),),
//                 loading: (_) => const LoadingIndicator(),
//                 orElse: () => GridView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 25.0,
//                     mainAxisSpacing: 10.0,
//                     childAspectRatio: 0.54,
//                   ),
//                   itemCount: state.recipes!.length,
//                   itemBuilder: (context, index) {
//                     return Center(
//                       child: GestureDetector(
//                         onLongPress: () {
//                           showDeleteBottomSheet(context);
//                         },
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => RecipeDescription(
//                                       recipe: widget.recipe[index])));
//                         },
//                         child: Container(
//                           height: 278,
//                           width: 160,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white, width: 2),
//                             borderRadius: BorderRadius.circular(8),
//                             color: Colors.transparent,
//                           ),
//                           child: Stack(
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: const BorderRadius.only(
//                                         topRight: Radius.circular(8),
//                                         topLeft: Radius.circular(8)),
//                                     child: SizedBox(
//                                       height: 165,
//                                       width: 160,
//                                       child: Image.network(
//                                         state.recipes![index].img!,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5),
//                                     child: Text(
//                                       '12.08.2023',
//                                       style: AppTheme
//                                           .themeData.textTheme.headlineLarge!
//                                           .copyWith(
//                                               fontSize: 10,
//                                               fontWeight: FontWeight.w600,
//                                               color: AppColors.greu),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                       left: 10.0,
//                                       right: 30,
//                                     ),
//                                     child: Text(
//                                       state.recipes![index].name!,
//                                       textAlign: TextAlign.start,
//                                       style: AppTheme
//                                           .themeData.textTheme.headlineLarge!
//                                           .copyWith(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Positioned(
//                                 top: 2,
//                                 right: 2,
//                                 child: Container(
//                                   width: 40,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8),
//                                     color: AppColors.violet,
//                                   ),
//                                   child: const Center(
//                                     child: Icon(
//                                       Icons.bookmark,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
