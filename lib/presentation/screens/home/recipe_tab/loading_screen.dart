import 'package:flutter/material.dart';
import 'package:nutrition_app/common/strings.dart';
import '../../../../common/theme.dart';

class LoadingScreen extends StatefulWidget {

  const LoadingScreen(
      {super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
                    padding: const EdgeInsets.only(left: 30.0),
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

                      },
                    ),
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
