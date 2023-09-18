import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/presentation/screens/home/recipe_tab/food_screen.dart';
import 'package:nutrition_app/presentation/screens/home/recipe_tab/generated_recipe_screen.dart';
import 'package:nutrition_app/presentation/screens/home/recipe_tab/mood_screen.dart';
import 'package:nutrition_app/presentation/screens/home/recipe_tab/recipe_screen.dart';
import 'package:nutrition_app/presentation/screens/home/recipe_tab/swipe_recipe_screen.dart';

import '../../../blocs/mood/mood_bloc.dart';

class RecipeTab extends StatefulWidget {
  const RecipeTab({super.key});

  @override
  State<RecipeTab> createState() => _RecipeTabState();
}

class _RecipeTabState extends State<RecipeTab> {
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<String> excludeList = [];
  String name = '';
  String birthDate = '';
  Map<String, dynamic> location = {};
  String selectedDay = '';

  String selectedLength = '';
  String selectedPeriod = '';
  bool irregularCycle = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<MoodBloc, MoodState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  pageSnapping: false,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    MoodScreen(nextPage: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    }),
                    FoodScreen(previousPage: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    }, nextPage: (list) {
                      setState(() {
                        excludeList  = list;
                      });

                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    }),
                    SwipeRecipeScreen(previousPage: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    }, nextPage: () {

                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    }, excludeList: excludeList,),
                    GeneratedRecipeScreen(
                      previousPage: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                        );
                      },
                      nextPage: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                        );
                      },
                      onDone: () {
                        _pageController.jumpToPage(1);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
