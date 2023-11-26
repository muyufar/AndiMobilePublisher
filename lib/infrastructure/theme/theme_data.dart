import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    textTheme: textTheme,
    colorScheme: ThemeData().colorScheme.copyWith(primary: colorPrimary),
    iconTheme: IconThemeData(color: colorPrimary),
    dialogBackgroundColor: Colors.white.withOpacity(0.88),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      hintStyle: TextStyle(color: colorTextGrey),
      labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade600),
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: borderRadiusTheme,
        borderSide: const BorderSide(
          width: 0,
          color: Colors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadiusTheme,
        borderSide: const BorderSide(
          width: 0,
          color: Colors.white,
        ),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: borderRadiusTheme),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadiusTheme,
        ),
      ),
    ),
  );
}