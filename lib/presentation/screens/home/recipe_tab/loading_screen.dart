import 'package:flutter/material.dart';
import 'package:nutrition_app/common/strings.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../common/theme.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

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
                      baseColor: Color(0xFFD6CFFF).withOpacity(0.3),
                      highlightColor: Color(0xFFDEF3F2).withOpacity(0.3),
                      child: Container(

                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),Center(
                    child: Text('Phrases that appear while waiting',textAlign: TextAlign.center,
                        style: AppTheme.themeData.textTheme.headlineLarge!
                            .copyWith(fontSize: 18, fontWeight: FontWeight.w700)),
                  ),],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
