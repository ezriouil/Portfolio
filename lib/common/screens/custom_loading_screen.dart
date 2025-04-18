import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';

import '../../utils/constants/custom_sizes.dart';
import '../../utils/state/custom_state.dart';

class CustomLoadingScreen extends CustomState {
  const CustomLoadingScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
              color: darkDarkLightLightColor(context),
              strokeCap: StrokeCap.round,
              backgroundColor: darkDarkLightLightColor(context).withValues(alpha: 0.1)
          ),
          const SizedBox(height: CustomSizes.SPACE_DEFAULT),
          Text("Loading", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkDarkLightLightColor(context))),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          Text("Process will take a few moments.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context)),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}