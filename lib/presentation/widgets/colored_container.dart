import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  final Widget child;

  const ColoredContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
        gradient: const LinearGradient(
          colors: [
            Color(0xFFDEF3F2),
            Color(0xFFD8D2FF),
          ],
          stops: [
            0.1,
            0.7,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: child,
    );
  }
}
