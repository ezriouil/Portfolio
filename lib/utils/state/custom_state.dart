import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/custom_colors.dart';

abstract class CustomState extends StatelessWidget {
  const CustomState({super.key});

  @override
  Widget build(BuildContext context) {
    return execute(context);
  }

  /// BUILD METHODE
  Widget execute(BuildContext context);

  /// COLORS
  Color darkLightColor(BuildContext context) =>
      context.isDarkMode ? CustomColors.WHITE : CustomColors.BLACK;
  Color darkDarkLightLightColor(BuildContext context) =>
      context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE;
  Color grayColor(BuildContext context) =>
      context.isDarkMode ? CustomColors.GRAY_LIGHT : CustomColors.GRAY_DARK;
  Color blueColor(BuildContext context) =>
      context.isDarkMode ? CustomColors.BLUE_LIGHT : CustomColors.BLUE_DARK;
  Color greenColor(BuildContext context) =>
      context.isDarkMode ? CustomColors.GREEN_LIGHT : CustomColors.GREEN_DARK;
  Color yellowColor(BuildContext context) =>
      context.isDarkMode ? CustomColors.YELLOW_LIGHT : CustomColors.YELLOW_DARK;
  Color redColor(BuildContext context) =>
      context.isDarkMode ? CustomColors.RED_LIGHT : CustomColors.RED_DARK;
  Color purpleColor(BuildContext context) =>
      context.isDarkMode ? CustomColors.PURPLE_LIGHT : CustomColors.PURPLE_DARK;

  /// SIZES
  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
