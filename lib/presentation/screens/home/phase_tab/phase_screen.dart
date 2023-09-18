import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition_app/data/models/recommendations.dart';
import 'package:nutrition_app/presentation/blocs/profile/profile_bloc.dart';

import '../../../../common/colors.dart';
import '../../../../common/icons.dart';
import '../../../../common/strings.dart';
import '../../../../common/theme.dart';
import '../../../widgets/colored_container.dart';
import '../../../widgets/custom_label.dart';

class PhaseScreen extends StatefulWidget {
  const PhaseScreen({super.key});

  @override
  State<PhaseScreen> createState() => _PhaseScreenState();
}

class _PhaseScreenState extends State<PhaseScreen> {
  late Recommendations recommendations;

  @override
  void initState() {
    final String phase = context.read<ProfileBloc>().state.phase!;
    recommendations = getRecommendation('$phase Phase');
    super.initState();
  }

  Recommendations getRecommendation(String phase) {
    return recommendationsList.firstWhere((element) => element.phase == phase);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Platform.isAndroid ? 16: 28,),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 51.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ColoredContainer(
                        radius: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8),
                          child: Center(
                            child: Text(
                              recommendations.phase.toUpperCase(),
                              style: AppTheme.themeData.textTheme.headlineLarge!
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(

                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Text(
                            recommendations.description,
                          style: AppTheme.themeData.textTheme.bodyLarge!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomLabel(
                  text: 'Proteins'.toUpperCase(),
                  svgIcon: AppIcons.protein,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                  child: Text(
                    recommendations.proteins,
                    style: AppTheme.themeData.textTheme.bodyLarge!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                CustomLabel(
                  text: 'Complex Carbs'.toUpperCase(),
                  svgIcon: AppIcons.carbs,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                  child: Text(
                    recommendations.grains,
                    style: AppTheme.themeData.textTheme.bodyLarge!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                CustomLabel(
                  text: 'Veggies & Fruits'.toUpperCase(),
                  svgIcon: AppIcons.veggie,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                  child: Text(
                      recommendations.fruitsAndVeggies,                  style: AppTheme.themeData.textTheme.bodyLarge!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                CustomLabel(
                  text: 'Fats'.toUpperCase(),
                  svgIcon: AppIcons.fats,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                  child: Text(
                    recommendations.fats,
                    style: AppTheme.themeData.textTheme.bodyLarge!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                CustomLabel(
                  text: 'Other'.toUpperCase(),
                  svgIcon: AppIcons.other,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                  child: Text(
                    recommendations.other,
                    style: AppTheme.themeData.textTheme.bodyLarge!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
