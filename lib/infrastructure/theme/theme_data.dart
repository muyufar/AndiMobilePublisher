import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/material.dart';

/// themeData
///
/// This function creates a ThemeData object.

/// Parameters
///
/// * `none`

/// Returns
///
/// A ThemeData object with the following properties:

/// * `textTheme`: The text theme.
/// * `colorScheme`: The color scheme with the primary color set to `colorPrimary`.
/// * `iconTheme`: The icon theme with the color set to `colorPrimary`.
/// * `dialogBackgroundColor`: The dialog background color set to `Colors.white.withOpacity(0.88)`.
/// * `inputDecorationTheme`: The input decoration theme with the following properties:
///    * `isDense`: True.
///    * `contentPadding`: The content padding set to `EdgeInsets.symmetric(horizontal: 16, vertical: 8)`.
///    * `hintStyle`: The hint style set to `TextStyle(color: colorTextGrey)`.
///    * `labelStyle`: The label style set to `TextStyle(fontSize: 14, color: Colors.grey.shade600)`.
///    * `fillColor`: The fill color set to `Colors.white`.
///    * `filled`: True.
///    * `border`: The border set to `OutlineInputBorder(borderRadius: borderRadiusTheme, borderSide: const BorderSide(width: 0, color: Colors.white))`.
///    * `focusedBorder`: The focused border set to `OutlineInputBorder(borderRadius: borderRadiusTheme, borderSide: const BorderSide(width: 0, color: Colors.white))`.
/// * `dialogTheme`: The dialog theme with the shape set to `RoundedRectangleBorder(borderRadius: borderRadiusTheme)`.
/// * `elevatedButtonTheme`: The elevated button theme with the style set to `ElevatedButton.styleFrom(textStyle: const TextStyle(fontWeight: FontWeight.bold), padding: const EdgeInsets.symmetric(vertical: 12), shape: RoundedRectangleBorder(borderRadius: borderRadiusTheme))`.

/// Usage
///
/// To use this function, first you need to import it. Then, you can create a ThemeData object like this:
///
///
/// ThemeData themeData = themeData();
///
/// This code will create a ThemeData object with the properties described above.

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
