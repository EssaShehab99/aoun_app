import 'package:flutter/material.dart';
import '/views/shared/shared_values.dart';

class ThemeApp {
  ThemeApp._privateConstructor();

  static final ThemeApp _instance = ThemeApp._privateConstructor();

  static ThemeApp get instance => _instance;

  static ThemeData light = ThemeData(
      fontFamily: "app_font_reg",
      primaryColor: const Color(0xFF329F95),
      hintColor: const Color(0xFFEAEAEA),
      scaffoldBackgroundColor: const Color(0xFF329F95),
      iconTheme: const IconThemeData(color: Color(0xFFFFFFFF), size: 25),
      dividerColor: const Color(0xFFEAEAEA),
      indicatorColor: const Color(0xFF939393),
      cardColor: const Color(0xFFFFFFFF),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF4AB3A9)),
      appBarTheme: const AppBarTheme(color: Color(0xFFFAFAFA)),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SharedValues.borderRadius),
            borderSide: const BorderSide(color: Color(0xFF4AB3A9), width: 1.5)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SharedValues.borderRadius),
            borderSide: const BorderSide(color: Color(0xFF4AB3A9), width: 1.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SharedValues.borderRadius),
            borderSide: const BorderSide(color: Color(0xFF4AB3A9), width: 1.5)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SharedValues.borderRadius),
            borderSide: const BorderSide(color: Color(0xFFFF6464), width: 1.5)),
        errorStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFFFF6464)),
        fillColor: const Color(0xFFFFFFFF),
        filled: true,
        contentPadding: const EdgeInsets.all(SharedValues.padding * 2),
        hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF939393)),
      ),
      textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xFFFFFFFF)),
          displayMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFFFFFFFF)),
          displaySmall: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
          headlineMedium: TextStyle(fontSize: 14, color: Color(0xFF000000)),
          headlineSmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF408B6A)),
          bodyLarge: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF000000)),
          headlineLarge: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF939393)),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF939393)),
          titleMedium: TextStyle(fontSize: 12, color: Color(0xFF4AB3A9)),
          titleSmall: TextStyle(fontSize: 12, color: Color(0xFF53A57C)),
          labelLarge: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
          labelMedium: TextStyle(fontSize: 13, color: Color(0xFF939393))),
      colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xFF9BEADD),
              onPrimary: Color(0xFFFFFFFF),
              secondary: Color(0x4B5D655D),
              onSecondary: Color(0xFFFFFFFF),
              error: Color(0xFFE86173),
              onError: Color(0xFFFFFFFF),
              background: Color(0xFFFFFFFF),
              onBackground: Color(0xFF000000),
              surface: Color(0xFF939393),
              onSurface: Color(0xFF408B6A))
          .copyWith(background: const Color(0xFFFFFFFF)));
}
