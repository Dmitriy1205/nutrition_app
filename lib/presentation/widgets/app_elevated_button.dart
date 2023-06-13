import 'package:flutter/material.dart';

import '../../common/theme.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppElevatedButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(text,style: AppTheme.themeData.textTheme.headlineMedium,),
          ),
        ],
      ),
    );
  }
}
