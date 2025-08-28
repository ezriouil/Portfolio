import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';
class CustomInputTheme {
  CustomInputTheme._();

  /// Text Field For Light Theme
  static InputDecorationTheme lightInputTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: CustomColors.GRAY_DARK,
    suffixIconColor: CustomColors.GRAY_DARK,
    labelStyle: const TextStyle().copyWith(fontSize: 10.0, color: CustomColors.GRAY_DARK, fontFamily: "Manrope-Medium"),
    errorStyle: const TextStyle().copyWith(fontSize: 9.0,fontStyle: FontStyle.normal, color: CustomColors.RED_LIGHT, fontFamily: "Manrope-Medium"),
    hintStyle: const TextStyle().copyWith(fontSize: 8.0, color: CustomColors.GRAY_LIGHT, fontFamily: "Manrope-Medium"),
    floatingLabelStyle: const TextStyle().copyWith(color: CustomColors.BLACK.withValues(alpha: 0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: CustomColors.GRAY_DARK)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: CustomColors.GRAY_DARK)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(8.0),
        borderSide:  BorderSide(color: CustomColors.BLACK.withValues(alpha: 0.8))),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: CustomColors.RED_DARK)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: CustomColors.RED_DARK.withValues(alpha: 0.5)),
    ),
  );

  /// Text Field For Dark Theme
  static InputDecorationTheme darkInputTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: CustomColors.GRAY_LIGHT,
    suffixIconColor: CustomColors.GRAY_LIGHT,
    labelStyle: const TextStyle().copyWith(fontSize: 10.0, color: CustomColors.GRAY_LIGHT, fontFamily: "Manrope-Medium"),
    errorStyle: const TextStyle().copyWith(fontSize: 9.0, fontStyle: FontStyle.normal, color: CustomColors.RED_LIGHT, fontFamily: "Manrope-Medium"),
    hintStyle: const TextStyle().copyWith(fontSize: 8.0, color: CustomColors.GRAY_DARK, fontFamily: "Manrope-Medium"),
    floatingLabelStyle: const TextStyle().copyWith(color: CustomColors.BLACK.withValues(alpha: 0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: CustomColors.GRAY_DARK)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: CustomColors.GRAY_DARK)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: CustomColors.WHITE)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: CustomColors.RED_LIGHT)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: CustomColors.RED_LIGHT.withValues(alpha: 0.5))),
  );
}
