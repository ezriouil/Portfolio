import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class CustomCheckboxTheme {
  CustomCheckboxTheme._();

  /// Checkbox For Light Theme
  static final CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.WHITE;
      } else {
        return CustomColors.BLACK;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.PRIMARY;
      } else {
        return CustomColors.TRANSPARENT;
      }
    }),
  );

  /// Checkbox For Dark Theme
  static final CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.BLACK;
      } else {
        return CustomColors.WHITE;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.PRIMARY;
      } else {
        return CustomColors.TRANSPARENT;
      }
    }),
  );
}
