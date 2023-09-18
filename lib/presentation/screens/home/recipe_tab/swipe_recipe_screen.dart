import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:nutrition_app/presentation/blocs/generate_recipes/generate_recipes_bloc.dart';
import 'package:nutrition_app/presentation/blocs/recipe/recipe_bloc.dart';
import 'package:nutrition_app/presentation/screens/home/home_screen.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../../../common/colors.dart';
import '../../../../common/services/service_locator.dart';
import '../../../../common/theme.dart';
import '../../../blocs/mood/mood_bloc.dart';
import '../../../blocs/profile/profile_bloc.dart';
import '../../../blocs/tutorial/tutorial_bloc.dart';

class SwipeRecipeScreen extends StatefulWidget {
  final List<String> excludeList;
  final void Function() nextPage;
  final void Function() previousPage;

  const SwipeRecipeScreen(
      {super.key,
      required this.nextPage,
      required this.previousPage,
      required this.excludeList});

  @override
  State<SwipeRecipeScreen> createState() => _SwipeRecipeScreenState();
}

class _SwipeRecipeScreenState extends State<SwipeRecipeScreen> {
  final SuperTooltipController swipeTooltipController =
      SuperTooltipController();
  String selectedRecipeName = '';
  int currentPage = 0;
  int itemsPerPage = 3;

  List<String> recipes = [];
  int currentCarouselIndex = 0;
  int totalCardCount = 4;
  bool? isSwipeTut;

  @override
  void initState() {
    isSwipeTut = context.read<TutorialBloc>().state.tutorial!.isSwipeCards!;
    Future.delayed(const Duration(seconds: 1), () {
      swipeTooltipController.showTooltip();
    });
    super.initState();
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
                  isSwipeTut = state.tutorial!.isSwipeCards;
                });
              },
              orElse: () {});
        },
        child: BlocConsumer<GenerateRecipesBloc, GenerateRecipesState>(
          listener: (context, state) {
            state.maybeMap(
                generated: (_) {
                  setState(() {
                    recipes.addAll(state.recipes!);
                  });
                },
                orElse: () {});
          },
          builder: (context, state) {
            return Stack(
              alignment: AlignmentDirectional.center,
              children: [
                ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: InkWell(
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
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        AppStrings.seletWhatUp,
                        // textAlign: TextAlign.center,
                        style: AppTheme.themeData.textTheme.headlineLarge!
                            .copyWith(
                                fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ),
                    // const SizedBox(
                    //   height:50,
                    // ),
                    // Text(
                    //   AppStrings.chooseYourRecipe,
                    //   textAlign: TextAlign.center,
                    //   style: AppTheme.themeData.textTheme.headlineLarge!
                    //       .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                    // ),
                    const SizedBox(
                      height: 58,
                    ),
                    !isSwipeTut!
                        ? CarouselSlider.builder(
                            itemCount: totalCardCount,
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                // height: 380,
                                // width: 350,
                                decoration: BoxDecoration(
                                  color: AppColors.transparentBlue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        state.maybeMap(
                                          generating: (_) => ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 3,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 16.0),
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.white,
                                                  highlightColor:
                                                      Colors.grey.shade200,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    height: 77,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          error: (e) {
                                            if (e.error.contains(
                                                'ClientException:Operation timed out')) {
                                              context.read<ProfileBloc>().add(
                                                  ProfileEvent.fetchData(
                                                      userId: context
                                                          .read<AuthBloc>()
                                                          .state
                                                          .user!
                                                          .uid));
                                            }
                                            return Center(child: Text(e.error));
                                          },
                                          orElse: () => ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: 3,
                                              itemBuilder: (c, innerIndex) {
                                                final currentIndex =
                                                    index * 3 + innerIndex;
                                                if (recipes.isEmpty) {
                                                  recipes = List.generate(
                                                      state.recipes!.length,
                                                      (index) => state
                                                          .recipes![index]);
                                                }
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedRecipeName =
                                                            recipes[
                                                                currentIndex];
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: selectedRecipeName ==
                                                                recipes[
                                                                    currentIndex]
                                                            ? AppColors.violet
                                                            : AppColors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      height: 77,
                                                      child: Center(
                                                        child: SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                            recipes[
                                                                currentIndex],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppTheme
                                                                .themeData
                                                                .textTheme
                                                                .titleSmall!
                                                                .copyWith(
                                                              color: selectedRecipeName ==
                                                                      recipes[
                                                                          currentIndex]
                                                                  ? AppColors
                                                                      .white
                                                                  : Colors
                                                                      .black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
                              aspectRatio: 0.95,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentCarouselIndex = index;
                                });

                                if (currentCarouselIndex ==
                                        totalCardCount - 1 &&
                                    state.maybeWhen(
                                      generating: () => false,
                                      orElse: () => true,
                                    )) {
                                  totalCardCount += 4;

                                  context
                                      .read<GenerateRecipesBloc>()
                                      .add(GenerateRecipesEvent.generateRecipes(
                                        season: context
                                            .read<ProfileBloc>()
                                            .state
                                            .season!,
                                        cravings: context
                                            .read<MoodBloc>()
                                            .state
                                            .recipe!
                                            .product!,
                                        exclude: widget.excludeList,
                                      ));
                                }
                              },
                            ),
                          )
                        : Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              CarouselSlider.builder(
                                itemCount: totalCardCount,
                                itemBuilder: (context, index, realIndex) {
                                  return Container(
                                    height: 380,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      color: AppColors.transparentBlue,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical:
                                              Platform.isAndroid ? 45 : 80),
                                      child: state.maybeMap(
                                        generating: (_) => ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 16.0),
                                              child: Shimmer.fromColors(
                                                baseColor: Colors.white,
                                                highlightColor:
                                                    Colors.grey.shade200,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  height: 77,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        error: (e) => Center(
                                          child: Text(e.error),
                                        ),
                                        orElse: () => ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 3,
                                            itemBuilder: (c, innerIndex) {
                                              final currentIndex =
                                                  index * 3 + innerIndex;
                                              if (recipes.isEmpty) {
                                                recipes = List.generate(
                                                    state.recipes!.length,
                                                    (index) =>
                                                        state.recipes![index]);
                                              }
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 16.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedRecipeName =
                                                          recipes[currentIndex];
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: selectedRecipeName ==
                                                              recipes[
                                                                  currentIndex]
                                                          ? AppColors.violet
                                                          : AppColors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    height: 77,
                                                    child: Center(
                                                      child: SizedBox(
                                                        width: 200,
                                                        child: Text(
                                                          recipes[currentIndex],
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: AppTheme
                                                              .themeData
                                                              .textTheme
                                                              .titleSmall!
                                                              .copyWith(
                                                            color: selectedRecipeName ==
                                                                    recipes[
                                                                        currentIndex]
                                                                ? AppColors
                                                                    .white
                                                                : Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  enableInfiniteScroll: false,
                                  aspectRatio: 1.0,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentCarouselIndex = index;
                                    });

                                    if (currentCarouselIndex ==
                                            totalCardCount - 1 &&
                                        state.maybeWhen(
                                          generating: () => false,
                                          orElse: () => true,
                                        )) {
                                      totalCardCount += 4;

                                      context.read<GenerateRecipesBloc>().add(
                                              GenerateRecipesEvent
                                                  .generateRecipes(
                                            season: context
                                                .read<ProfileBloc>()
                                                .state
                                                .season!,
                                            cravings: context
                                                .read<MoodBloc>()
                                                .state
                                                .recipe!
                                                .product!,
                                            exclude: widget.excludeList,
                                          ));
                                    }
                                  },
                                ),
                              ),
                              Positioned(
                                top: 25,
                                left: 150,
                                child: SuperTooltip(
                                  left: 90,
                                  popupDirection: TooltipDirection.up,
                                  controller: swipeTooltipController,
                                  arrowLength: 8,
                                  arrowBaseWidth: 12,
                                  barrierColor: Colors.transparent,
                                  backgroundColor: Colors.black,
                                  shadowColor: Colors.transparent,
                                  content: Padding(
                                    padding: EdgeInsets.zero,
                                    child: Text(
                                      'Swipe cards to view more recipes ',
                                      style: AppTheme
                                          .themeData.textTheme.titleSmall!
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  onHide: () {
                                    context.read<TutorialBloc>().add(
                                        const TutorialEvent.updateTutorial(
                                            data: {"isSwipeCards": false}));
                                  },
                                  child: Image.asset(
                                    'assets/images/red_dot.png',
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                  ],
                ),
                Positioned(
                  bottom: 40,
                  child: SizedBox(
                    width: 140,
                    child: AppElevatedButton(
                        text: AppStrings.confirm,
                        showArrow: true,
                        style: AppTheme.themeData.textTheme.titleMedium!
                            .copyWith(color: AppColors.white),
                        onPressed: selectedRecipeName.isNotEmpty
                            ? () {
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
                                          exclude: widget.excludeList,
                                          recipeName: selectedRecipeName),
                                    );

                                widget.nextPage();
                              }
                            : null),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
