import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';
class CustomTextTheme{
  CustomTextTheme._();

  /// Text For Light Theme
  static final TextTheme lightTextTheme = TextTheme(
    headlineSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: CustomColors.BLACK, fontFamily: "poppins_regular"),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: CustomColors.BLACK, fontFamily: "poppins_regular"),
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: CustomColors.BLACK, fontFamily: "poppins_regular"),

    titleSmall: const TextStyle().copyWith(fontSize: 13.0, fontWeight: FontWeight.w400, color: CustomColors.BLACK, fontFamily: "poppins_regular"),
    titleMedium: const TextStyle().copyWith(fontSize: 13.0, fontWeight: FontWeight.w500, color: CustomColors.BLACK, fontFamily: "poppins_regular"),
    titleLarge: const TextStyle().copyWith(fontSize: 13.0, fontWeight: FontWeight.bold, color: CustomColors.BLACK, fontFamily: "poppins_regular"),

    bodySmall: const TextStyle().copyWith(fontSize: 11.0, fontWeight: FontWeight.w500, color: CustomColors.BLACK.withValues(alpha: 0.4), fontFamily: "poppins_regular"),
    bodyMedium: const TextStyle().copyWith(fontSize: 11.0, fontWeight: FontWeight.normal, color: CustomColors.BLACK, fontFamily: "poppins_regular"),
    bodyLarge: const TextStyle().copyWith(fontSize: 11.0, fontWeight: FontWeight.bold, color: CustomColors.BLACK, fontFamily: "poppins_regular"),
  );

  /// Text For Dark Theme
  static final TextTheme darkTextTheme = TextTheme(
    headlineSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: CustomColors.WHITE, fontFamily: "poppins_regular"),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: CustomColors.WHITE, fontFamily: "poppins_regular"),
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: CustomColors.WHITE, fontFamily: "poppins_regular"),

    titleSmall: const TextStyle().copyWith(fontSize: 13.0, fontWeight: FontWeight.w400, color: CustomColors.WHITE, fontFamily: "poppins_regular"),
    titleMedium: const TextStyle().copyWith(fontSize: 13.0, fontWeight: FontWeight.w500, color: CustomColors.WHITE, fontFamily: "poppins_regular"),
    titleLarge: const TextStyle().copyWith(fontSize: 13.0, fontWeight: FontWeight.bold, color: CustomColors.WHITE, fontFamily: "poppins_regular"),

    bodySmall: const TextStyle().copyWith(fontSize: 11.0, fontWeight: FontWeight.w500, color: CustomColors.GRAY_DARK, fontFamily: "poppins_regular"),
    bodyMedium: const TextStyle().copyWith(fontSize: 11.0, fontWeight: FontWeight.normal, color: CustomColors.WHITE, fontFamily: "poppins_regular"),
    bodyLarge: const TextStyle().copyWith(fontSize: 11.0, fontWeight: FontWeight.bold, color: CustomColors.WHITE, fontFamily: "poppins_regular"),
  );
}
