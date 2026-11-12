import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';

class CustomTextTheme {
  CustomTextTheme._();

  /// Text For Light Theme
  static final TextTheme lightTextTheme = TextTheme(
    headlineSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: CustomColors.BLACK,
      fontFamily: "Manrope-Medium",
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: CustomColors.BLACK,
      fontFamily: "Manrope-Medium",
    ),
    headlineLarge: const TextStyle().copyWith(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: CustomColors.BLACK,
      fontFamily: "Manrope-Medium",
    ),

    titleSmall: const TextStyle().copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: CustomColors.BLACK,
      fontFamily: "Manrope-Medium",
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.w500,
      color: CustomColors.BLACK,
      fontFamily: "Manrope-Medium",
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.bold,
      color: CustomColors.BLACK,
      fontFamily: "Manrope-Medium",
    ),

    bodySmall: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      color: CustomColors.BLACK.withValues(alpha: 0.4),
      fontFamily: "Manrope-Medium",
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.normal,
      color: CustomColors.BLACK,
      fontFamily: "Manrope-Medium",
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.bold,
      color: CustomColors.BLACK,
      fontFamily: "Manrope-Medium",
    ),
  );

  /// Text For Dark Theme
  static final TextTheme darkTextTheme = TextTheme(
    headlineSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: CustomColors.WHITE,
      fontFamily: "Manrope-Medium",
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: CustomColors.WHITE,
      fontFamily: "Manrope-Medium",
    ),
    headlineLarge: const TextStyle().copyWith(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: CustomColors.WHITE,
      fontFamily: "Manrope-Medium",
    ),

    titleSmall: const TextStyle().copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: CustomColors.WHITE,
      fontFamily: "Manrope-Medium",
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.w500,
      color: CustomColors.WHITE,
      fontFamily: "Manrope-Medium",
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.bold,
      color: CustomColors.WHITE,
      fontFamily: "Manrope-Medium",
    ),

    bodySmall: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      color: CustomColors.GRAY_DARK,
      fontFamily: "Manrope-Medium",
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.normal,
      color: CustomColors.WHITE,
      fontFamily: "Manrope-Medium",
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.bold,
      color: CustomColors.WHITE,
      fontFamily: "Manrope-Medium",
    ),
  );
}
