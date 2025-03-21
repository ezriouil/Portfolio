import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class CustomDatePickerTheme {
  CustomDatePickerTheme._();

  /// Date Picker For Light Theme
  static DatePickerThemeData lightDatePickerTheme = DatePickerThemeData(

    backgroundColor: CustomColors.WHITE,
    surfaceTintColor: CustomColors.TRANSPARENT,
    headerForegroundColor: CustomColors.BLACK,

    yearBackgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) { return CustomColors.PRIMARY; }
      return CustomColors.TRANSPARENT;
    }),
    yearForegroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) { return CustomColors.WHITE; }
      return CustomColors.BLACK;
    }),
    dayBackgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) { return CustomColors.PRIMARY; }
      return CustomColors.TRANSPARENT;
    }),
    dayForegroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) { return CustomColors.WHITE; }
      return CustomColors.BLACK;
    }),

    todayBackgroundColor: WidgetStateProperty.all(CustomColors.PRIMARY),
    todayForegroundColor: WidgetStateProperty.all(CustomColors.WHITE),
    cancelButtonStyle: ButtonStyle(foregroundColor: WidgetStateProperty.all(CustomColors.BLACK), backgroundColor: WidgetStateProperty.all(CustomColors.TRANSPARENT)),
    confirmButtonStyle: ButtonStyle(foregroundColor: WidgetStateProperty.all(CustomColors.BLACK), backgroundColor: WidgetStateProperty.all(CustomColors.TRANSPARENT)),
  );

  /// Date Picker For Dark Theme
  static DatePickerThemeData darkDatePickerTheme = DatePickerThemeData(

    backgroundColor: CustomColors.GRAY_DARK,
    surfaceTintColor: CustomColors.TRANSPARENT,
    headerForegroundColor: CustomColors.WHITE,

    yearBackgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) { return CustomColors.PRIMARY; }
      return CustomColors.TRANSPARENT;
    }),
    yearForegroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) { return CustomColors.BLACK; }
      return CustomColors.WHITE;
    }),
    dayBackgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) { return CustomColors.PRIMARY; }
      return CustomColors.TRANSPARENT;
    }),
    dayForegroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) { return CustomColors.BLACK; }
      return CustomColors.WHITE;
    }),

    todayBackgroundColor: WidgetStateProperty.all(CustomColors.PRIMARY),
    todayForegroundColor: WidgetStateProperty.all(CustomColors.BLACK),
    cancelButtonStyle: ButtonStyle(foregroundColor: WidgetStateProperty.all(CustomColors.WHITE), backgroundColor: WidgetStateProperty.all(CustomColors.TRANSPARENT)),
    confirmButtonStyle: ButtonStyle(foregroundColor: WidgetStateProperty.all(CustomColors.WHITE), backgroundColor: WidgetStateProperty.all(CustomColors.TRANSPARENT)),
  );

}
