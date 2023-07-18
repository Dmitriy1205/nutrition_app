import 'package:flutter/material.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';

import '../../../common/colors.dart';
import '../../../common/theme.dart';
import '../../../data/models/mood.dart';

class RecipeScreen extends StatefulWidget {
  RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<bool> isSelected = List<bool>.filled(moodList.length, false);
  int selectedChipIndex = -1;
  String selectedMoodName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.mood.toUpperCase(),
                style: AppTheme.themeData.textTheme.headlineLarge,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Wrap(
              spacing: 12.0,
              runSpacing: 8.0,
              children: List<Widget>.generate(moodList.length, (index) {
                final mood = moodList[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMoodName = mood.name;
                      });
                    },
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: selectedMoodName == mood.name
                          ? AppColors.blackBlue
                          : AppColors.background,
                      label: Text(
                        moodList[index].name,
                        style: AppTheme.themeData.textTheme.titleMedium!
                            .copyWith(
                                fontSize: 25,
                                color: selectedMoodName == mood.name
                                    ? Colors.white
                                    : AppColors.blackBlue),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            Container(

              decoration: BoxDecoration(
                color: AppColors.orange.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                  child: Text('${AppStrings.iam} $selectedMoodName...',style: AppTheme.themeData.textTheme.titleMedium!
                      .copyWith(
                      fontSize: 24,fontWeight: FontWeight.w500))),
            ),
            Spacer(),
            SizedBox(
                width: 140,
                child: AppElevatedButton(
                    text: AppStrings.next.toUpperCase(), onPressed: () {})),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
