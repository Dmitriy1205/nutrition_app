import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/colors.dart';
import '../../common/icons.dart';
import '../../common/theme.dart';

class CustomLabel extends StatelessWidget {
  final String text;
  final String svgIcon;

  const CustomLabel({
    super.key,
    required this.text,
    required this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF7F6CFF),
            Color(0xFF1AC7C7),
          ],
          stops: [
            0.1,
            0.9,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical:5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(svgIcon),
              const SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: AppTheme.themeData.textTheme.titleMedium!
                    .copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
