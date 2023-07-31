import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/screens/home/recipe_tab/loading_screen.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';
import 'package:nutrition_app/presentation/widgets/app_transparent_button.dart';
import 'package:nutrition_app/presentation/widgets/colored_container.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/colors.dart';
import '../../../../common/functions.dart';
import '../../../../common/theme.dart';
import '../../../blocs/mood/mood_bloc.dart';
import '../../../blocs/profile/profile_bloc.dart';
import '../../../blocs/recipe/recipe_bloc.dart';

class GeneratedRecipeScreen extends StatefulWidget {
  final void Function() nextPage;
  final void Function() previousPage;

  const GeneratedRecipeScreen({
    super.key,
    required this.nextPage,
    required this.previousPage,
  });

  @override
  State<GeneratedRecipeScreen> createState() => _GeneratedRecipeScreenState();
}

class _GeneratedRecipeScreenState extends State<GeneratedRecipeScreen> {
  late String recipeName;
  late List<String> sections;
  late List<String> ingredientsList;
  late List<String> instructionsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<RecipeBloc, RecipeState>(
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
                  context.read<RecipeBloc>().add(RecipeEvent.generateImage(recipeName: recipeName));
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
                            GestureDetector(
                              onTap: (){
                                List<String> excludeList = context.read<ProfileBloc>().state.user!.foodDontIt! +
                                    context.read<ProfileBloc>().state.user!.allergy!;
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
                                      exclude: excludeList ,
                                      recipeName: recipeName),
                                );
                              },
                              child: Text(
                                AppStrings.badRecipe,
                                style: AppTheme.themeData.textTheme.titleMedium!
                                    .copyWith(color: AppColors.violet),
                              ),
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
                            ingredient.replaceAll('•', '•   '),
                            strutStyle: const StrutStyle(height: 2.2),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          );
                        }).toList(),
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
                                    text: restOfText,
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
                        height: 300.0,decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),),

                        child: state.maybeMap(
                          imageGenerating: (_) => Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: Colors.grey.shade200,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),),),
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
                      AppElevatedButton(
                          showPrefix: true,
                          text: AppStrings.saveToGallery,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.white),
                          onPressed: () {}),
                      const SizedBox(
                        height: 20,
                      ),
                      AppTransparentButton(
                          text: AppStrings.done,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.violet),
                          onPressed: () {
                            widget.previousPage();
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
    );
  }
}
