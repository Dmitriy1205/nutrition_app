import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/data/models/recipe/recipe.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';
import 'package:nutrition_app/presentation/widgets/colored_container.dart';

import '../../../../common/colors.dart';
import '../../../../common/theme.dart';
import '../../../../data/models/mood.dart';
import '../../../blocs/mood/mood_bloc.dart';

class FoodScreen extends StatefulWidget {
  final void Function() nextPage;
  final void Function() previousPage;

  const FoodScreen(
      {super.key, required this.nextPage, required this.previousPage});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  late Mood mood;
  int? moodIndex;
  int selectedCount = 0;
  TextEditingController nameController = TextEditingController();
  List<bool> isSelected = [];
  List<String> addedCravings = [];
  bool isFirstTimeSelected = true;

  @override
  void initState() {
    if (moodList.any((element) =>
        element.name == context.read<MoodBloc>().state.recipe!.mood!)) {
      moodIndex = moodList.indexWhere((element) =>
          element.name == context.read<MoodBloc>().state.recipe!.mood!);
      mood = moodList[moodIndex!];
      isSelected = List<bool>.generate(mood.foodList.length, (index) => false);
    } else {
      moodIndex = null;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: moodIndex == null
            ? Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ListView(
                    physics: const ClampingScrollPhysics(),
                    children: [
                      ColoredContainer(

                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 7),
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
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  widget.previousPage();
                                },
                              ),
                              Text(
                                AppStrings.howDoYouFeel.toUpperCase(),
                                style: AppTheme.themeData.textTheme.titleLarge!
                                    .copyWith(fontSize: 12),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${AppStrings.iFeel} ${context.read<MoodBloc>().state.recipe?.mood}',
                            style: AppTheme.themeData.textTheme.headlineLarge!
                                .copyWith(
                                    fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {
                              widget.previousPage();
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: RichText(
                              text: const TextSpan(
                                text: AppStrings.edit,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2.0,
                                  color: AppColors.darkGrey,
                                  decorationColor: AppColors
                                      .darkGrey, // Adjust the color of the underline.
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 6),
                        child: Text(
                          AppStrings.writeWishes,
                          style: AppTheme.themeData.textTheme.headlineLarge!
                              .copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: nameController,
                        style: AppTheme.themeData.textTheme.labelSmall!
                            .copyWith(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: 'I want (ex. duck, bowl etc)...',
                          hintStyle: AppTheme.themeData.textTheme.titleSmall!
                              .copyWith(color: AppColors.greu),
                          fillColor: AppColors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 15),
                          prefix: const SizedBox(
                            width: 10,
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) {
                              addedCravings.clear();
                            } else {
                              addedCravings.clear();
                              addedCravings = text
                                  .split(',')
                                  .map((letter) => letter.trim())
                                  .toList();
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    child: SizedBox(
                        width: 140,
                        child: AppElevatedButton(
                            text: AppStrings.next,
                            showArrow: true,
                            style: AppTheme.themeData.textTheme.titleMedium!
                                .copyWith(color: AppColors.white),
                            onPressed: addedCravings.isNotEmpty
                                ? () {
                                    context
                                        .read<MoodBloc>()
                                        .add(MoodEvent.setData(data: {
                                          RecipeFields.mood: context
                                              .read<MoodBloc>()
                                              .state
                                              .recipe!
                                              .mood!,
                                          RecipeFields.product: addedCravings
                                        }));
                                    widget.nextPage();
                                  }
                                : null)),
                  ),
                ],
              )
            : Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ListView(
                    physics: const ClampingScrollPhysics(),
                    children: [
                      ColoredContainer(

                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 7),
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
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  widget.previousPage();
                                },
                              ),
                              Text(
                                AppStrings.howDoYouFeel.toUpperCase(),
                                style: AppTheme.themeData.textTheme.titleLarge!
                                    .copyWith(fontSize: 12),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${AppStrings.iFeel} ${context.read<MoodBloc>().state.recipe?.mood ?? ''}',
                                style: AppTheme
                                    .themeData.textTheme.headlineLarge!
                                    .copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SvgPicture.asset(
                                mood.icon,
                                width: 35,
                                height: 35,
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              widget.previousPage();
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: RichText(
                              text: const TextSpan(
                                text: AppStrings.edit,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2.0,
                                  color: AppColors.darkGrey,
                                  decorationColor: AppColors
                                      .darkGrey, // Adjust the color of the underline.
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        AppStrings.chooseYourFood,
                        textAlign: TextAlign.center,
                        style: AppTheme.themeData.textTheme.headlineLarge!
                            .copyWith(
                                fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: List<Widget>.generate(mood.foodList.length,
                            (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: RawChip(
                              showCheckmark: false,
                              selected: isSelected[index],
                              onSelected: (selected) {
                                if (selected && selectedCount >= 3) {
                                  return;
                                }
                                setState(() {
                                  isSelected[index] = selected;
                                  selectedCount += selected ? 1 : -1;
                                  FocusScope.of(context).unfocus();
                                  if (selected && isFirstTimeSelected) {
                                    // Clear the addedCravings list only on the first time selection
                                    addedCravings = [];
                                    isFirstTimeSelected = false;
                                  }
                                  if (selected) {
                                    // Add the selected food item to the addedCravings list
                                    addedCravings.add(mood.foodList[index]);
                                  } else {
                                    // Remove the unselected food item from the addedCravings list
                                    addedCravings.remove(mood.foodList[index]);
                                  }
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              side: isSelected[index]
                                  ? const BorderSide(
                                      color: AppColors.violet, width: 2)
                                  : BorderSide.none,
                              selectedColor: isSelected[index]
                                  ? AppColors.violet
                                  : AppColors.background,
                              label: Text(
                                mood.foodList[index],
                                style: AppTheme.themeData.textTheme.titleSmall!
                                    .copyWith(
                                        color: !isSelected[index]
                                            ? Colors.black
                                            : AppColors.white),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 6),
                        child: Text(
                          AppStrings.orWriteWishes,
                          style: AppTheme.themeData.textTheme.headlineLarge!
                              .copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: nameController,
                        style: AppTheme.themeData.textTheme.labelSmall!
                            .copyWith(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: 'I want (ex. duck, bowl etc)...',
                          hintStyle: AppTheme.themeData.textTheme.titleSmall!
                              .copyWith(color: AppColors.greu),
                          fillColor: AppColors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 15),
                          prefix: const SizedBox(
                            width: 10,
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) {
                              addedCravings.clear();
                            } else {
                              selectedCount = 0;
                              addedCravings.clear();
                              addedCravings = text
                                  .split(',')
                                  .map((letter) => letter.trim())
                                  .toList();
                              isSelected = List<bool>.generate(
                                  mood.foodList.length, (index) => false);
                            }
                            // selectedMoodName = v;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    child: SizedBox(
                        width: 140,
                        child: AppElevatedButton(
                            text: AppStrings.next,
                            showArrow: true,
                            style: AppTheme.themeData.textTheme.titleMedium!
                                .copyWith(color: AppColors.white),
                            onPressed: addedCravings.isNotEmpty
                                ? () {
                                    context
                                        .read<MoodBloc>()
                                        .add(MoodEvent.setData(data: {
                                          RecipeFields.mood: context
                                              .read<MoodBloc>()
                                              .state
                                              .recipe!
                                              .mood!,
                                          RecipeFields.product: addedCravings
                                        }));
                                    widget.nextPage();
                                  }
                                : null)),
                  ),
                ],
              ),
      ),
    );
  }
}
