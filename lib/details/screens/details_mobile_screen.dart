import 'dart:html' as html;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/screens/custom_empty_screen.dart';
import 'package:portfolio/common/screens/custom_loading_screen.dart';
import 'package:portfolio/common/widgets/custom_outlined_button.dart';
import 'package:portfolio/details/details_controller.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';
import 'package:portfolio/utils/constants/custom_icons.dart';
import 'package:portfolio/utils/constants/custom_sizes.dart';
import 'package:portfolio/utils/state/custom_state.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailsMobileScreen extends CustomState {
  const DetailsMobileScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final DetailsController controller = Get.find<DetailsController>();
    return Obx(() => Scaffold(
      backgroundColor: grayColor(context).withValues(alpha: context.isDarkMode ? 0.6 : 0.9),
      body: controller.isLoading.value
          ? const CustomLoadingScreen()
          : controller.projectEntity.value == null ? const CustomEmptyScreen()
          : SizedBox(
        width: getWidth(context),
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT * 2),
           controller: controller.scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: CustomSizes.SPACE_BETWEEN_SECTIONS,
              children: [

                const SizedBox(),

                // STORES
                Container(
                    width: 800.0,
                    padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                    decoration: BoxDecoration(
                      color: grayColor(context),
                      border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          width: getWidth(context),
                          height: 250,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 10,
                                top: 0,
                                child: SizedBox(
                                  width: 90,
                                  height: 200,
                                  child: WidgetAnimator(
                                    atRestEffect: WidgetRestingEffects.wave(duration: const Duration(seconds: 3)),
                                    child: Transform.rotate(
                                      angle: -0.08,
                                      alignment: Alignment.topCenter,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(18),
                                          boxShadow: [
                                            BoxShadow(
                                              color: CustomColors.BLACK.withValues(alpha: 0.15),
                                              blurRadius: 20,
                                              spreadRadius: 2,
                                              offset: const Offset(6, 12),
                                            )
                                          ],
                                          image: DecorationImage(
                                            image: NetworkImage(controller.projectEntity.value?.imgLoginLight ?? ''),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 0,
                                child: SizedBox(
                                  width: 90,
                                  height: 200,
                                  child: WidgetAnimator(
                                    atRestEffect: WidgetRestingEffects.wave(duration: const Duration(seconds: 3)),
                                    child: Transform.rotate(
                                      angle: 0.08,
                                      alignment: Alignment.topCenter,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(18),
                                          boxShadow: [
                                            BoxShadow(
                                              color: CustomColors.BLACK.withValues(alpha: 0.15),
                                              blurRadius: 20,
                                              spreadRadius: 2,
                                              offset: const Offset(-6, 12),
                                            )
                                          ],
                                          image: DecorationImage(
                                            image: NetworkImage((controller.projectEntity.value?.imgLoginDark == '' ? controller.projectEntity.value?.imgRegisterLight : controller.projectEntity.value?.imgLoginDark) ?? ''),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 105,
                                height: 240,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [
                                      BoxShadow(
                                        color: CustomColors.BLACK.withValues(alpha: 0.15),
                                        blurRadius: 20,
                                        spreadRadius: 2,
                                        offset: const Offset(6, 12),
                                      )
                                    ],
                                    image: DecorationImage(
                                      image: NetworkImage(controller.projectEntity.value?.imgSplash ?? ''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                          children: [
                            Row(
                              spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                              children: [
                                Expanded(
                                  child: CustomOutlinedButton(
                                      elevation: 0,
                                      onPressed: controller.onGooglePlay,
                                      height: CustomSizes.SPACE_DEFAULT * 1.4,
                                      child: Row(
                                        spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 1.5,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(CustomIcons.STORES_GOOGLE_PLAY, height: 12, width: 12),
                                          Flexible(child: Text("Google Play", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context), fontSize: 8), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                        ],
                                      )
                                  ),
                                ),
                                Expanded(
                                  child: CustomOutlinedButton(
                                      elevation: 0,
                                      onPressed: controller.onAppleStore,
                                      height: CustomSizes.SPACE_DEFAULT * 1.4,
                                      child: Row(
                                        spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 1.5,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(CustomIcons.STORES_APPLE, height: 14, width: 14),
                                          Flexible(child: Text("Apple Store", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context), fontSize: 8), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                        ],
                                      )
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                              children: [
                                Expanded(
                                  child: CustomOutlinedButton(
                                      elevation: 0,
                                      onPressed: controller.onAppleStore,
                                      height: CustomSizes.SPACE_DEFAULT * 1.4,
                                      child: Row(
                                        spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 1.5,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(CustomIcons.CONTACT_GITHUB, height: 14, width: 14),
                                          Flexible(child: Text("Code Source", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context), fontSize: 8), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                        ],
                                      )),
                                ),
                                Expanded(
                                  child: CustomOutlinedButton(
                                      elevation: 0,
                                      onPressed: controller.onDownloadAPK,
                                      height: CustomSizes.SPACE_DEFAULT * 1.4,
                                      child: Row(
                                        spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 1.5,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.android, color: CustomColors.GREEN_DARK, size: 14),
                                          Flexible(child: Text("Download APK", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context), fontSize: 8), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                ),

                // VIDEO
                if(controller.youtubePlayerController.value != null && controller.projectEntity.value?.videoLink != '') ... [
                  Container(
                    width: getWidth(context),
                    padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                    decoration: BoxDecoration(
                        color: grayColor(context),
                        border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                    ),
                    child: Column(
                      children: [
                        Text(
                          "App Demo",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: darkDarkLightLightColor(context),
                            fontFamily: 'Recoleta-Bold',
                            color: darkDarkLightLightColor(context),
                          ),
                        ),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                        Text(
                          "Watch how the app works in real time and explore its main features.",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Recoleta-Medium',
                            color: darkDarkLightLightColor(context),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                        SizedBox(
                          width: getWidth(context),
                          height: 170,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            child: YoutubePlayer(
                              controller: controller.youtubePlayerController.value!,
                              aspectRatio: 9 / 16,
                              backgroundColor: redColor(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                // LIGHT MODE
                if(controller.lightImages.isNotEmpty) ... [
                  Container(
                    width: getWidth(context),
                    decoration: BoxDecoration(
                        color: grayColor(context),
                        border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                        Text("Light Theming", style: Theme.of(context).textTheme.headlineMedium?.copyWith(decoration: TextDecoration.underline, decorationColor: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                          child: Text("A bright and minimal theme focused on clarity and elegance.", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: 'Recoleta-Medium', color: darkDarkLightLightColor(context))),
                        ),
                        const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                        CarouselSlider(
                          options: CarouselOptions(
                              height: 300,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.5,
                              enlargeFactor: 0.5,
                              autoPlayInterval: const Duration(milliseconds: 2000),
                              autoPlayAnimationDuration: const Duration(milliseconds: 500),
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom
                          ),
                          items: controller.lightImages.map((imageUrl) { return _customScreen(context: context, imageUrl: imageUrl, onTap: () { html.window.open(imageUrl, '_blank'); }); }).toList(),
                        ),
                        const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                      ],
                    ),
                  ),
                ],

                // DARK MODE
                if(controller.darkImages.isNotEmpty) ... [
                  Container(
                    width: getWidth(context),
                    decoration: BoxDecoration(
                        color: grayColor(context),
                        border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                        Text("Dark Theming", style: Theme.of(context).textTheme.headlineMedium?.copyWith(decoration: TextDecoration.underline, decorationColor: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                          child: Text("A sleek and modern dark theme for a comfortable viewing experience.", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: 'Recoleta-Medium', color: darkDarkLightLightColor(context))),
                        ),
                        const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                        CarouselSlider(
                          options: CarouselOptions(
                              height: 300,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.5,
                              enlargeFactor: 0.5,
                              autoPlayInterval: const Duration(milliseconds: 2000),
                              autoPlayAnimationDuration: const Duration(milliseconds: 500),
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom
                          ),
                          items: controller.darkImages.map((imageUrl) { return _customScreen(context: context, imageUrl: imageUrl, onTap: () { html.window.open(imageUrl, '_blank'); }); }).toList(),
                        ),
                        const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                      ],
                    ),
                  ),
                ],

                // DESCRIPTION
                if(controller.projectEntity.value?.description != "") ... [
                  SizedBox(
                      width: getWidth(context),
                      child: Divider(color: darkDarkLightLightColor(context), thickness: 0.2, height: 0)
                  ),
                  Container(
                    width: getWidth(context),
                    padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
                    decoration: BoxDecoration(
                        color: grayColor(context),
                        border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Description", style: Theme.of(context).textTheme.titleLarge?.copyWith(decoration: TextDecoration.underline, decorationColor: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                        Text(controller.projectEntity.value?.description ?? "", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context)))
                      ],
                    ),
                  ),
                ],

                // TECHNOLOGIES
                if(controller.projectEntity.value?.technologies != "") ... [
                  SizedBox(
                      width: getWidth(context),
                      child: Divider(color: darkDarkLightLightColor(context), thickness: 0.2, height: 0)
                  ),
                  Container(
                    width: getWidth(context),
                    padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
                    decoration: BoxDecoration(
                        color: grayColor(context),
                        border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Technologies", style: Theme.of(context).textTheme.titleLarge?.copyWith(decoration: TextDecoration.underline, decorationColor: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                        Text(controller.projectEntity.value?.technologies ?? "", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context)))
                      ],
                    ),
                  ),
                ],

                // FEATURES
                if(controller.projectEntity.value?.features != "") ... [
                  SizedBox(
                      width: getWidth(context),
                      child: Divider(color: darkDarkLightLightColor(context), thickness: 0.2, height: 0)
                  ),
                  Container(
                    width: getWidth(context),
                    padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
                    decoration: BoxDecoration(
                        color: grayColor(context),
                        border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Features", style: Theme.of(context).textTheme.titleLarge?.copyWith(decoration: TextDecoration.underline, decorationColor: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                        Text(controller.projectEntity.value?.features ?? "", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context))),
                      ],
                    ),
                  )
                ],

                // FOOTER
                SizedBox(
                    width: getWidth(context),
                    child: Divider(color: darkDarkLightLightColor(context), thickness: 0.2, height: 0)
                ),
                Container(
                  width: getWidth(context),
                  padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
                  decoration: BoxDecoration(
                      color: grayColor(context),
                      border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                  ),
                  child: Column(
                    children: [
                      Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context)),
                          text: "Designed and built by",
                          children: <TextSpan>[
                            TextSpan(
                                text: '  Mohamed Ezriouil  ',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold')
                            ),
                            TextSpan(
                                text: "with love and coffee",
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context))
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _customContact(context: context, imgUri: CustomIcons.CONTACT_LINKEDIN, onPressed: controller.onLinkedIn),
                            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            _customContact(context: context, imgUri: CustomIcons.CONTACT_GMAIL, onPressed: controller.onGmail),
                            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            _customContact(context: context, imgUri: CustomIcons.CONTACT_GITHUB, color: darkDarkLightLightColor(context), onPressed: controller.onGithub),
                          ]
                      )
                    ],
                  ),
                ),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

              ],
            )),
      ),
      floatingActionButton: controller.isFabVisible.value && !controller.isLoading.value
          ? Transform.scale(
            scale: 0.8,
            child: FloatingActionButton(
            onPressed: () {/* controller.scrollingUp(); */},
            backgroundColor: CustomColors.WHITE,
            foregroundColor: CustomColors.BLACK,
            child: WidgetAnimator(
              atRestEffect: WidgetRestingEffects.wave(effectStrength: 0.6),
              child: const Icon(Icons.keyboard_double_arrow_up, color: CustomColors.BLACK),
            )
                  ),
          )
          : null,
    ));
  }

  Widget _customScreen({ required BuildContext context, required String imageUrl, required GestureTapCallback onTap }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: onTap,
        overlayColor: const WidgetStatePropertyAll<Color?>(CustomColors.TRANSPARENT),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 140,
            height: 300,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Widget _customContact({ required BuildContext context, required String imgUri, required GestureTapCallback onPressed, Color? color}) => InkWell(
    onTap: onPressed,
    overlayColor: const WidgetStatePropertyAll<Color?>(CustomColors.TRANSPARENT),
    child: Container(
      padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
      decoration: BoxDecoration(
          color: darkDarkLightLightColor(context).withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          border: Border.all(color: darkDarkLightLightColor(context))
      ),
      child: Image.asset(imgUri, width: 18.0, height: 18.0, fit: BoxFit.cover, color: color,),
    ),
  );

}