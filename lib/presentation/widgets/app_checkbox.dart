import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/colors.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color borderColor;

  const AppCheckbox({super.key,
    required this.value,
    required this.onChanged,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(!value);
      },
      child: Container(
        width: 23.0,
        height: 23.0,
        decoration: BoxDecoration(
          color: value ? AppColors.violet :AppColors.background,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: borderColor,
            width: 1.5,
          ),
        ),
        child: value
            ? const Center(
              child: FaIcon(
          FontAwesomeIcons.check,
          color: Colors.white,
          size: 16,
        ),
            )
            : null,
      ),
    );
  }
}
