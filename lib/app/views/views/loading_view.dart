import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/material.dart';

/// loadingDefault
///
/// This method creates a loading indicator.

/// Returns
///
/// A CircularProgressIndicator widget with the primary color and the stroke width of 2.

/// Usage
///
/// To use this method, first you need to import it. Then, you can use it to create a loading indicator like this:
///
///
/// loadingDefault();
///
/// This code will create a loading indicator with the primary color and the stroke width of 2.

Widget loadingDefault() {
  return Center(
      child: CircularProgressIndicator(color: colorPrimary, strokeWidth: 2));
}
