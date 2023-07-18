import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    // dividerColor: const Color(0xFFC7ED3A),
    bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor: Color(0xFFF2F2F2),),
    colorScheme: ThemeData().colorScheme.copyWith(
      primary: const Color(0xFFF2F2F2),
      background: const Color(0xFFFFFFFF),
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    textSelectionTheme:
    const TextSelectionThemeData(cursorColor: Color(0xFF10284D)),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: const Color(0xFF10284D),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFBDC0C7),
          )),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFF7F6CFF),
        ),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFFC4445),
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFFC4445),
          )),
    ),
    useMaterial3: true,
    fontFamily: 'Plus Jakarta Sans',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 32,
        color: Color(0xFF090A0A),
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Color(0xFFF2F2F2),
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 17,
        color: Color(0xFF142f5c),
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 32,
        color: Color(0xFF091312),
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Color(0xFF090A0A),
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xFF090A0A),
      ),
      bodyLarge:TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xFF091312),
      ) ,
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF8C8C8C),
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Color(0xFF054271),
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: Color(0xFFF2F2F2),
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Color(0xFFF2F2F2),
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color(0xFF142f5c),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
          color: Color(0xFFF2F2F2),
        ),
        backgroundColor: const Color(0xFF7F6CFF),
      ),
    ),
  );
}
