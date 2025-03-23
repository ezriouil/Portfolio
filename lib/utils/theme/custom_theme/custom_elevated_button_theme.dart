import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';
class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  /// Elevated Button For Light Theme
  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 4,
              shadowColor: CustomColors.PRIMARY,
              backgroundColor: CustomColors.PRIMARY,
              foregroundColor: CustomColors.WHITE,
              disabledBackgroundColor: CustomColors.GRAY_DARK,
              disabledForegroundColor: CustomColors.GRAY_DARK,
              side: BorderSide(color: CustomColors.PRIMARY.withValues(alpha: 0.8)),
              padding: const EdgeInsets.symmetric(vertical: 8),
              textStyle:
                  const TextStyle(
                      fontSize: 13,
                      color: Colors.white, fontFamily: "Manrope-Bold",
                 ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));

  /// Elevated Button For Dark Theme
  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 4,
              shadowColor: CustomColors.PRIMARY,
              backgroundColor: CustomColors.PRIMARY,
              foregroundColor: CustomColors.WHITE,
              disabledBackgroundColor: CustomColors.GRAY_LIGHT,
              disabledForegroundColor: CustomColors.GRAY_LIGHT,
              side: BorderSide(color: CustomColors.PRIMARY.withValues(alpha: 0.8)),
              padding: const EdgeInsets.symmetric(vertical: 8),
              textStyle: const TextStyle(
                  fontSize: 13,
                  color: Colors.white, fontFamily: "Manrope-Bold"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));
}
