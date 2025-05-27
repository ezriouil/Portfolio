import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';

import '../../utils/constants/custom_sizes.dart';

class CustomSnackBar{
  CustomSnackBar._();

  static error() => Get.snackbar("", "",
      overlayBlur: 2,
      margin: const EdgeInsets.all(12),
      maxWidth: MediaQuery.of(Get.context!).size.width * ((Get.context!.isPhone || Get.context!.isTablet) ? 1 : 0.5),
      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT, vertical: CustomSizes.SPACE_BETWEEN_ITEMS),
      titleText: Text("Oops Snap !", style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(color: CustomColors.WHITE)),
      messageText: Text("Not available right now, please try later ...", style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(color: CustomColors.WHITE)),
      backgroundColor: CustomColors.RED_DARK
  );
}