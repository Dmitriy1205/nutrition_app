import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/icons.dart';

import '../../common/theme.dart';

class AppTransparentButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final double? padding;

  const AppTransparentButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.style, this.backgroundColor, this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        surfaceTintColor: Colors.transparent,
        backgroundColor: backgroundColor ?? Colors.transparent,
        shadowColor:Colors.transparent,
        side:  BorderSide(color: backgroundColor != null ? Colors.transparent : AppColors.violet,width: 2),
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
              padding: EdgeInsets.symmetric(vertical:padding ?? 20),
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
