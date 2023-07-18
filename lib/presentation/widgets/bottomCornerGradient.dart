import 'package:flutter/material.dart';

class BottomCornerGradient extends StatelessWidget {
  const BottomCornerGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration:  BoxDecoration(
        gradient: RadialGradient(
          colors: [

            const Color(0xFFD6CFFF).withOpacity(0.3), // Gradient color 1
            const Color(0xFFFFEEDBA).withOpacity(0.3),
            Colors.white,// Gradient color 2
          ],
          stops: const [0.0, 0.0, 1.0], // Adjust the stops as per your preference
          center: Alignment.bottomRight,
        ),
      ),
    );
  }
}
