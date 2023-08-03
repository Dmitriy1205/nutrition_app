import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition_app/common/functions.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/data/models/phase.dart';
import 'package:nutrition_app/data/models/recipe/recipe.dart';
import 'package:nutrition_app/presentation/blocs/profile/profile_bloc.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';
import 'package:nutrition_app/presentation/widgets/colored_container.dart';
import 'package:super_tooltip/super_tooltip.dart';
import '../../../../common/colors.dart';
import '../../../../common/theme.dart';
import '../../../../data/models/mood.dart';
import '../../../blocs/mood/mood_bloc.dart';
import '../../../blocs/tutorial/tutorial_bloc.dart';

class FoodScreen extends StatefulWidget {
  final void Function() nextPage;
  final void Function() previousPage;

  const FoodScreen(
      {super.key, required this.nextPage, required this.previousPage});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  Mood? mood;
  int selectedCount = 0;
  TextEditingController nameController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<bool> isSelected = [];
  List<String> addedCravings = [];
  List<String> allFoodsList = [];
  List<String> randomlySelectedFoods = [];
  bool isFirstTimeSelected = true;
  bool? isEditTut;
  bool? isFoodTut;

  final SuperTooltipController firstTooltipController =
      SuperTooltipController();
  final SuperTooltipController secondTooltipController =
      SuperTooltipController();

  @override
  void initState() {
    isEditTut = context.read<TutorialBloc>().state.tutorial!.isEditMood!;
    isFoodTut = context.read<TutorialBloc>().state.tutorial!.isFoodChoose!;
    Phase currentPhaseObject = phaseList.firstWhere(
        (phase) => phase.name == context.read<ProfileBloc>().state.phase);

    if (moodList.any((element) =>
        element.name == context.read<MoodBloc>().state.recipe!.mood!)) {
      mood = moodList.firstWhere(
          (mood) => mood.name == context.read<MoodBloc>().state.recipe!.mood!);
      allFoodsList.addAll(mood!.foodList);
      allFoodsList.addAll(currentPhaseObject.foodList);
      allFoodsList = allFoodsList.toSet().toList();
      isSelected = List<bool>.generate(allFoodsList.length, (index) => false);
    } else {
      allFoodsList.addAll(currentPhaseObject.foodList);

      isSelected = List<bool>.generate(allFoodsList.length, (index) => false);
    }

    randomlySelectedFoods = generateRandomFoodList(allFoodsList.length)
        .map((index) => allFoodsList[index])
        .toList();

    Future.delayed(const Duration(seconds: 1), () {
      firstTooltipController.showTooltip();
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TutorialBloc, TutorialState>(
      listener: (context, state) {
        state.maybeMap(
            loaded: (_) {
              setState(() {
                isEditTut = state.tutorial!.isEditMood;
                isFoodTut = state.tutorial!.isFoodChoose;
              });
            },
            orElse: () {});
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                ListView(
                  controller: _scrollController,
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
                              style: AppTheme.themeData.textTheme.headlineLarge!
                                  .copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            mood == null
                                ? const SizedBox()
                                : SvgPicture.asset(
                                    mood!.icon,
                                    width: 35,
                                    height: 35,
                                  ),
                          ],
                        ),
                        !isEditTut!
                            ? TextButton(
                                onPressed: () {
                                  widget.previousPage();
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
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
                              )
                            : Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 18.0, top: 5),
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
                                  Positioned(
                                    bottom: -2,
                                    left: 2,
                                    child: SuperTooltip(
                                      controller: firstTooltipController,
                                      arrowLength: 8,
                                      arrowBaseWidth: 12,
                                      barrierColor: Colors.transparent,
                                      backgroundColor: Colors.black,
                                      shadowColor: Colors.transparent,
                                      content: Padding(
                                        padding: EdgeInsets.zero,
                                        child: Text(
                                          'You can change your mood',
                                          style: AppTheme
                                              .themeData.textTheme.titleSmall!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      onHide: () {
                                        secondTooltipController.showTooltip();
                                        context.read<TutorialBloc>().add(
                                            const TutorialEvent.updateTutorial(
                                                data: {"isEditMood": false}));
                                      },
                                      child: Image.asset(
                                        'assets/images/red_dot.png',
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    RichText(
                      text: TextSpan(
                        style: AppTheme.themeData.textTheme.headlineLarge!
                            .copyWith(
                                fontSize: 20, fontWeight: FontWeight.w700),
                        children: [
                          const TextSpan(
                              text: '${AppStrings.chooseYourFood}  '),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.bottom,
                            child: Transform.translate(
                              offset: const Offset(0, 1),
                              child: Container(
                                margin: const EdgeInsets.only(top: 8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                color: AppColors.transparentBlue,
                                child: Text(
                                  AppStrings.basedOnMood.toUpperCase(),
                                  style: AppTheme
                                      .themeData.textTheme.headlineLarge!
                                      .copyWith(
                                          color: AppColors.violet,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    Wrap(
                      spacing: 15.0,
                      alignment: WrapAlignment.center,
                      runSpacing: 2.0,
                      children: List<Widget>.generate(
                          randomlySelectedFoods.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: !isFoodTut!
                              ? RawChip(
                                  labelPadding:
                                      EdgeInsets.symmetric(horizontal: 2),
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
                                        addedCravings
                                            .add(randomlySelectedFoods[index]);
                                      } else {
                                        // Remove the unselected food item from the addedCravings list
                                        addedCravings.remove(
                                            randomlySelectedFoods[index]);
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
                                    randomlySelectedFoods[index],
                                    style: AppTheme
                                        .themeData.textTheme.titleSmall!
                                        .copyWith(
                                            color: !isSelected[index]
                                                ? Colors.black
                                                : AppColors.white),
                                  ),
                                )
                              : Stack(
                                  children: [
                                    RawChip(
                                      labelPadding:
                                          EdgeInsets.symmetric(horizontal: 2),
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
                                            addedCravings.add(
                                                randomlySelectedFoods[index]);
                                          } else {
                                            // Remove the unselected food item from the addedCravings list
                                            addedCravings.remove(
                                                randomlySelectedFoods[index]);
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
                                        randomlySelectedFoods[index],
                                        style: AppTheme
                                            .themeData.textTheme.titleSmall!
                                            .copyWith(
                                                color: !isSelected[index]
                                                    ? Colors.black
                                                    : AppColors.white),
                                      ),
                                    ),
                                    if (index == 0)
                                      Positioned(
                                        top: 2,
                                        right: 22,
                                        child: SuperTooltip(
                                          left: 70,
                                          onHide: () {
                                            context.read<TutorialBloc>().add(
                                                    const TutorialEvent
                                                        .updateTutorial(data: {
                                                  "isFoodChoose": false
                                                }));
                                          },
                                          popupDirection: TooltipDirection.up,
                                          controller: secondTooltipController,
                                          arrowLength: 8,
                                          arrowBaseWidth: 12,
                                          barrierColor: Colors.transparent,
                                          backgroundColor: Colors.black,
                                          shadowColor: Colors.transparent,
                                          content: Padding(
                                            padding: EdgeInsets.zero,
                                            child: Text(
                                              'Select up to 3 cravings',
                                              style: AppTheme.themeData
                                                  .textTheme.titleSmall!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ),
                                          child: Image.asset(
                                            'assets/images/red_dot.png',
                                            width: 15,
                                            height: 15,
                                          ),
                                        ),
                                      ),
                                  ],
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
                      maxLength: 40,
                      inputFormatters: [LengthLimitingTextInputFormatter(40)],
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
                      onTap: () {
                        setState(() {
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });

                      },
                      onChanged: (text) {
                        setState(() {
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
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
                                randomlySelectedFoods.length, (index) => false);
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
                                  FocusScope.of(context).unfocus();
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
        ),
      ),
    );
  }
}
