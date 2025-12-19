import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/screens/custom_loading_screen.dart';
import 'package:portfolio/common/widgets/custom_elevated_button.dart';
import 'package:portfolio/common/widgets/custom_outlined_button.dart';
import 'package:portfolio/common/widgets/custom_text_field.dart';
import 'package:portfolio/home/home_controller.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';
import 'package:portfolio/utils/constants/custom_icons.dart';
import 'package:portfolio/utils/constants/custom_images.dart';
import 'package:portfolio/utils/constants/custom_sizes.dart';
import 'package:portfolio/utils/state/custom_state.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HomeMobileScreen extends CustomState {
  const HomeMobileScreen({super.key});

  @override
  Widget execute(BuildContext context) {
   final HomeController controller = Get.find<HomeController>();
    return Obx(() => Scaffold(
      backgroundColor: grayColor(context),
      body: Stack(
        children: [
          ParallaxRain(
            dropColors: [
              CustomColors.GRAY_DARK,
              CustomColors.GRAY_LIGHT,
              CustomColors.WHITE
            ],
            trail: true,
            dropWidth: 0.2,
            dropFallSpeed: 2.5,
            numberOfDrops: 100,
          ),
          SingleChildScrollView(
            child: Column(
          children: [

            // HOME
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
              child: Column(
                children: [
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  SizedBox(
                    key: controller.homeKey,
                    width: 250,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: grayColor(context),
                              borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS * 3),
                              border: Border.all(width: 0.6, color: darkDarkLightLightColor(context))
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS * 3),
                            child: SizedBox(
                                width: 130,
                                height: 130,
                                child: Image.asset(CustomImages.MOHAMED_EZRIOUIL,
                                  width: getWidth(context),
                                  height: getHeight(context),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            child: Container(
                              width: 150,
                              padding: const EdgeInsets.symmetric(
                                vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 4,
                                horizontal: CustomSizes.SPACE_BETWEEN_ITEMS,
                              ),
                              decoration: BoxDecoration(
                                  color: grayColor(context),
                                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                                  border: Border.all(width: 0.6, color: darkDarkLightLightColor(context))
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AvatarGlow(
                                    glowCount: 5,
                                    glowColor: (controller.isDarkTheme.value ? CustomColors.GRAY_DARK : CustomColors.GREEN_DARK).withValues(alpha: 0.1),
                                    glowRadiusFactor: 0.2,
                                    child: Icon(
                                        Icons.add_circle,
                                        size: 15,
                                        color: controller.isDarkTheme.value ? CustomColors.GRAY_DARK : CustomColors.GREEN_DARK
                                    ),
                                  ),
                                  const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 1.2),
                                  Text("Available", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: controller.isDarkTheme.value ? CustomColors.GRAY_DARK : CustomColors.GREEN_DARK)),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  Text("Welcome to\nmy digital humble abode",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontFamily: 'Recoleta-Medium',
                          fontSize: 14,
                          letterSpacing: 1.2,
                          color: darkDarkLightLightColor(context)
                      )
                  ),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                  Text.rich(
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context)),
                      text: "I’m",
                      children: <TextSpan>[
                        TextSpan(
                            text: '   Mobile   ',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold')
                        ),
                        TextSpan(
                            text: "&",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context))
                        ),
                        TextSpan(
                            text: "   Web   ",
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold')
                        ),
                        TextSpan(
                            text: "Developer",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context))
                        ),
                        TextSpan(
                            text: "\nSpecializing in building digital applications focused on user experience.",
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: darkDarkLightLightColor(context))
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: CustomElevatedButton(
                            width: 150,
                            height: CustomSizes.SPACE_BETWEEN_SECTIONS * 1.1,
                            elevation: 0,
                            textColor: CustomColors.WHITE,
                            bgColor: CustomColors.BLACK,
                            onPressed: controller.onContact,
                            child: Text("Let's Talk", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: CustomColors.WHITE))
                        ),
                      ),
                      const SizedBox(width: CustomSizes.SPACE_DEFAULT * 0.8),
                      Flexible(
                        child: CustomOutlinedButton(
                            width: 150,
                            height: CustomSizes.SPACE_BETWEEN_SECTIONS * 1.1,
                            elevation: 0,
                            onPressed: controller.onDownloadResume,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Resume", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context))),
                                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                WidgetAnimator(
                                    atRestEffect: WidgetRestingEffects.wave(effectStrength: 0.6),
                                    child: Obx(() => Icon(Icons.downloading, size: 14.0, color: controller.isDarkTheme.value ? CustomColors.BLACK : CustomColors.WHITE))
                                ),
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2.5),
                ],
              ),
            ),

            // SKILLS
            SizedBox(
                height: 40,
                width: getWidth(context),
                child: Stack(
                  children: [
                    ListView.builder(
                        controller: controller.skillsZeroScrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.skills.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                          child: Image.asset(controller.skills[index], width: 24, height: 24),
                        )),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      width: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              grayColor(context),
                              grayColor(context).withOpacity(0.8),
                              grayColor(context).withOpacity(0.5),
                              grayColor(context).withOpacity(0.3),
                              grayColor(context).withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      width: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              grayColor(context),
                              grayColor(context).withOpacity(0.8),
                              grayColor(context).withOpacity(0.5),
                              grayColor(context).withOpacity(0.3),
                              grayColor(context).withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2.5),

            // PROJECTS
            Column(
              key: controller.projectsKey,
              children: [
                Text("Projects", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 24, color: darkDarkLightLightColor(context))),
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Row(
                  spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () { controller.cardSwiperController.swipe(CardSwiperDirection.left); },
                        overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                        child: Container(
                            padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT * 2),
                                border: Border.all(width: 0.6, color: darkDarkLightLightColor(context))),
                            child: WidgetAnimator(atRestEffect: WidgetRestingEffects.dangle(effectStrength: 0.6), child: Obx(() =>  Icon(Icons.keyboard_double_arrow_left, size: 16, color: controller.isDarkTheme.value ? CustomColors.BLACK : CustomColors.WHITE)))
                        )
                    ),
                    Text("Some projects i have worked", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Recoleta-Medium', fontSize: 16, letterSpacing: 1.2, color: darkDarkLightLightColor(context))),
                    InkWell(
                        onTap: () { controller.cardSwiperController.swipe(CardSwiperDirection.right); },
                        overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                        child: Container(
                            padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT * 2),
                                border: Border.all(width: 0.6, color: darkDarkLightLightColor(context))),
                            child: WidgetAnimator(atRestEffect: WidgetRestingEffects.dangle(effectStrength: 0.6), child: Obx(() =>  Icon(Icons.keyboard_double_arrow_right, size: 16, color: controller.isDarkTheme.value ? CustomColors.BLACK : CustomColors.WHITE)))
                        )
                    ),
                  ],
                ),
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                SizedBox(
                  width: getWidth(context),
                  height: 520,
                  child: controller.projects.isEmpty
                      ? const CustomLoadingScreen()
                      : CardSwiper(
                          cardsCount: controller.projects.length <= 3
                              ? controller.projects.length
                              : 3,
                          numberOfCardsDisplayed:
                              controller.projects.length <= 3
                                  ? controller.projects.length
                                  : 3,
                          cardBuilder: (context, index, percentThresholdX,
                              percentThresholdY) {
                            final project = controller.projects[index];
                            return _customProject(
                              context: context,
                              logoUri: project.logo ?? "",
                              title: project.title ?? "",
                              description: project.description ?? "",
                              thumbnailUri: project.thumbnail ?? "",
                              
                              onGooglePlay: () => controller.launchProjectLink(project.googlePlayLink),
                              onAppStore: () => controller.launchProjectLink(project.appStoreLink),
                              onVideo: () => controller.launchProjectLink(project.videoLink),
                            );
                          },
                        ),
                ),
              ],
            ),

            // SKILLS
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2.5),
            SizedBox(
                height: 40,
                width: getWidth(context),
                child: Stack(
                  children: [
                    ListView.builder(
                        controller: controller.skillsFirstScrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.skills.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                          child: Image.asset(controller.skills[index], width: 24, height: 24),
                        )),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      width: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              grayColor(context),
                              grayColor(context).withOpacity(0.8),
                              grayColor(context).withOpacity(0.5),
                              grayColor(context).withOpacity(0.3),
                              grayColor(context).withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      width: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              grayColor(context),
                              grayColor(context).withOpacity(0.8),
                              grayColor(context).withOpacity(0.5),
                              grayColor(context).withOpacity(0.3),
                              grayColor(context).withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2.5),

            // EXPERIENCES
            Column(
              key: controller.experiencesKey,
              children: [
                Text("Experiences", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 24, color: darkDarkLightLightColor(context))),
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Text("My professional journey and achievements", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Recoleta-Medium', fontSize: 16, letterSpacing: 1.2, color: darkDarkLightLightColor(context)), textAlign: TextAlign.center),
                const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
                  child: SizedBox(
                    width: getWidth(context),
                    child: Obx(() => controller.experiences.isEmpty
                        ? const CustomLoadingScreen()
                        : Column(
                            children: List.generate(
                              controller.experiences.length,
                              (index) {
                                final experience = controller.experiences[index];
                                final isLeft = false;
                                final isFirst = index == 0;
                                final isLast = index == controller.experiences.length - 1;
                                return _buildTimelineItem(
                                  context: context,
                                  isLeft: isLeft,
                                  isFirst: isFirst,
                                  isLast: isLast,
                                  fromDate: experience.fromDate ?? "",
                                  toDate: experience.toDate ?? "",
                                  title: experience.title ?? "",
                                  subtitle: experience.subTitle ?? "",
                                  description: experience.description ?? "",
                                );
                              },
                            ),
                          )),
                  ),
                ),
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2.5),
              ],
            ),

    
            // SKILLS
            SizedBox(
                height: 40,
                width: getWidth(context),
                child: Stack(
                  children: [
                    ListView.builder(
                        controller: controller.skillsSecondScrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.skills.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                          child: Image.asset(controller.skills[index], width: 24, height: 24),
                        )),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      width: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              grayColor(context),
                              grayColor(context).withOpacity(0.8),
                              grayColor(context).withOpacity(0.5),
                              grayColor(context).withOpacity(0.3),
                              grayColor(context).withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      width: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              grayColor(context),
                              grayColor(context).withOpacity(0.8),
                              grayColor(context).withOpacity(0.5),
                              grayColor(context).withOpacity(0.3),
                              grayColor(context).withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                    )),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2.5),

            // MOBILE + STORES
            Text("Skills", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 24, color: darkDarkLightLightColor(context))),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            Text("Technologies i'm working with", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Recoleta-Medium', fontSize: 16, letterSpacing: 1.2, color: darkDarkLightLightColor(context))),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
              width: getWidth(context),
              decoration: BoxDecoration(
                  color: grayColor(context),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    bottomLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                    bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
                  ),
                  border: Border.all(width: 0.6, color: darkDarkLightLightColor(context))
              ),
              child: Column(
                children: [
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  Text('Mobile', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 20, color: darkDarkLightLightColor(context))),
                  Divider(color: darkDarkLightLightColor(context), thickness: 0.5, indent: CustomSizes.SPACE_DEFAULT, endIndent: CustomSizes.SPACE_DEFAULT),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.MOBILE_DART, title: "DART")),
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.MOBILE_KOTLIN, title: "KOTLIN")),
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.MOBILE_FLUTTER, title: "FLUTTER")),
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.MOBILE_JAVA, title: "JAVA")),
                      ],
                    ),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS)
                ],
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
              width: getWidth(context),
              decoration: BoxDecoration(
                  color: grayColor(context),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    bottomLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                    bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
                  ),
                  border: Border.all(width: 0.6, color: darkDarkLightLightColor(context))
              ),
              child: Column(
                children: [
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  Text('Stores', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 20, color: darkDarkLightLightColor(context))),
                  Divider(color: darkDarkLightLightColor(context), thickness: 0.5, indent: CustomSizes.SPACE_DEFAULT, endIndent: CustomSizes.SPACE_DEFAULT),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.STORES_GOOGLE_PLAY, title: "PLAY STORE")),
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.STORES_APPLE, title: "APP STORE")),
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.STORES_AMAZON, title: "AMAZON")),
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.STORES_HUAWEI, title: "APP GALLERY")),
                      ],
                    ),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS)
                ],
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            // WEB + DB
            Container(
              margin: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
              width: getWidth(context),
              decoration: BoxDecoration(
                  color: grayColor(context),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    bottomLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                    bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
                  ),
                  border: Border.all(width: 0.6, color: darkDarkLightLightColor(context))
              ),
              child: Column(
                children: [
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  Text('Web', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 20, color: darkDarkLightLightColor(context))),
                  Divider(color: darkDarkLightLightColor(context), thickness: 0.5, indent: CustomSizes.SPACE_DEFAULT, endIndent: CustomSizes.SPACE_DEFAULT),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                      child:  Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: _customSkill(context: context, imgUri: CustomIcons.WEB_HTML, title: "HTML")),
                              Expanded(child: _customSkill(context: context, imgUri: CustomIcons.WEB_CSS, title: "CSS")),
                              Expanded(child: _customSkill(context: context, imgUri: CustomIcons.WEB_JS, title: "JAVA SCRIPT")),
                              Expanded(child: _customSkill(context: context, imgUri: CustomIcons.WEB_REACT_JS, title: "REACT JS")),
                            ],
                          ),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: _customSkill(context: context, imgUri: CustomIcons.WEB_TAILWIND_CSS, title: "TAILWIND CSS")),
                              Expanded(child: _customSkill(context: context, imgUri: CustomIcons.WEB_NODE_JS, title: "NODE JS")),
                              Expanded(child: _customSkill(context: context, imgUri: CustomIcons.WEB_EXPRESS_JS, title: "EXPRESS JS", color: darkDarkLightLightColor(context))),
                              Expanded(child: _customSkill(context: context, imgUri: CustomIcons.WEB_PYTHON, title: "PYTHON")),
                            ],
                          ),
                        ],
                      )
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS)
                ],
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
              width: getWidth(context),
              decoration: BoxDecoration(
                  color: grayColor(context),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    bottomLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                    bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
                  ),
                  border: Border.all(width: 0.6, color: darkDarkLightLightColor(context))
              ),
              child: Column(
                children: [
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  Text('Database', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 20, color: darkDarkLightLightColor(context))),
                  Divider(color: darkDarkLightLightColor(context), thickness: 0.5, indent: CustomSizes.SPACE_DEFAULT, endIndent: CustomSizes.SPACE_DEFAULT),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.DB_MONGO_DB, title: "MONGO DB")),
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.DB_FIREBASE, title: "FIREBASE")),
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.DB_SQL, title: "SQL")),
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.DB_SUPABASE, title: "SUPABASE")),
                      ],
                    ),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS)
                ],
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            // EDITORS + DESIGN
            Container(
              margin: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
              width: getWidth(context),
              decoration: BoxDecoration(
                  color: grayColor(context),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    bottomLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                    bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
                  ),
                  border: Border.all(width: 0.6, color: darkDarkLightLightColor(context))
              ),
              child: Column(
                children: [
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  Text('Editors', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                  Divider(color: darkDarkLightLightColor(context), thickness: 0.5, indent: CustomSizes.SPACE_DEFAULT, endIndent: CustomSizes.SPACE_DEFAULT),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.EDITORS_ANDROID_STUDIO, title: "ANDROID STUDIO")),
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.EDITORS_VS_CODE, title: "VS CODE")),
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.EDITORS_INTELLIJ_IDEA, title: "INTELLIJ IDEA")),
                        Expanded(child: _customSkill(context: context, imgUri: CustomIcons.EDITORS_SUBLIME, title: "SUBLIME")),
                      ],
                    ),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS)
                ],
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
              width: getWidth(context),
              decoration: BoxDecoration(
                  color: grayColor(context),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                    bottomLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                    bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
                  ),
                  border: Border.all(width: 0.6, color: darkDarkLightLightColor(context))
              ),
              child: Column(
                children: [
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  Text('Design', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                  Divider(color: darkDarkLightLightColor(context), thickness: 0.5, indent: CustomSizes.SPACE_DEFAULT, endIndent: CustomSizes.SPACE_DEFAULT),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: CustomSizes.SPACE_DEFAULT,
                      children: [
                        _customSkill(context: context, imgUri: CustomIcons.DESIGN_FIGMA, title: "FIGMA"),
                        _customSkill(context: context, imgUri: CustomIcons.DESIGN_CANVA, title: "CANVA"),
                      ],
                    ),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS)
                ],
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2.5),

            // SKILLS
            SizedBox(
                height: 40,
                width: getWidth(context),
                child: Stack(
                  children: [
                    ListView.builder(
                        controller: controller.skillsLastScrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.skills.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                          child: Image.asset(controller.skills[index], width: 24, height: 24),
                        )),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      width: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              grayColor(context),
                              grayColor(context).withOpacity(0.8),
                              grayColor(context).withOpacity(0.5),
                              grayColor(context).withOpacity(0.3),
                              grayColor(context).withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      width: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              grayColor(context),
                              grayColor(context).withOpacity(0.8),
                              grayColor(context).withOpacity(0.5),
                              grayColor(context).withOpacity(0.3),
                              grayColor(context).withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                    )),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2.5),

            // CONTACT ME
            SizedBox(
              key: controller.contactKey,
              width: getWidth(context),
              child: Form(
                key: controller.formState,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
                  child: Column(
                    children: [
                      Text("Contact Me", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 24, color: darkDarkLightLightColor(context))),
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                      Text("Let's talk on something great together", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Recoleta-Medium', fontSize: 16, letterSpacing: 1.2, color: darkDarkLightLightColor(context)), textAlign: TextAlign.center),
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),
                      CustomTextField(
                          controller: controller.fullNameController,
                          hint: "Full Name",
                          icon: Icons.person_outline,
                          validator: (value){
                            if (value == null || value.isEmpty || value.length < 2) { return "Field must not be empty"; }
                            return null;
                          }),
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                      CustomTextField(
                          controller: controller.objectController,
                          hint: "Object",
                          icon: Icons.sms_outlined,
                          validator: (value){
                            if (value == null || value.isEmpty || value.length < 2) { return "Field must not be empty"; }
                            return null;
                          }),
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                      CustomTextField(
                          controller: controller.messageController,
                          hint: "Message",
                          validator: (value){
                            if (value == null || value.isEmpty || value.length < 10) { return "Field must not be empty"; }
                            return null;
                          },
                          minLines: 8,
                          maxLines: 12
                      ),
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_SECTIONS * 3),
                        child: CustomElevatedButton(
                            onPressed: (){
                              if(controller.isSending.value) return;
                              controller.onSend(); },
                            textColor: darkLightColor(context),
                            elevation: 0,
                            child: controller.isSending.value
                                ? SizedBox(width: CustomSizes.SPACE_DEFAULT, height: CustomSizes.SPACE_DEFAULT, child: CircularProgressIndicator(color: darkLightColor(context), strokeWidth: 3, backgroundColor: darkLightColor(context).withValues(alpha: 0.2)))
                                : const Text("Send")
                        ),
                      )],
                  ),
                ),
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

            // FOOTER
            Padding(
              padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_SECTIONS, horizontal: CustomSizes.SPACE_DEFAULT),
              child: Column(
                children: [
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkDarkLightLightColor(context)),
                      text: "Built by",
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Mohamed Ezriouil ',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', fontSize: 16)
                        ),
                        TextSpan(
                            text: "with love",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkDarkLightLightColor(context))
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
            )
          ],
              ),
            ),
          ],
        ),
      floatingActionButton: Transform.scale(
        scale: 0.8,
        child: FloatingActionButton(
            heroTag: "3",
            elevation: 16,
            onPressed: () { controller.onChangeColorTheming(); },
            backgroundColor: darkDarkLightLightColor(context),
            child: WidgetAnimator(
                child: InkWell(
                    onTap: controller.onChangeColorTheming,
                    child: Obx(() => controller.isDarkTheme.value
                        ? const Icon(Icons.dark_mode_outlined, color: CustomColors.WHITE)
                        : WidgetAnimator(atRestEffect: WidgetRestingEffects.rotate(), child: const Icon(Icons.light_mode_outlined, color: CustomColors.BLACK)))
                )
            )
        ),
      ),
    ));
  }

  Widget _customProject(
      {required BuildContext context,
        required String logoUri,
        required String title,
        required String description,
        required String thumbnailUri,
        required GestureTapCallback onGooglePlay,
        required GestureTapCallback onAppStore,
        required GestureTapCallback onVideo
      }) => Container(
      width: getWidth(context), padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_ITEMS), decoration: BoxDecoration(
            border: Border.all(
                width: 0.6,
                color: context.isDarkMode
                    ? CustomColors.GRAY_DARK
                    : CustomColors.GRAY_LIGHT),
            borderRadius:
                BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  (context.isDarkMode
                      ? CustomColors.GRAY_LIGHT
                      : CustomColors.GRAY_DARK),
                  (context.isDarkMode
                      ? CustomColors.WHITE
                      : CustomColors.BLACK),
                  (context.isDarkMode
                      ? CustomColors.GRAY_LIGHT
                      : CustomColors.GRAY_DARK),
                ]),
            boxShadow: [
              BoxShadow(
                color: context.isDarkMode
                    ? CustomColors.GRAY_LIGHT
                    : CustomColors.GRAY_DARK,
                blurRadius: 1,
                blurStyle: BlurStyle.inner,
                offset: const Offset(2, 2),
              ),
            ],
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
              children: [
                Row(
                  spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                        child: Image.network(logoUri, height: 35, width: 35)),
                    Text(title, style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 14, letterSpacing: 0.5, color: darkDarkLightLightColor(context))),
                  ],
                ),
                Text(description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12, color: darkDarkLightLightColor(context)), maxLines: 3, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),

          const SizedBox(height: CustomSizes.SPACE_DEFAULT),

          SizedBox(
              width: getWidth(context),
              height: 180,
              child: DecoratedBox(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(thumbnailUri), fit: BoxFit.cover)))),

          const SizedBox(height: CustomSizes.SPACE_DEFAULT),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
            child: Column(
              spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
              children: [
                Row(
                  spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
                  children: [
                    Expanded(child: CustomElevatedButton(
                        onPressed: onGooglePlay,
                        height: CustomSizes.SPACE_DEFAULT * 1.4,
                        bgColor: darkDarkLightLightColor(context),
                        elevation: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                          children: [
                            Image.asset(CustomIcons.STORES_GOOGLE_PLAY, width: 20, height: 20),
                            Flexible(child: Text('Google Play', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 10, color: darkLightColor(context)))),
                          ],
                        )
                    )),
                    Expanded(child: CustomElevatedButton(
                        onPressed: onAppStore,
                        height: CustomSizes.SPACE_DEFAULT * 1.4,
                        bgColor: darkDarkLightLightColor(context),
                        elevation: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                          children: [
                            Image.asset(CustomIcons.STORES_APPLE, width: 20, height: 20),
                            Flexible(child: Text('App Store', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 10, color: darkLightColor(context)))),
                          ],
                        )
                    )),
                  ],
                ),
                CustomElevatedButton(
                        onPressed: onVideo,
                        height: CustomSizes.SPACE_DEFAULT * 1.4,
                        bgColor: darkDarkLightLightColor(context),
                        elevation: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                          children: [
                            Image.asset(CustomIcons.YOUTUBE, width: 20, height: 20),
                            Flexible(child: Text('App Demo', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 10, color: darkLightColor(context)))),
                          ],
                        )
                    ),
              ],
            ),
          ),

        ],
      )
  );

  Widget _customSkill({ required BuildContext context, required String imgUri, required String title, Color? color}) => Column(
    children: [
      Container(
        padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 1.4),
        decoration: BoxDecoration(
            color: darkLightColor(context),
            borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            border: Border.all(width: 0.6, color: darkDarkLightLightColor(context))
        ),
        child: Image.asset(imgUri, width: 26.0, height: 26.0, fit: BoxFit.cover, color: color),
      ),
      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
      Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context), fontSize: 10), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)
    ],
  );

  Widget _customContact({ required BuildContext context, required String imgUri, required GestureTapCallback onPressed, Color? color}) => InkWell(
    onTap: onPressed,
    overlayColor: const WidgetStatePropertyAll<Color?>(CustomColors.TRANSPARENT),
    child: Container(
      padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          border: Border.all(width: 0.6, color: darkDarkLightLightColor(context))
      ),
      child: Image.asset(imgUri, width: 18.0, height: 18.0, fit: BoxFit.cover, color: color,),
    ),
  );

  Widget _buildTimelineItem({
    required BuildContext context,
    required bool isLeft,
    required bool isFirst,
    required bool isLast,
    required String fromDate,
    required String toDate,
    required String title,
    required String subtitle,
    required String description,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 12,
        height: 12,
        indicator: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: darkDarkLightLightColor(context)
          ),
        ),
      ),
      beforeLineStyle: LineStyle(
        color: darkDarkLightLightColor(context),
        thickness: 0.5,
      ),
      afterLineStyle: LineStyle(
        color: darkDarkLightLightColor(context),
        thickness: 0.5,
      ),
      endChild: Padding(
        padding: const EdgeInsets.only(left: CustomSizes.SPACE_DEFAULT, bottom: CustomSizes.SPACE_DEFAULT),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: CustomSizes.SPACE_BETWEEN_ITEMS,
                      vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                    ),
                    decoration: BoxDecoration(
                      color: darkDarkLightLightColor(context),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(CustomSizes.SPACE_DEFAULT * 2),
                        bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT * 2)
                      ),
                    ),
                    child: Text(
                      '$fromDate – $toDate',
                      style: Theme.of(context).textTheme.bodyMedium
                    ),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  _buildExperienceCard(
                    context: context,
                    title: title,
                    isLeft: false,
                    subtitle: subtitle,
                    description: description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard({
    required BuildContext context,
    required String title,
    required bool isLeft,
    required String subtitle,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
      decoration: BoxDecoration(
        color: darkDarkLightLightColor(context),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(CustomSizes.SPACE_DEFAULT * 2),
          bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT * 2)
        ),
        border: Border.all(
          width: 0.6,
          color: grayColor(context),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 18,
              fontFamily: 'Manrope-Bold'
            ),
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontFamily: 'Manrope-Bold'
            ),
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          Text(
            description.replaceAll('\\n', '\n'),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 12,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
