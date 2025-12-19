import 'package:flutter/material.dart';

import '../../utils/constants/custom_sizes.dart';
import '../../utils/state/custom_state.dart';

class CustomElevatedButton extends CustomState {
  final double? width, height, elevation;
  final Color? bgColor;
  final Color? textColor;
  final GestureTapCallback onPressed;
  final Widget child;

  const CustomElevatedButton({super.key, required this.onPressed, required this.child, this.width, this.height, this.bgColor, this.textColor, this.elevation});

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
      width: width ?? getWidth(context),
      height: height ?? CustomSizes.SPACE_DEFAULT * 1.6,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
            backgroundColor: bgColor ?? darkDarkLightLightColor(context),
            foregroundColor: textColor,
            elevation: elevation ?? 3,
            shadowColor: bgColor ?? darkDarkLightLightColor(context),
            side: BorderSide.none,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(CustomSizes.SPACE_DEFAULT))),
          ),
          onPressed: onPressed,
          child: child
      ),
    );
  }
}