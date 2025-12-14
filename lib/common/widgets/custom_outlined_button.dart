import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';

import '../../utils/constants/custom_sizes.dart';
import '../../utils/state/custom_state.dart';

class CustomOutlinedButton  extends CustomState {

  final double? width, height, elevation;
  final Color? color;
  final GestureTapCallback onPressed;
  final Widget child;

  const CustomOutlinedButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.width,
      this.height,
      this.color,
      this.elevation
      });

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
      width: width ?? getWidth(context),
      height: height ?? CustomSizes.SPACE_DEFAULT * 1.6,
      child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
            elevation: elevation ?? 3,
            foregroundColor: color ?? darkDarkLightLightColor(context),
            backgroundColor: CustomColors.TRANSPARENT,
            shadowColor: color ?? darkDarkLightLightColor(context),
            side: BorderSide(color: color ?? darkDarkLightLightColor(context)),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(CustomSizes.SPACE_DEFAULT))),
          ),
          onPressed: onPressed,
          child: child
      ),
    );
  }
}