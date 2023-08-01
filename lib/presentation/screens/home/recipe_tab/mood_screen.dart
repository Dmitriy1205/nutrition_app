import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:nutrition_app/presentation/widgets/app_elevated_button.dart';
import 'package:nutrition_app/presentation/widgets/colored_container.dart';

import '../../../../common/colors.dart';
import '../../../../common/theme.dart';
import '../../../../data/models/mood.dart';
import '../../../../data/models/recipe/recipe.dart';
import '../../../blocs/mood/mood_bloc.dart';

class MoodScreen extends StatefulWidget {
  final void Function() nextPage;

  const MoodScreen({super.key, required this.nextPage});

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  List<bool> isSelected = List<bool>.filled(moodList.length, false);
  int selectedChipIndex = -1;
  String selectedMoodName = '';
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
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
              children: [
                ColoredContainer(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 7),
                      child: Text(
                        AppStrings.letsPersonalizeMeal.toUpperCase(),
                        style: AppTheme.themeData.textTheme.titleLarge!
                            .copyWith(fontSize: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppStrings.letUsKnow,
                    style: AppTheme.themeData.textTheme.headlineLarge!
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: moodList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2.5,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMoodName = moodList[index].name;
                          FocusScope.of(context).unfocus();
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: selectedMoodName == moodList[index].name
                                ? AppColors.violet.withOpacity(0.05)
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: selectedMoodName == moodList[index].name
                                ? Border.all(color: AppColors.violet, width: 2)
                                : Border.all(color: AppColors.white, width: 0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                moodList[index].icon,
                                width: 35,
                                height: 35,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                moodList[index].name,
                                style: AppTheme.themeData.textTheme.titleSmall!
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                //TODO: remove if needed down comment there is "Or Add Your Mood" texfield
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                //   child: Text(
                //     AppStrings.writeFealing,
                //     style: AppTheme.themeData.textTheme.headlineLarge!
                //         .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                //   ),
                // ),
                // const SizedBox(
                //   height: 40,
                // ),
                // TextFormField(
                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                //   controller: nameController,
                //   style: AppTheme.themeData.textTheme.labelSmall!
                //       .copyWith(fontSize: 14),
                //   decoration: const InputDecoration(
                //     fillColor: AppColors.white,
                //     filled: true,
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                //     prefix: SizedBox(
                //       width: 10,
                //     ),
                //   ),
                //   onChanged: (v) {
                //     setState(() {
                //       selectedMoodName = v;
                //     });
                //   },
                // ),
                // const SizedBox(
                //   height: 150,
                // ),
              ],
            ),
            Positioned(
              bottom: 20,
              child: SizedBox(
                width: 140,
                child: AppElevatedButton(
                    text: AppStrings.next,
                    showArrow: true,
                    style: AppTheme.themeData.textTheme.titleMedium!
                        .copyWith(color: AppColors.white),
                    onPressed: selectedMoodName.isNotEmpty
                        ? () {
                            context.read<MoodBloc>().add(
                                  MoodEvent.setData(data: {
                                    RecipeFields.mood: selectedMoodName
                                  }),
                                );
                            widget.nextPage();
                          }
                        : null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
