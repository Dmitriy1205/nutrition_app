import 'package:flutter/material.dart';

import '../../common/theme.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? style;

  const AppElevatedButton({
    required this.text,
    required this.onPressed,
    super.key, this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(text,style: style ?? AppTheme.themeData.textTheme.titleMedium,),
          ),
        ],
      ),
    );
  }
}
