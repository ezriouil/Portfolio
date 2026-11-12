import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';

class CustomOutlinedButtonTheme {
  CustomOutlinedButtonTheme._();

  /// Outlined Button Light Theme
  static final OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 4,
          shadowColor: CustomColors.PRIMARY,
          backgroundColor: CustomColors.WHITE,
          foregroundColor: CustomColors.PRIMARY,
          side: BorderSide(color: CustomColors.PRIMARY.withValues(alpha: 0.8)),
          padding: const EdgeInsets.symmetric(vertical: 8),
          textStyle: const TextStyle(
            fontSize: 13,
            color: CustomColors.PRIMARY,
            fontFamily: "Manrope-Bold",
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: CustomColors.BLACK, width: 0.5),
          ),
        ),
      );

  /// Outlined Button Dark Theme
  static final OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 4,
          shadowColor: CustomColors.PRIMARY,
          backgroundColor: CustomColors.BLACK,
          foregroundColor: CustomColors.PRIMARY,
          side: BorderSide(color: CustomColors.PRIMARY.withValues(alpha: 0.8)),
          padding: const EdgeInsets.symmetric(vertical: 8),
          textStyle: const TextStyle(
            fontSize: 13,
            color: CustomColors.PRIMARY,
            fontFamily: "Manrope-Bold",
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: CustomColors.WHITE, width: 0.5),
          ),
        ),
      );
}
