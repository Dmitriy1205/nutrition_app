import 'package:flutter/material.dart';
import 'package:nutrition_app/common/colors.dart';

class Picker {
  Future<DateTime?> birthDatePicker(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime(2003),
        firstDate: DateTime(1900),
        lastDate: DateTime(2012),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              dialogTheme: const DialogTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              primarySwatch:
              const MaterialColor(0xFF7F6CFF, <int, Color>{
                50: Color(0xFFf5f3fe),
                100: Color(0xFFeadffd),
                200: Color(0xFFe0cbfc),
                300: Color(0xFFd6b7fb),
                400: Color(0xFFcc9ff9),
                500: Color(0xFFc285f8),
                600: Color(0xFF9865f1),
                700: Color(0xFF6f44ea),
                800: Color(0xFF4523e3),
                900: Color(0xFF1f02dc),
              }),

              splashColor: Colors.black,
              // textTheme: const TextTheme(
              //   titleMedium: TextStyle(color: AppColors.blackBlue),
              //   labelLarge: TextStyle(color: AppColors.blackBlue),
              // ),
            ),
            child: child ?? const Text(''),
          );
        });
  }
}
