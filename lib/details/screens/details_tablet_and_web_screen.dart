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

class DetailsTabletAndWebScreen extends CustomState {
  const DetailsTabletAndWebScreen({super.key});

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

                  // THUMBNAIL + VIDEO
                  Container(
                    width: 800.0,
                    padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                    decoration: BoxDecoration(
                        color: grayColor(context),
                        border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                    ),
                    child: Column(
                      children: [
                        Row(
                          spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                                child: Image.network(controller.projectEntity.value?.logo ?? "", height: 36, width: 36)),
                            Text(controller.projectEntity.value?.title ?? "", overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 16, letterSpacing: 0.5, color: darkDarkLightLightColor(context))),
                          ],
                        ),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                        (controller.youtubePlayerController.value != null && controller.projectEntity.value?.videoLink != null && controller.projectEntity.value?.videoLink != '')
                            ? SizedBox(
                          width: getWidth(context),
                          height: 350,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            child: YoutubePlayer(
                              controller: controller.youtubePlayerController.value!,
                              aspectRatio: 9 / 16,
                              backgroundColor: redColor(context),
                            ),
                          ),
                        )
                            : SizedBox(
                            width: getWidth(context),
                            height:  MediaQuery.of(context).size.width < 800 ? 250 : 300,
                            child: DecoratedBox(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(controller.projectEntity.value?.thumbnail ?? ""), fit: BoxFit.fitWidth)
                            ))
                        ),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
                          children: [
                            Row(
                              spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
                              children: [
                                Expanded(
                                  child: CustomOutlinedButton(
                                      elevation: 0,
                                      onPressed: controller.onGooglePlay,
                                      height: CustomSizes.SPACE_DEFAULT * 1.5,
                                      child: Row(
                                        spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(CustomIcons.STORES_GOOGLE_PLAY, height: 20, width: 20),
                                          const Text("Google Play"),
                                        ],
                                      )),
                                ),
                                Expanded(
                                  child: CustomOutlinedButton(
                                      elevation: 0,
                                      onPressed: controller.onAppleStore,
                                      height: CustomSizes.SPACE_DEFAULT * 1.5,
                                      child: Row(
                                        spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(CustomIcons.STORES_APPLE, height: 24, width: 24),
                                          const Text("Apple Store"),
                                        ],
                                      )),
                                ),
                                Expanded(
                                  child: CustomOutlinedButton(
                                      elevation: 0,
                                      onPressed: controller.onDownloadAPK,
                                      height: CustomSizes.SPACE_DEFAULT * 1.5,
                                      child: const Row(
                                        spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.android, color: CustomColors.GREEN_DARK, size: 24),
                                          Text("Download APK"),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                            CustomOutlinedButton(
                                elevation: 0,
                                onPressed: controller.onAppleStore,
                                height: CustomSizes.SPACE_DEFAULT * 1.5,
                                child: Row(
                                  spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(CustomIcons.CONTACT_GITHUB, height: 24, width: 24),
                                    const Text("Code Source"),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // LIGHT MODE
                  if(controller.lightImages.isNotEmpty) ... [
                    SizedBox(
                        width: 800.0,
                        child: Divider(color: darkDarkLightLightColor(context), thickness: 0.2, height: 0)
                    ),
                    Container(
                      width: 800.0,
                      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_DEFAULT),
                      decoration: BoxDecoration(
                          color: grayColor(context),
                          border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Light Theming", style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24, decoration: TextDecoration.underline, decorationColor: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Text("A bright and minimal theme focused on clarity and elegance.", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontFamily: 'Recoleta-Medium', fontSize: 16, color: darkDarkLightLightColor(context))),
                          const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                          CarouselSlider(
                            options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                height: MediaQuery.of(context).size.width < 800 ? 250 : 200,
                                viewportFraction: MediaQuery.of(context).size.width < 800 ? 0.25 : 0.15,
                                enlargeFactor: MediaQuery.of(context).size.width < 800 ? 0.25 : 0.18,
                                autoPlayInterval: const Duration(milliseconds: 2000),
                                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                                enlargeStrategy: CenterPageEnlargeStrategy.zoom
                            ),
                            items: controller.lightImages.map((imageUrl) { return _customScreen(context: context, imageUrl: imageUrl); }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // DARK MODE
                  if(controller.darkImages.isNotEmpty) ... [
                    SizedBox(
                        width: 800.0,
                        child: Divider(color: darkDarkLightLightColor(context), thickness: 0.2, height: 0)
                    ),
                    Container(
                      width: 800.0,
                      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_DEFAULT),
                      decoration: BoxDecoration(
                          color: grayColor(context),
                          border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                      ),
                      child: Column(
                        children: [
                          Text("Dark Theming", style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24, decoration: TextDecoration.underline, decorationColor: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Text("A sleek and modern dark theme for a comfortable viewing experience.", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontFamily: 'Recoleta-Medium', fontSize: 16, color: darkDarkLightLightColor(context))),
                          const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                          CarouselSlider(
                            options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                height: MediaQuery.of(context).size.width < 800 ? 250 : 200,
                                viewportFraction: MediaQuery.of(context).size.width < 800 ? 0.25 : 0.15,
                                enlargeFactor: MediaQuery.of(context).size.width < 800 ? 0.25 : 0.18,
                                autoPlayInterval: const Duration(milliseconds: 2000),
                                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                                enlargeStrategy: CenterPageEnlargeStrategy.zoom
                            ),
                            items: controller.darkImages.map((imageUrl) {
                              return _customScreen(context: context, imageUrl: imageUrl);
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // DESCRIPTION
                  if(controller.projectEntity.value?.description != '') ... [
                    SizedBox(
                        width: 800.0,
                        child: Divider(color: darkDarkLightLightColor(context), thickness: 0.2, height: 0)
                    ),
                    Container(
                      width: 800.0,
                      padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
                      decoration: BoxDecoration(
                          color: grayColor(context),
                          border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, decoration: TextDecoration.underline, decorationColor: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Text(controller.projectEntity.value?.description ?? "", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context)))
                        ],
                      ),
                    )
                  ],

                  // TECHNOLOGIES
                  if(controller.projectEntity.value?.description != "") ... [
                    SizedBox(
                        width: 800.0,
                        child: Divider(color: darkDarkLightLightColor(context), thickness: 0.2, height: 0)
                    ),
                    Container(
                      width: 800.0,
                      padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
                      decoration: BoxDecoration(
                          color: grayColor(context),
                          border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Technologies", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, decoration: TextDecoration.underline, decorationColor: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Text(controller.projectEntity.value?.technologies ?? "", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context)))
                        ],
                      ),
                    )
                  ],

                  // FEATURES
                  if(controller.projectEntity.value?.features != "") ... [
                    SizedBox(
                        width: 800.0,
                        child: Divider(color: darkDarkLightLightColor(context), thickness: 0.2, height: 0)
                    ),
                    Container(
                      width: 800.0,
                      padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
                      decoration: BoxDecoration(
                          color: grayColor(context),
                          border: Border.all(color: darkDarkLightLightColor(context), width: 0.3),
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Features", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, decoration: TextDecoration.underline, decorationColor: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Text(controller.projectEntity.value?.features ?? "", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context))),
                        ],
                      ),
                    )
                  ],

                  // FOOTER
                  SizedBox(
                      width: 800.0,
                      child: Divider(color: darkDarkLightLightColor(context), thickness: 0.2, height: 0)
                  ),
                  Container(
                    width: 800.0,
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
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context)),
                            text: "Designed and built by",
                            children: <TextSpan>[
                              TextSpan(
                                  text: '  Mohamed Ezriouil  ',
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', fontSize: 16)
                              ),
                              TextSpan(
                                  text: "with love and coffee",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context))
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
              onPressed: () { /*controller.scrollingUp();*/ },
              backgroundColor: CustomColors.WHITE,
              foregroundColor: CustomColors.BLACK,
              child: WidgetAnimator(
                atRestEffect: WidgetRestingEffects.wave(effectStrength: 0.6),
                child: const Icon(Icons.keyboard_double_arrow_up, color: CustomColors.BLACK),
              )
                      ),
            )
            : null
    ));
  }

  Widget _customScreen({ required BuildContext context, required String imageUrl }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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