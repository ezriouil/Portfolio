import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';

import '../../utils/constants/custom_sizes.dart';

class CustomSnackBar{
  CustomSnackBar._();

  static error() => Get.snackbar("", "",
      overlayBlur: 2,
      margin: const EdgeInsets.all(12),
      maxWidth: MediaQuery.of(Get.context!).size.width * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT, vertical: CustomSizes.SPACE_BETWEEN_ITEMS),
      titleText: Text("Oops Snap !", style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(color: CustomColors.WHITE)),
      messageText: Text("Not available right now, please try later ...", style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(color: CustomColors.WHITE)),
      backgroundColor: CustomColors.RED_DARK
  );

  static emailSent() => Get.snackbar(
    "",
    "",
    overlayBlur: 2,
    margin: const EdgeInsets.all(12),
    maxWidth: MediaQuery.of(Get.context!).size.width * 0.6,

    padding: const EdgeInsets.symmetric(
      horizontal: CustomSizes.SPACE_DEFAULT,
      vertical: CustomSizes.SPACE_BETWEEN_ITEMS,
    ),
    titleText: Text(
      "Email Sent",
      style: Theme.of(Get.context!)
          .textTheme
          .bodyLarge
          ?.copyWith(color: CustomColors.WHITE, fontWeight: FontWeight.bold),
    ),
    messageText: Text(
      "Your email has been sent successfully.",
      style: Theme.of(Get.context!)
          .textTheme
          .bodySmall
          ?.copyWith(color: CustomColors.WHITE),
    ),
    backgroundColor: CustomColors.GREEN_DARK,
  );


}