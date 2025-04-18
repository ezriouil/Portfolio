import 'package:flutter/material.dart';

import '../../utils/constants/custom_images.dart';
import '../../utils/constants/custom_sizes.dart';
import '../../utils/state/custom_state.dart';

class CustomEmptyScreen extends CustomState {

  final String? imgUri;
  final bool withImg;

  const CustomEmptyScreen({super.key, this.imgUri, this.withImg = true});

  @override
  Widget execute(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(withImg) ... [
            Image.asset(imgUri ?? CustomImages.NOT_FOUND, color: imgUri == null ? darkLightColor(context) : null, height: 50, width: 50),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
          ],
          Text("Ooh Snap!", style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          Text("No Data Found !",
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }
}