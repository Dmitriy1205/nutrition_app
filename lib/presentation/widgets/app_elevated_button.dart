import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition_app/common/icons.dart';

import '../../common/colors.dart';
import '../../common/theme.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final bool showArrow;
  final bool showPrefix;
  final VoidCallback? onPressed;
  final TextStyle? style;

  const AppElevatedButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.style,
    this.showArrow = false,
    this.showPrefix = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.violet.withOpacity(0.2);
            }
            return null;
          },
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !showPrefix
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(right: 15, top: 4),
                  child: SvgPicture.asset(
                    AppIcons.save,
                    width: 20,
                    height: 20,
                  ),
                ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: style ?? AppTheme.themeData.textTheme.titleMedium,
                ),
              ),
            ),
          ),
          !showArrow
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(left: 20, top: 4),
                  child: SvgPicture.asset(
                    AppIcons.arrow,
                    width: 12,
                    height: 12,
                  ),
                ),
        ],
      ),
    );
  }
}
