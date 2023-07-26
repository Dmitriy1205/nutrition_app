import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nutrition_app/common/colors.dart';

class CustomLinearIndicator extends StatefulWidget {
  final double progress;
  final int screenQuantity;
  final Color backgroundColor;
  final Color progressColor;
  final Duration animationDuration;

  const CustomLinearIndicator({
    super.key,
    required this.progress,
    this.backgroundColor = Colors.white,
    this.progressColor = AppColors.violet,
    this.animationDuration = const Duration(milliseconds: 500), required this.screenQuantity,
  });

  @override
  State<CustomLinearIndicator> createState() => _CustomLinearIndicatorState();
}

class _CustomLinearIndicatorState extends State<CustomLinearIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _progressAnimation =
        Tween(begin: widget.progress/widget.screenQuantity , end: widget.progress).animate(_animationController);
  }

  @override
  void didUpdateWidget(CustomLinearIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.progress != oldWidget.progress) {
      _animationController.animateTo(widget.progress,
          duration: widget.animationDuration);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 8,
      child: AnimatedBuilder(
        animation: _progressAnimation,
        builder: (context, _) {
          return CustomPaint(
            painter: LinearIndicatorPainter(
              progress: _progressAnimation.value,
              backgroundColor: widget.backgroundColor,
              progressColor: widget.progressColor, screenQuantity: widget.screenQuantity,
            ),
          );
        },
      ),
    );
  }
}

class LinearIndicatorPainter extends CustomPainter {
  final double progress;
  final int screenQuantity;
  final Color backgroundColor;
  final Color progressColor;

  LinearIndicatorPainter( {
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
    required this.screenQuantity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.fill;

    final double width = size.width;
    final double height = size.height;
    final double radius =
        height / 2; // Half of the height gives us the rounded radius.

    // Draw the rounded background.
    RRect backgroundRect =
        RRect.fromLTRBR(0, 0, width, height, Radius.circular(radius));
    canvas.drawRRect(backgroundRect, backgroundPaint);

    // Calculate the width of the progress based on the indicator's progress value.
    double progressWidth = clampDouble(progress, 0.0, 1.0) * width;
    // Draw the rounded progress.
    RRect progressRect = RRect.fromLTRBR(
        1, 0, progressWidth * screenQuantity, height, Radius.circular(radius));
    canvas.drawRRect(progressRect, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
