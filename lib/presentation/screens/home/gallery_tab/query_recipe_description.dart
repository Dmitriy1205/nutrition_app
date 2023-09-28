import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/presentation/blocs/saved_recipe/saved_recipe_bloc.dart';
import 'package:nutrition_app/presentation/widgets/colored_container.dart';

import '../../../../common/colors.dart';
import '../../../../common/functions/functions.dart';
import '../../../../common/theme.dart';

class QueryRecipeDescription extends StatefulWidget {
  final String recipeImage;
  final String recipeText;

  const QueryRecipeDescription({
    super.key,
    required this.recipeImage,
    required this.recipeText,
  });

  @override
  State<QueryRecipeDescription> createState() => _QueryRecipeDescriptionState();
}

class _QueryRecipeDescriptionState extends State<QueryRecipeDescription> {
  late String recipeName;
  late List<String> sections;
  late List<String> ingredientsList;
  late List<String> instructionsList;
  //
  @override
  void initState() {
    super.initState();
    setState(() {
      recipeName = extractRecipeName(widget.recipeText);
      sections = extractSections(widget.recipeText);
      int instructionsIndex = sections.indexOf('Instructions:');

      ingredientsList = sections
          .sublist(1, instructionsIndex)
          .map((section) => section.trim())
          .toList();

      instructionsList = sections
          .sublist(instructionsIndex + 1)
          .map((section) => section.trim())
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SavedRecipeBloc, SavedRecipeState>(
      listener: (context, state) {
        state.maybeMap(
            saved: (_) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: AppColors.green,
                    duration: Duration(seconds: 5),
                    content: Text(
                      'Recipe Successfully  Saved!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            orElse: () {});
      },
      child: Material(
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFFDEF3F2).withOpacity(0.7),
                const Color(0xFFD6CFFF).withOpacity(0.7),
              ],
              stops: const [
                0.3,
                0.9,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Scaffold(
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
                  Navigator.pop(context);
                },
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ListView(
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
                      // const SubscriptionLabel(),
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
                                        .replaceAll("Â", "")
                                        .replaceAll("Ã", "").replaceAll(RegExp(r'[^\x20-\x7E]'), ''),
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
                          child: ClipRRect(
                            borderRadius:  BorderRadius.circular(10),
                            child: SizedBox(
                              child: Image.network(
                                widget.recipeImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      // AppElevatedButton(
                      //     showPrefix: true,
                      //     text: AppStrings.saveToGallery,
                      //     style: AppTheme.themeData.textTheme.titleMedium!
                      //         .copyWith(color: AppColors.white),
                      //     onPressed: () {
                      //       context.read<SavedRecipeBloc>().add(
                      //           SavedRecipeEvent.saveRecipe(
                      //               recipeName: recipeName,
                      //               ingredients: ingredientsList.toString(),
                      //               description: instructionsList.toString(),
                      //               recipeImage: widget.recipeImage));
                      //     }),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
