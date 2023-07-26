import 'package:flutter/material.dart';
import 'package:nutrition_app/presentation/screens/recipe_description.dart';

import '../../../common/strings.dart';
import '../../../common/theme.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});

  List<String> mockImages = [
    "assets/images/broccoli.jpeg",
    "assets/images/cake.jpeg",
    "assets/images/snack.jpeg",
    "assets/images/peanuts.jpeg",
    "assets/images/salat.jpeg",
    "assets/images/salmon.jpeg",
  ];
  List<Recipe> recipe = [
    Recipe(image: "assets/images/broccoli.jpeg", recipeNmae: 'Broccoli'),
    Recipe(image: "assets/images/cake.jpeg", recipeNmae: 'Cake'),
    Recipe(image: "assets/images/snack.jpeg", recipeNmae: 'Snack'),
    Recipe(image: "assets/images/peanuts.jpeg", recipeNmae: 'Peanuts'),
    Recipe(image: "assets/images/salat.jpeg", recipeNmae: 'Salat'),
    Recipe(image: "assets/images/salmon.jpeg", recipeNmae: 'Salmon'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.gallery.toUpperCase(),
                style: AppTheme.themeData.textTheme.headlineLarge,
              ),
            ),
            ExpansionTile(
              title: Center(
                  child: Text(AppStrings.savedRecipes.toUpperCase(),
                      style: AppTheme.themeData.textTheme.headlineLarge!
                          .copyWith(fontSize: 17))),
              leading: const SizedBox(),
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: recipe.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecipeDescription(
                                    recipe: recipe[index])));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(recipe[index].recipeNmae,
                              style: AppTheme.themeData.textTheme.headlineLarge!
                                  .copyWith(fontSize: 13)),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SizedBox(
                              height: 105,
                              width: 130,
                              child: Image.asset(
                                recipe[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Center(
                  child: Text(AppStrings.latestRecipes.toUpperCase(),
                      style: AppTheme.themeData.textTheme.headlineLarge!
                          .copyWith(fontSize: 17))),
              leading: const SizedBox(),
              initiallyExpanded: true,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Recipe Name',
                            style: AppTheme.themeData.textTheme.headlineLarge!
                                .copyWith(fontSize: 13)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 105,
                            width: 130,
                            child: Image.asset(
                              mockImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Recipe {
  String image;
  String recipeNmae;

  Recipe({required this.image, required this.recipeNmae});
}
