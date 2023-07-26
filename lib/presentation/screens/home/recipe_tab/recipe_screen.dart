import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';

import '../../../../common/colors.dart';
import '../../../../common/theme.dart';
import '../../../blocs/mood/mood_bloc.dart';

class RecipeScreen extends StatefulWidget {
  final void Function() nextPage;
  final void Function() previousPage;

  const RecipeScreen(
      {super.key, required this.nextPage, required this.previousPage});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  String selectedRecipeName = '';

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
                  textAlign: TextAlign.center,
                  style: AppTheme.themeData.textTheme.headlineLarge!
                      .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  AppStrings.chooseYourRecipe,
                  textAlign: TextAlign.center,
                  style: AppTheme.themeData.textTheme.headlineLarge!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 50,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      context.read<MoodBloc>().state.recipe!.product!.length,
                  itemBuilder: (context, index) {
                    final product =
                        context.read<MoodBloc>().state.recipe!.product!;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRecipeName = product[index];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectedRecipeName == product[index]
                                ? AppColors.violet
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(15)),
                        height: 77,
                        child: Center(
                          child: SizedBox(
                            width: 120,
                            child: Text(
                              product[index],
                              textAlign: TextAlign.center,
                              style: AppTheme.themeData.textTheme.titleSmall!
                                  .copyWith(
                                      color:
                                          selectedRecipeName == product[index]
                                              ? AppColors.white
                                              : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
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
                    onPressed: selectedRecipeName.isNotEmpty
                        ? () {
                            //TODO: regenerate variants of recipe
                          }
                        : null,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: AppStrings.regenerate,
                        style: AppTheme.themeData.textTheme.titleMedium!
                            .copyWith(color: AppColors.violet),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
