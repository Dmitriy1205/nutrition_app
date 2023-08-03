import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/screens/home/recipe_tab/loading_screen.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';
import 'package:nutrition_app/presentation/widgets/app_transparent_button.dart';
import 'package:nutrition_app/presentation/widgets/colored_container.dart';
import 'package:shimmer/shimmer.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../../../common/colors.dart';
import '../../../../common/functions.dart';
import '../../../../common/theme.dart';
import '../../../blocs/mood/mood_bloc.dart';
import '../../../blocs/profile/profile_bloc.dart';
import '../../../blocs/recipe/recipe_bloc.dart';
import '../../../blocs/tutorial/tutorial_bloc.dart';

class GeneratedRecipeScreen extends StatefulWidget {
  final void Function() nextPage;
  final void Function() onDone;
  final void Function() previousPage;

  const GeneratedRecipeScreen({
    super.key,
    required this.nextPage,
    required this.previousPage, required this.onDone,
  });

  @override
  State<GeneratedRecipeScreen> createState() => _GeneratedRecipeScreenState();
}

class _GeneratedRecipeScreenState extends State<GeneratedRecipeScreen> {
  final SuperTooltipController thirdTooltipController =
      SuperTooltipController();
  final SuperTooltipController fourthTooltipController =
      SuperTooltipController();
  final ScrollController _scrollController = ScrollController();
  late String recipeName;
  late List<String> sections;
  late List<String> ingredientsList;
  late List<String> instructionsList;

  bool? isRecipe;
  bool? isRegenerate;

  @override
  void initState() {
    super.initState();
    isRecipe = context.read<TutorialBloc>().state.tutorial!.isRecipeButton!;
    isRegenerate =
        context.read<TutorialBloc>().state.tutorial!.isRegenerateRecipe!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocListener<TutorialBloc, TutorialState>(
        listener: (context, state) {
          state.maybeMap(
              loaded: (_) {
                setState(() {
                  isRecipe = state.tutorial!.isRecipeButton;
                  isRegenerate = state.tutorial!.isRegenerateRecipe;
                });
              },
              orElse: () {});
        },
        child: BlocConsumer<RecipeBloc, RecipeState>(
          listener: (context, state) {
            state.maybeMap(
                textGenerated: (_) {
                  setState(() {
                    recipeName = extractRecipeName(state.recipeText!);
                    sections = extractSections(state.recipeText!);
                    int instructionsIndex = sections.indexOf('Instructions:');

                    ingredientsList = sections
                        .sublist(1, instructionsIndex)
                        .map((section) => section.trim())
                        .toList();

                    instructionsList = sections
                        .sublist(instructionsIndex + 1)
                        .map((section) => section.trim())
                        .toList();
                    context
                        .read<RecipeBloc>()
                        .add(RecipeEvent.generateImage(recipeName: recipeName));
                    Future.delayed(const Duration(seconds: 1), () {
                      thirdTooltipController.showTooltip();
                    });
                  });
                },
                orElse: () {});
          },
          builder: (context, state) {
            return state.maybeMap(
              error: (e) => Center(
                child: Text(e.error),
              ),
              textGenerating: (_) => const LoadingScreen(),
              orElse: () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ListView(
                      controller: _scrollController,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
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
                                      size: 20,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  widget.previousPage();
                                },
                              ),
                              !isRegenerate!
                                  ? GestureDetector(
                                      onTap: () {
                                        List<String> excludeList = context
                                                .read<ProfileBloc>()
                                                .state
                                                .user!
                                                .foodDontIt! +
                                            context
                                                .read<ProfileBloc>()
                                                .state
                                                .user!
                                                .allergy!;
                                        context.read<RecipeBloc>().add(
                                              RecipeEvent.generateRecipe(
                                                  phase: context
                                                      .read<ProfileBloc>()
                                                      .state
                                                      .phase!,
                                                  mood: context
                                                      .read<MoodBloc>()
                                                      .state
                                                      .recipe!
                                                      .mood!,
                                                  exclude: excludeList,
                                                  recipeName: recipeName),
                                            );
                                      },
                                      child: Text(
                                        AppStrings.badRecipe,
                                        style: AppTheme
                                            .themeData.textTheme.titleMedium!
                                            .copyWith(color: AppColors.violet),
                                      ),
                                    )
                                  : Stack(
                                      children: [
                                        Text(
                                          AppStrings.badRecipe,
                                          style: AppTheme
                                              .themeData.textTheme.titleMedium!
                                              .copyWith(
                                                  color: AppColors.violet),
                                        ),
                                        Positioned(
                                          bottom: 2,
                                          right: 22,
                                          child: SuperTooltip(
                                            controller: thirdTooltipController,
                                            arrowLength: 8,
                                            arrowBaseWidth: 12,
                                            barrierColor: Colors.transparent,
                                            backgroundColor: Colors.black,
                                            shadowColor: Colors.transparent,
                                            content: Padding(
                                              padding: EdgeInsets.zero,
                                              child: Text(
                                                'Report if you got issue',
                                                style: AppTheme.themeData
                                                    .textTheme.titleSmall!
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                            ),
                                            onHide: () {
                                              Future.delayed(
                                                  const Duration(seconds: 1),
                                                  () {
                                                fourthTooltipController
                                                    .showTooltip();
                                              });
                                              _scrollController.animateTo(
                                                _scrollController
                                                    .position.maxScrollExtent,
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                curve: Curves.easeInOut,
                                              );

                                              context.read<TutorialBloc>().add(
                                                      const TutorialEvent
                                                              .updateTutorial(
                                                          data: {
                                                        "isRegenerateRecipe":
                                                            false
                                                      }));
                                            },
                                            child: Image.asset(
                                              'assets/images/red_dot.png',
                                              width: 15,
                                              height: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          recipeName,
                          textAlign: TextAlign.center,
                          style: AppTheme.themeData.textTheme.headlineLarge!
                              .copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        // Ingredients
                        ColoredContainer(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Center(
                              child: Text(
                                'Ingredients:'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: ingredientsList.map((ingredient) {
                            return Text(
                              ingredient.replaceAll('-', '•   '),
                              strutStyle: const StrutStyle(height: 2.2),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.violet,
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF7E92F8),
                                  Color(0xFF7F6CFF),
                                ],
                                stops: [
                                  0.1,
                                  0.9,
                                ],
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(AppStrings.upgradeToPremium,
                                          style: AppTheme.themeData.textTheme
                                              .headlineLarge!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700)),
                                      const SizedBox(height: 6),
                                      Text(AppStrings.enjoyAll,
                                          style: AppTheme.themeData.textTheme
                                              .headlineLarge!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Instructions
                        ColoredContainer(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Center(
                              child: Text(
                                'Instructions:'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: instructionsList.map((instruction) {
                            RegExp regex = RegExp(r"^(\d+\.\s|Note:\s)");
                            Match? match = regex.firstMatch(instruction);
                            if (match != null) {
                              // Extract the number part and the rest of the text
                              String numberPart = match.group(0)!;
                              String restOfText =
                                  instruction.substring(match.end);

                              return RichText(
                                strutStyle: const StrutStyle(height: 2.2),
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: numberPart.replaceAll('.', '.  '),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: restOfText.replaceAll("sautÃ©", "saute").replaceAll("Â", ""),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Text(
                                instruction.replaceAll(':', ': '),
                                strutStyle: const StrutStyle(height: 2.2),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              );
                            }
                          }).toList(),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Image.asset(
                            'assets/images/apetit.png',
                            width: 80,
                            height: 120,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 300.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: state.maybeMap(
                            imageGenerating: (_) => Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.grey.shade200,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            orElse: () => ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                state.recipeImage!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        !isRecipe!
                            ? AppElevatedButton(
                                showPrefix: true,
                                text: AppStrings.saveToGallery,
                                style: AppTheme.themeData.textTheme.titleMedium!
                                    .copyWith(color: AppColors.white),
                                onPressed: () {})
                            : Stack(
                                children: [
                                  AppElevatedButton(
                                      showPrefix: true,
                                      text: AppStrings.saveToGallery,
                                      style: AppTheme
                                          .themeData.textTheme.titleMedium!
                                          .copyWith(color: AppColors.white),
                                      onPressed: () {}),
                                  Positioned(
                                    top: 5,
                                    right: 82,
                                    child: SuperTooltip(
                                      onHide: () {
                                        context.read<TutorialBloc>().add(
                                                const TutorialEvent
                                                    .updateTutorial(data: {
                                              "isRecipeButton": false
                                            }));
                                      },
                                      popupDirection: TooltipDirection.up,
                                      controller: fourthTooltipController,
                                      arrowLength: 8,
                                      arrowBaseWidth: 12,
                                      barrierColor: Colors.transparent,
                                      backgroundColor: Colors.black,
                                      shadowColor: Colors.transparent,
                                      content: Padding(
                                        padding: EdgeInsets.zero,
                                        child: Text(
                                          'Save to favourites',
                                          style: AppTheme
                                              .themeData.textTheme.titleSmall!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
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
                        const SizedBox(
                          height: 20,
                        ),
                        AppTransparentButton(
                            text: AppStrings.done,
                            style: AppTheme.themeData.textTheme.titleMedium!
                                .copyWith(color: AppColors.violet),
                            onPressed: () {
                              widget.onDone();
                            }),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
