import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/icons.dart';

import '../../common/theme.dart';

class AppTransparentButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? style;

  const AppTransparentButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shadowColor:Colors.transparent,
        side: const BorderSide(color: AppColors.violet,width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10,),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                text,
                style: style ?? AppTheme.themeData.textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
