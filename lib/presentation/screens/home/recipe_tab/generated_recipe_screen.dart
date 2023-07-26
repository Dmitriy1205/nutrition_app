import 'package:flutter/material.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';
import 'package:nutrition_app/presentation/widgets/app_transparent_button.dart';
import 'package:nutrition_app/presentation/widgets/colored_container.dart';

import '../../../../common/colors.dart';
import '../../../../common/theme.dart';

class GeneratedRecipeScreen extends StatefulWidget {
  final void Function() nextPage;
  final void Function() previousPage;

  const GeneratedRecipeScreen(
      {super.key, required this.nextPage, required this.previousPage});

  @override
  State<GeneratedRecipeScreen> createState() => _GeneratedRecipeScreenState();
}

class _GeneratedRecipeScreenState extends State<GeneratedRecipeScreen> {
  String recipeText = '''Recipe: Shrimp and Watermelon Salad
Ingredients:
 • 1 lb cooked shrimp, peeled and deveined
 • 4 cups mixed salad greens
 • 2 cups cubed watermelon
 • 1/2 cup sliced cucumber
 • 1/4 cup chopped red onion
 • 1/4 cup chopped fresh mint leaves
 • 1/4 cup chopped fresh cilantro leaves
 • 1/4 cup chopped unsalted cashews
 • 2 tablespoons extra virgin olive oil
 • 2 tablespoons fresh lime juice
 • 1 tablespoon honey
 • 1 teaspoon grated fresh ginger
 • Salt and pepper to taste
Instructions:
 1. In a large bowl, combine the salad greens, watermelon, cucumber, red onion, mint, cilantro, and cashews.
 2. In a separate small bowl, whisk together the olive oil, lime juice, honey, grated ginger, salt, and pepper.
 3. Pour the dressing over the salad mixture and toss gently to combine.
 4. Divide the salad onto plates and top each with an equal amount of cooked shrimp.
 5. Serve immediately and enjoy!
Note: Adjust the ingredients and measurements according to your taste preferences and serving size requirements.  
''';

  String _extractRecipeName(String recipeText) {
    // Split the recipeText by newlines
    List<String> lines = recipeText.split('\n');

    // Check if the first line starts with "Recipe:"
    if (lines.isNotEmpty && lines[0].startsWith('Recipe:')) {
      // Remove "Recipe:" and return the rest of the line
      return lines[0].replaceFirst('Recipe:', '').trim();
    }

    // If the first line does not start with "Recipe:", return the original line
    return lines[0];
  }

  List<String> _extractSections(String recipeText) {
    // Split the recipeText by newlines
    List<String> sections = recipeText.split('\n');

    // Remove the first element (Recipe header)
    if (sections.isNotEmpty) {
      sections.removeAt(0);
    }
    // for (int i = 0; i < sections.length; i++) {
    //   if (sections[i].toLowerCase().startsWith('note:')) {
    //     sections[i] = '**' + sections[i] + '**';
    //   }
    // }

    return sections;
  }

  @override
  Widget build(BuildContext context) {
    String recipeName = _extractRecipeName(recipeText);
    List<String> sections = _extractSections(recipeText);
    int instructionsIndex = sections.indexOf('Instructions:');

    List<String> ingredientsList = sections
        .sublist(1, instructionsIndex)
        .map((section) => section.trim())
        .toList();

    List<String> instructionsList = sections
        .sublist(instructionsIndex + 1)
        .map((section) => section.trim())
        .toList();


    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
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
                      Text(
                        AppStrings.badRecipe,
                        style: AppTheme.themeData.textTheme.titleMedium!
                            .copyWith(color: AppColors.violet),
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
                      .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
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
                        fontWeight:FontWeight.w400,
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
                      String restOfText = instruction.substring(match.end);

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
                          fontWeight:  FontWeight.w400,
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
                    onPressed: () {}),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
