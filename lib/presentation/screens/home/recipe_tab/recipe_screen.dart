import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/blocs/generate_recipes/generate_recipes_bloc.dart';
import 'package:nutrition_app/presentation/blocs/recipe/recipe_bloc.dart';
import 'package:nutrition_app/presentation/blocs/tutorial/tutorial_bloc.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/colors.dart';
import '../../../../common/services/service_locator.dart';
import '../../../../common/theme.dart';
import '../../../blocs/mood/mood_bloc.dart';
import '../../../blocs/profile/profile_bloc.dart';

class RecipeScreen extends StatefulWidget {
  final List<String> excludeList;
  final void Function() nextPage;
  final void Function() previousPage;

  const RecipeScreen(
      {super.key,
      required this.nextPage,
      required this.previousPage,
      required this.excludeList});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  // final _bloc = sl<GenerateRecipesBloc>();
  String selectedRecipeName = '';
  int currentPage = 0;
  int itemsPerPage = 3;


  List<String> recipes = [];

  @override
  void initState() {
    recipes.clear();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<GenerateRecipesBloc, GenerateRecipesState>(
            // bloc: _bloc,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ListView(
                      physics: const ClampingScrollPhysics(),
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0.0),
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
                        Text(
                          AppStrings.seletWhatUp,
                          // textAlign: TextAlign.center,
                          style: AppTheme.themeData.textTheme.headlineLarge!
                              .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
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
                          height: 108,
                        ),
                        state.maybeMap(
                          generating: (_) => ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor: Colors.grey.shade200,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(15)),
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
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: itemsPerPage,
                            itemBuilder: (context, index) {
                              if (recipes.isEmpty) {
                                recipes = List.generate(state.recipes!.length,
                                    (index) => state.recipes![index]);
                              }

                              // final product = state.recipes!;
                              // final realIndex =
                              //     (currentPage + index) % product.length;
                              return
                                  // Visibility(
                                  // visible: index >= currentPage &&
                                  //     index < currentPage + itemsPerPage,
                                  // child:
                                  Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedRecipeName = recipes[index];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: selectedRecipeName == recipes[index]
                                            ? AppColors.violet
                                            : AppColors.white,
                                        borderRadius: BorderRadius.circular(15)),
                                    height: 77,
                                    child: Center(
                                      child: SizedBox(
                                        width: 200,
                                        child: Text(
                                          recipes[index],
                                          textAlign: TextAlign.center,
                                          style: AppTheme
                                              .themeData.textTheme.titleSmall!
                                              .copyWith(
                                                  color: selectedRecipeName ==
                                                          recipes[index]
                                                      ? AppColors.white
                                                      : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 20,
                      child: Column(
                        children: [
                          SizedBox(
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              AppStrings.or,
                              style: AppTheme.themeData.textTheme.titleSmall,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: RichText(
                              text: TextSpan(
                                  text: AppStrings.regenerate,
                                  style: AppTheme.themeData.textTheme.titleMedium!
                                      .copyWith(color: AppColors.violet),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        if (recipes.length == 3) {
                                          // widget.excludeList = context
                                          //         .read<ProfileBloc>()
                                          //         .state
                                          //         .user!
                                          //         .foodDontIt! +
                                          //     context
                                          //         .read<ProfileBloc>()
                                          //         .state
                                          //         .user!
                                          //         .allergy!;

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

                                        recipes.removeRange(0, 3);
                                        print(recipes);

                                        // currentPage = (currentPage + 1) %
                                        //     ((state.recipes!.length / itemsPerPage)
                                        //         .ceil());
                                      });
                                    }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
    );
  }
}
