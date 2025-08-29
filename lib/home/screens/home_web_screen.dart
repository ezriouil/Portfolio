import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'package:portfolio/common/screens/custom_loading_screen.dart';
import 'package:portfolio/common/widgets/custom_elevated_button.dart';
import 'package:portfolio/common/widgets/custom_snackbar.dart';
import 'package:portfolio/common/widgets/custom_text_field.dart';
import 'package:portfolio/home/home_controller.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';
import 'package:portfolio/utils/constants/custom_constants.dart';
import 'package:portfolio/utils/constants/custom_icons.dart';
import 'package:portfolio/utils/constants/custom_sizes.dart';
import 'package:portfolio/utils/state/custom_state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../common/widgets/custom_outlined_button.dart';
import '../../utils/constants/custom_images.dart';

class HomeWebScreen extends CustomState {
  const HomeWebScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Obx(() => Scaffold(
      backgroundColor: grayColor(context).withValues(alpha: context.isDarkMode ? 0.6 : 0.9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT * 2, vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 1.5),
          decoration: BoxDecoration(
            color: grayColor(context),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(width: 0.5, color: darkDarkLightLightColor(context)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: controller.onHome,
                overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                child: Text('Home', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context))),
              ),
              const SizedBox(width: CustomSizes.SPACE_DEFAULT * 2),
              InkWell(
                onTap: controller.onProjects,
                overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                child: Text('Works', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context))),
              ),
              const SizedBox(width: CustomSizes.SPACE_DEFAULT * 2),
              InkWell(
                onTap: controller.onSkills,
                overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                child: Text('Skills', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context))),
              ),
              const SizedBox(width: CustomSizes.SPACE_DEFAULT * 2),
              InkWell(
                onTap: controller.onContact,
                overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                child: Text('Contact', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context))),
              ),
            ],
          ),
        ),
        actions: [
          WidgetAnimator(
              child: InkWell(
                  onTap: controller.onChangeColorTheming,
                  child: Obx(() => controller.isDarkTheme.value
                      ? const Icon(Icons.dark_mode_outlined, color: CustomColors.BLACK)
                      : WidgetAnimator(atRestEffect: WidgetRestingEffects.rotate(), child: const Icon(Icons.light_mode_outlined, color: CustomColors.WHITE)))
              )
          ),
          const SizedBox(width: CustomSizes.SPACE_DEFAULT)
        ],
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: SizedBox(
          width: getWidth(context),
          child: Column(
            children: [

              Column(
                key: controller.homeKey,
                children: [
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),
                  SizedBox(
                    width: 300,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: grayColor(context),
                              borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS * 3),
                              border: Border.all(color: darkDarkLightLightColor(context))
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS * 3),
                            child: SizedBox(
                                width: 150,
                                height: 150,
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
                              width: 220,
                              padding: const EdgeInsets.symmetric(
                                vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                                horizontal: CustomSizes.SPACE_BETWEEN_ITEMS,
                              ),
                              decoration: BoxDecoration(
                                  color: grayColor(context),
                                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                                  border: Border.all(color: darkDarkLightLightColor(context), width: 0.2)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AvatarGlow(
                                    glowCount: 5,
                                    glowColor: (controller.isDarkTheme.value ? CustomColors.GRAY_DARK : CustomColors.GRAY_LIGHT).withValues(alpha: 0.1),
                                    glowRadiusFactor: 0.2,
                                    child: Icon(Icons.add_circle, size: 15, color: controller.isDarkTheme.value ? CustomColors.GRAY_DARK : CustomColors.GRAY_LIGHT),
                                  ),
                                  const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 1.5),
                                  Text("Available For Opportunities", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context))),
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
                          fontSize: 18,
                          letterSpacing: 1,
                          color: darkDarkLightLightColor(context)
                      )
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context)),
                      text: "I’m",
                      children: <TextSpan>[
                        TextSpan(
                            text: '   MOBILE   ',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', fontSize: 24)
                        ),
                        TextSpan(
                            text: "&",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context))
                        ),
                        TextSpan(
                            text: "   WEB   ",
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', fontSize: 24)
                        ),
                        TextSpan(
                            text: "Developer",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context))),
                        TextSpan(
                            text: "\nSpecializing in building digital applications focused on user experience.",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context))
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomElevatedButton(
                          width: 180,
                          elevation: 0,
                          textColor: CustomColors.WHITE,
                          onPressed: controller.onContact,
                          child: Text("Let's Talk", style: Theme.of(context).textTheme.titleLarge)
                      ),
                      const SizedBox(width: CustomSizes.SPACE_DEFAULT),
                      CustomOutlinedButton(
                          width: 180,
                          elevation: 0,
                          onPressed: controller.onDownloadResume,
                          color: controller.isDarkTheme.value ? CustomColors.GRAY_DARK : CustomColors.GRAY_LIGHT,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Resume", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkDarkLightLightColor(context))),
                              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              WidgetAnimator(
                                  atRestEffect: WidgetRestingEffects.wave(effectStrength: 0.6),
                                  child: Obx(() => Icon(Icons.downloading, color: controller.isDarkTheme.value ? CustomColors.BLACK : CustomColors.WHITE))
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 3),
                ],
              ),

              // SKILLS
              Container(
                  height: 50,
                  color: grayColor(context),
                  child: ListView.builder(
                      controller: controller.skillsZeroScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.skills.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                        child: Image.asset(controller.skills[index], width: 28, height: 28),
                      ))),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 3),

              // PROJECTS
              Column(
                key: controller.projectsKey,
                children: [
                  Text("Projects", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 40, color: darkDarkLightLightColor(context))),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                  Row(
                    spacing: CustomSizes.SPACE_DEFAULT * 2,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () { controller.cardSwiperController.swipe(CardSwiperDirection.left); },
                          overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                          child: Container(
                              padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT * 2),
                                  border: Border.all(color: darkDarkLightLightColor(context))),
                              child: WidgetAnimator(atRestEffect: WidgetRestingEffects.dangle(), child: Obx(() => Icon(Icons.keyboard_double_arrow_left, size: 20, color: controller.isDarkTheme.value ? CustomColors.BLACK : CustomColors.WHITE)))
                          )
                      ),
                      Text("Some projects i have worked", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Medium', fontSize: 18, color: darkDarkLightLightColor(context))),
                      InkWell(
                          onTap: () { controller.cardSwiperController.swipe(CardSwiperDirection.right); },
                          overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                          child: Container(
                              padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT * 2),
                                  border: Border.all(color: darkDarkLightLightColor(context))),
                              child: WidgetAnimator(atRestEffect: WidgetRestingEffects.dangle(), child: Obx(() => Icon(Icons.keyboard_double_arrow_right, size: 20, color: controller.isDarkTheme.value ? CustomColors.BLACK : CustomColors.WHITE)))
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                  SizedBox(
                    width: 800,
                    height: 550,
                    child: controller.projects.isEmpty
                        ? const CustomLoadingScreen()
                        : CardSwiper(
                      cardsCount: controller.projects.length <= 3 ? controller.projects.length : 3,
                      numberOfCardsDisplayed: controller.projects.length <= 3 ? controller.projects.length : 3,
                      cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
                          _customProject(
                            context: context,
                            logoUri: controller.projects[index].logo ?? "",
                            title: controller.projects[index].title ?? "",
                            description: controller.projects[index].description ?? "",
                            thumbnailUri: controller.projects[index].thumbnail ?? "",
                            onInstallApk: () async {
                              try{ await launchUrl(Uri.parse(controller.projects[index].apkLink ?? CustomConstants.GITHUB)); }
                              catch(_){ CustomSnackBar.error(); }
                            },
                            onDetails: () { Get.toNamed('/details/${controller.projects[index].id}'); },
                            onGithub: () async {
                              try{ await launchUrl(Uri.parse(controller.projects[index].codeSourceLink ?? CustomConstants.GITHUB)); }
                              catch(_){ CustomSnackBar.error(); }
                            },
                          ),
                    ),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT * 4),
                ],
              ),

              // SKILLS
              Container(
                  height: 50,
                  color: grayColor(context),
                  child: ListView.builder(
                      controller: controller.skillsFirstScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.skills.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                        child: Image.asset(controller.skills[index], width: 28, height: 28),
                      )
                  )
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 3),

              Column(
                key: controller.skillsKey,
                children: [
                  // MOBILE + STORES
                  Text("Skills", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 40, color: darkDarkLightLightColor(context))),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  Text("Technologies I'm working with", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Medium', fontSize: 20, color: darkDarkLightLightColor(context))),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                            color: grayColor(context),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              bottomLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                              bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
                            ),
                            border: Border.all(color: darkDarkLightLightColor(context))
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Text('Mobile', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, letterSpacing: 1, fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
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
                      const SizedBox(width: CustomSizes.SPACE_DEFAULT),
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                            color: grayColor(context),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              bottomLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                              bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
                            ),
                            border: Border.all(color: darkDarkLightLightColor(context))
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Text('Stores', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, letterSpacing: 1, fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
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
                    ],
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  // WEB + DB
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                            color: grayColor(context),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              bottomLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                              bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
                            ),
                            border: Border.all(color: darkDarkLightLightColor(context))
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Text('Web', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, letterSpacing: 1, fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
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
                      const SizedBox(width: CustomSizes.SPACE_DEFAULT),
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                            color: grayColor(context),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              bottomLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                              bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
                            ),
                            border: Border.all(color: darkDarkLightLightColor(context))
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Text('Database', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, letterSpacing: 1, fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
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
                      )
                    ],
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  // EDITORS + DESIGN
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                            color: grayColor(context),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              bottomLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                              bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
                            ),
                            border: Border.all(color: darkDarkLightLightColor(context))
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Text('Editors', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, letterSpacing: 1, fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
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
                      const SizedBox(width: CustomSizes.SPACE_DEFAULT),
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                            color: grayColor(context),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              bottomLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                              bottomRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
                            ),
                            border: Border.all(color: darkDarkLightLightColor(context))
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Text('Design', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, letterSpacing: 1, fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                            Divider(color: darkDarkLightLightColor(context), thickness: 0.5, indent: CustomSizes.SPACE_DEFAULT, endIndent: CustomSizes.SPACE_DEFAULT),
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
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
                    ],
                  ),
                ]
              ),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 3),

              // SKILLS
              Container(
                  height: 50,
                  color: grayColor(context),
                  child: ListView.builder(
                      controller: controller.skillsLastScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.skills.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                        child: Image.asset(controller.skills[index], width: 28, height: 28),
                      )
                  )
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 3),

              // CONTACT ME
              SizedBox(
                width: getWidth(context) * 0.5,
                child: Form(
                  key: controller.formState,
                  child: Column(
                    key: controller.contactKey,
                    children: [
                      Text("Contact Me", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 40, color: darkDarkLightLightColor(context))),
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      Text("Let's talk on something great together", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Medium', fontSize: 20, color: darkDarkLightLightColor(context))),
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
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

              // FOOTER
              Container(
                color: grayColor(context),
                padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_DEFAULT * 2),
                child: Column(
                  children: [
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkDarkLightLightColor(context)),
                        text: "Designed and built by",
                        children: <TextSpan>[
                          TextSpan(
                              text: '  Mohamed Ezriouil  ',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: darkDarkLightLightColor(context), fontFamily: 'Recoleta-Bold', fontSize: 16)
                          ),
                          TextSpan(
                              text: "with love and coffee",
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
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: controller.isFabVisible.value ? Transform.scale(
        scale: 0.8,
        child: FloatingActionButton(
            heroTag: "1",
            onPressed: () { controller.scrollingUp(); },
            backgroundColor: CustomColors.WHITE,
            foregroundColor: CustomColors.BLACK,
            child: WidgetAnimator(
              atRestEffect: WidgetRestingEffects.wave(effectStrength: 0.6),
              child: const Icon(Icons.keyboard_double_arrow_up, color: CustomColors.BLACK),
            )
        ),
      ) : null
    ));
  }

  Widget _customProject(
      {required BuildContext context, required String logoUri, required String title, 
        required String description, required String thumbnailUri,
        required GestureTapCallback onInstallApk, required GestureTapCallback onDetails, required GestureTapCallback onGithub
      }) => Container(
      width: getWidth(context),
      padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        color: grayColor(context),
        border: Border.all(color: context.isDarkMode ? CustomColors.GRAY_DARK : CustomColors.GRAY_LIGHT)
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
                      child: Image.network(logoUri, height: 36, width: 36)),
                  Text(title, style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 18, letterSpacing: 0.5, color: darkDarkLightLightColor(context))),
                ],
              ),
              Text(description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12, color: darkDarkLightLightColor(context)), maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),

        const SizedBox(height: CustomSizes.SPACE_DEFAULT),

        SizedBox(
            width: 800,
            height: 300,
            child: DecoratedBox(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(thumbnailUri), fit: BoxFit.cover)))),

        const SizedBox(height: CustomSizes.SPACE_DEFAULT),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT),
          child: Row(
            spacing: CustomSizes.SPACE_DEFAULT,
            children: [
              Expanded(child: CustomElevatedButton(
                  onPressed: onInstallApk,
                  height: CustomSizes.SPACE_DEFAULT * 1.5,
                  bgColor: context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE,
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                    children: [
                      Icon(Icons.arrow_circle_down, color: darkLightColor(context),),
                      Text('Install APK', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkLightColor(context))),
                    ],
                  )
              )),
              Expanded(child: CustomElevatedButton(
                  onPressed: onDetails,
                  height: CustomSizes.SPACE_DEFAULT * 1.5,
                  bgColor: context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE,
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                    children: [
                      Icon(Icons.more_horiz, color: darkLightColor(context),),
                      Text('More Details', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkLightColor(context))),
                    ],
                  )
              )),
              Expanded(child: CustomElevatedButton(
                  onPressed: onGithub,
                  height: CustomSizes.SPACE_DEFAULT * 1.5,
                  bgColor: context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE,
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                    children: [
                      Image.asset(CustomIcons.CONTACT_GITHUB, color: darkLightColor(context), width: 24, height: 24),
                      Text('Code Source', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkLightColor(context))),
                    ],
                  )
              )),
            ],
          ),
        ),

      ],
    )
  );

  Widget _customSkill({ required BuildContext context, required String imgUri, required String title, Color? color}) => Column(
    children: [
      Container(
        padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 1.5),
        decoration: BoxDecoration(
            color: darkLightColor(context),
            borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
            border: Border.all(color: darkDarkLightLightColor(context))
        ),
        child: Image.asset(imgUri, width: 24.0, height: 24.0, fit: BoxFit.cover, color: color),
      ),
      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
      Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context), fontSize: 9, letterSpacing: 0.8), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)
    ],
  );

  Widget _customContact({ required BuildContext context, required String imgUri, required GestureTapCallback onPressed, Color? color}) => InkWell(
    onTap: onPressed,
    overlayColor: const WidgetStatePropertyAll<Color?>(CustomColors.TRANSPARENT),
    child: Container(
      padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
      decoration: BoxDecoration(
          color: darkLightColor(context),
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          border: Border.all(color: darkDarkLightLightColor(context))
      ),
      child: Image.asset(imgUri, width: 18.0, height: 18.0, fit: BoxFit.cover, color: color,),
    ),
  );

}