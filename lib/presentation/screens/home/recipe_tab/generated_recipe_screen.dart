import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/blocs/cache/cache_bloc.dart';
import 'package:nutrition_app/presentation/blocs/saved_recipe/saved_recipe_bloc.dart';
import 'package:nutrition_app/presentation/screens/home/recipe_tab/loading_screen.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';
import 'package:nutrition_app/presentation/widgets/app_transparent_button.dart';
import 'package:nutrition_app/presentation/widgets/colored_container.dart';
import 'package:nutrition_app/presentation/widgets/loading_indicator.dart';
import 'package:nutrition_app/presentation/widgets/subscription_label.dart';
import 'package:shimmer/shimmer.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../../../common/colors.dart';
import '../../../../common/functions/functions.dart';
import '../../../../common/icons.dart';
import '../../../../common/theme.dart';
import '../../../../data/local/share_pref.dart';
import '../../../blocs/mood/mood_bloc.dart';
import '../../../blocs/profile/profile_bloc.dart';
import '../../../blocs/recipe/recipe_bloc.dart';
import '../../../blocs/tutorial/tutorial_bloc.dart';
import '../../subscription_screen.dart';

class GeneratedRecipeScreen extends StatefulWidget {
  final void Function() nextPage;
  final void Function() onDone;
  final void Function() previousPage;

  const GeneratedRecipeScreen({
    super.key,
    required this.nextPage,
    required this.previousPage,
    required this.onDone,
  });

  @override
  State<GeneratedRecipeScreen> createState() => _GeneratedRecipeScreenState();
}

class _GeneratedRecipeScreenState extends State<GeneratedRecipeScreen> {
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
  final SuperTooltipController thirdTooltipController =
      SuperTooltipController();
  final SuperTooltipController fourthTooltipController =
      SuperTooltipController();
  final ScrollController _scrollController = ScrollController();
  late String recipeName;
  late List<String> sections;
  late List<String> ingredientsList;
  late List<String> instructionsList;
  late String recipeText;
  Widget buttonBody = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(
        AppIcons.save,
        width: 20,
        height: 20,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        AppStrings.saveToGallery,
        style: AppTheme.themeData.textTheme.titleMedium!
            .copyWith(color: AppColors.white),
      ),
      const SizedBox(),
    ],
  );
  bool disableButton = false;
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
    return MultiBlocListener(
      listeners: [
        BlocListener<TutorialBloc, TutorialState>(
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
        ),
        BlocListener<SavedRecipeBloc, SavedRecipeState>(
          listener: (context, state) {
            state.maybeMap(
                saving: (_) => setState(() {
                      buttonBody = const LoadingIndicator(
                        color: AppColors.white,
                      );
                    }),
                saved: (_) => setState(() {
                      disableButton = true;
                      buttonBody = Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.saved,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppStrings.saved,
                            style: AppTheme.themeData.textTheme.titleMedium!
                                .copyWith(color: AppColors.white),
                          ),
                          const SizedBox(),
                        ],
                      );
                    }),
                orElse: () {});
          },
        ),
      ],
      child: BlocConsumer<RecipeBloc, RecipeState>(
        listener: (context, state) {
          state.maybeMap(
              textGenerated: (_) {
                setState(() {
                  recipeText = state.recipeText!;
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
                  context.read<RecipeBloc>().add(RecipeEvent.generateImage(
                      recipeName: recipeName, recipe: state.recipeText!));
                  Future.delayed(const Duration(milliseconds: 300), () {
                    thirdTooltipController.showTooltip();
                  });
                });
              },
              imageGenerated: (s) => context.read<CacheBloc>().add(
                  CacheEvent.write(
                      name: recipeName,
                      image: state.recipeImage!,
                      recipeBody: recipeText)),
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeMap(
            error: (e) => Center(
              child: Text(e.error),
            ),
            textGenerating: (_) => LoadingScreen(
              previousPage: () {
                widget.previousPage();
              },
            ),
            orElse: () => Scaffold(
              appBar: AppBar(
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                leading: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Ink(
                      width: 20,
                      height: 20,
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    widget.previousPage();
                  },
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: !isRegenerate!
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
                              buttonBody = Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.save,
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    AppStrings.saveToGallery,
                                    style: AppTheme
                                        .themeData.textTheme.titleMedium!
                                        .copyWith(color: AppColors.white),
                                  ),
                                  const SizedBox(),
                                ],
                              );
                              disableButton = false;
                            },
                            child: Text(
                              AppStrings.badRecipe,
                              style: AppTheme.themeData.textTheme.titleMedium!
                                  .copyWith(color: AppColors.violet),
                            ),
                          )
                        : Stack(
                            children: [
                              Text(
                                AppStrings.badRecipe,
                                style: AppTheme.themeData.textTheme.titleMedium!
                                    .copyWith(color: AppColors.violet),
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
                                      'Request a new recipe',
                                      style: AppTheme
                                          .themeData.textTheme.titleSmall!
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  onHide: () {
                                    _scrollController.animateTo(
                                      _scrollController
                                          .position.maxScrollExtent,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );

                                    context.read<TutorialBloc>().add(
                                            const TutorialEvent.updateTutorial(
                                                data: {
                                              "isRegenerateRecipe": false
                                            }));
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      fourthTooltipController.showTooltip();
                                    });
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
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ListView(
                      controller: _scrollController,
                      physics: const ClampingScrollPhysics(),
                      children: [
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
                              ingredient
                                  .replaceAll(RegExp(r'^-+'), '•   ')
                                  .replaceFirst("Ingredients:", ""),
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
                        context
                                .read<ProfileBloc>()
                                .state
                                .user!
                                .subscription!['isSubscribed']
                            ? const SizedBox()
                            : GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SubscriptionScreen()));
                                },
                                child: const SubscriptionLabel()),
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
                            RegExp regex = RegExp(r"^(\d+\.\s|Note:\s|Enjoy\s|Enjoy!\s)");

                            Match? match = regex.firstMatch(instruction);
                            if (match != null) {
                              // Extract the number part and the rest of the text
                              String numberPart = match.group(0)!;
                              String restOfText = instruction.substring(match.end);

                              if (numberPart.startsWith("Note:") || restOfText.trim().startsWith("Enjoy")) {
                                return Container(); // Skip this instruction
                              }
                              if (numberPart.trim().startsWith("Enjoy")) {
                                return Container(); // Skip this instruction
                              }
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
                                      text: restOfText
                                          .replaceAll("sautÃ©", "saute")
                                          .replaceAll("SautÃ©", "Saute")
                                          .replaceAll("Â", "").replaceAll(RegExp(r'[^\x20-\x7E]'), '').replaceAll(RegExp(r'Enjoy(\s|\S)*'), ''),
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
                        AspectRatio(
                          aspectRatio: 1.05,
                          child: Container(
                            // width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height/2.6,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: state.recipeImage == null
                                ? Shimmer.fromColors(
                                    baseColor: Colors.grey.shade400,
                                    highlightColor: Colors.white,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: state.recipeImage!,
                                      fit: BoxFit.fill,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Shimmer.fromColors(
                                        baseColor: Colors.grey.shade400,
                                        highlightColor: Colors.white,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        !isRecipe!
                            ? Material(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onTap: disableButton
                                      ? null
                                      : () {
                                          context
                                              .read<SavedRecipeBloc>()
                                              .add(SavedRecipeEvent.saveRecipe(
                                                recipeName: recipeName,
                                                recipeImage: state.recipeImage!,
                                                recipeText: recipeText,
                                              ));
                                        },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.violet),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 56,
                                      child: buttonBody,
                                    ),
                                  ),
                                ),
                              )
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
                                        context.read<TutorialBloc>().add(
                                              const TutorialEvent
                                                  .updateTutorial(data: {
                                                "isShowBottomBar": false
                                              }),
                                            );
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
            ),
          );
        },
      ),
    );
  }
}
