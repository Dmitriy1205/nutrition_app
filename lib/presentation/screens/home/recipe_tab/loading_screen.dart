import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/functions.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/blocs/mood/mood_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../common/theme.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String generatedPhrase = '';

  @override
  void initState() {
    List<String> ingredients = context.read<MoodBloc>().state.recipe!.product!;
    generatedPhrase = generateRandomPhrase(ingredient: ingredients[0]);
    Timer.periodic(const Duration(seconds: 4), (timer) {
      String ingredient = ingredients[Random().nextInt(ingredients.length)];
      setState(() {
        generatedPhrase = generateRandomPhrase(ingredient: ingredient);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                Align(
                  alignment: Alignment.topLeft,
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
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppStrings.pleaseWait,
                  textAlign: TextAlign.center,
                  style: AppTheme.themeData.textTheme.headlineLarge!
                      .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 150,
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250.0,
                      child: Shimmer.fromColors(
                        baseColor: Color(0xFFD6CFFF).withOpacity(0.1),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(generatedPhrase,
                            textAlign: TextAlign.center,
                            style: AppTheme.themeData.textTheme.headlineLarge!
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
