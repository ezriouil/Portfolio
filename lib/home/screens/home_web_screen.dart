import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:portfolio/common/widgets/custom_elevated_button.dart';
import 'package:portfolio/home/home_controller.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';
import 'package:portfolio/utils/constants/custom_icons.dart';
import 'package:portfolio/utils/constants/custom_images.dart';
import 'package:portfolio/utils/constants/custom_sizes.dart';
import 'package:portfolio/utils/state/custom_state.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class HomeWebScreen extends CustomState {
  const HomeWebScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: grayColor(context).withValues(alpha: 0.9),
      body: SingleChildScrollView(
        child: SizedBox(
          width: getWidth(context),
          child: Column(
            children: [

              // TOP MENU
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              Container(
                padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 6 /*1.5*/),
                decoration: BoxDecoration(
                    color: grayColor(context),
                    borderRadius: BorderRadius.circular(24),
                  border: Border.all(width: 0.5, color: darkDarkLightLightColor(context))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: CustomSizes.SPACE_DEFAULT * 2),
                    InkWell(
                        onTap: controller.onHome,
                        overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                        child: Text('Home', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context)))),
                    const SizedBox(width: CustomSizes.SPACE_DEFAULT * 2),
                    InkWell(
                        onTap: controller.onSkills,
                        overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                        child: Text('Skills', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context)))),
                    const SizedBox(width: CustomSizes.SPACE_DEFAULT * 2),
                    InkWell(
                        onTap: controller.onWorks,
                        overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                        child: Text('Works', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context)))),
                    const SizedBox(width: CustomSizes.SPACE_DEFAULT * 2),
                    InkWell(
                        onTap: controller.onAbout,
                        overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                        child: Text('About', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkDarkLightLightColor(context)))),
                    const SizedBox(width: CustomSizes.SPACE_DEFAULT * 2),
                    InkWell(
                      onTap: controller.onLetsTalk,
                      overlayColor: const WidgetStatePropertyAll(CustomColors.TRANSPARENT),
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.swing(effectStrength: 10),
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 1.5, horizontal: CustomSizes.SPACE_DEFAULT),
                            margin: const EdgeInsets.only(right: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                            decoration: BoxDecoration(
                                color: darkLightColor(context),
                                borderRadius: BorderRadius.circular(24)
                            ),
                            child: Row(
                              children: [
                                Text("Let's Talk", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkDarkLightLightColor(context), fontSize: 10)),
                                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                Icon(Icons.waving_hand, color: darkDarkLightLightColor(context), size: 15),
                              ],
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),

              // HOME
              /*SizedBox(
                width: 300,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
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
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AvatarGlow(
                            glowCount: 5,
                            glowColor: darkDarkLightLightColor(context).withValues(alpha: 0.1),
                            glowRadiusFactor: 0.2,
                            child: Icon(
                                Icons.add_circle,
                                size: 15,
                                color: darkDarkLightLightColor(context)
                            ),
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
                      fontSize: 50,
                      color: darkDarkLightLightColor(context)
                  )
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context)),
                  text: "I’m",
                  children: <TextSpan>[
                    TextSpan(
                        text: '  Mobile  ',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: darkLightColor(context), fontFamily: 'Recoleta-Bold', fontSize: 20)
                    ),
                    TextSpan(
                        text: "&",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context))
                    ),
                    TextSpan(
                        text: "  Web developer",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: darkLightColor(context), fontFamily: 'Recoleta-Bold', fontSize: 20)
                    ),
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
                  WidgetAnimator(
                    atRestEffect: WidgetRestingEffects.swing(effectStrength: 10),
                    child: CustomElevatedButton(
                      width: 180,
                        elevation: 0,
                        onPressed: controller.onLetsTalk,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Let's Talk", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: grayColor(context))),
                            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Icon(Icons.waving_hand, color: grayColor(context)),
                          ],
                        )
                    ),
                  ),
                  const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                  CustomOutlinedButton(
                      width: 180,
                      elevation: 0,
                      onPressed: controller.onResume,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Resume", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkDarkLightLightColor(context))),
                          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          WidgetAnimator(
                              atRestEffect: WidgetRestingEffects.wave(effectStrength: 0.6),
                              child: Icon(Icons.downloading, color: darkDarkLightLightColor(context))
                          ),
                        ],
                      )
                  ),
                ],
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),*/

              // SKILLS
              /*Container(
                  height: 50,
                  color: darkDarkLightLightColor(context),
                  child: ListView.builder(
                      controller: controller.skillsFirstScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.skills.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                        child: Image.asset(controller.skills[index], width: 30, height: 30),
                      ))),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 4),*/

              // MOBILE + STORES
              /*
              Text("Skills", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 50, color: darkDarkLightLightColor(context))),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text("Technologies i'm working with", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Medium', fontSize: 24, color: darkDarkLightLightColor(context))),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT * 3),
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
                        Text('Mobile', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
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
                        Text('Stores', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
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
                        Text('Web', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
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
                        Text('Database', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
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
                        Text('Design', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                        Divider(color: darkDarkLightLightColor(context), thickness: 0.5, indent: CustomSizes.SPACE_DEFAULT, endIndent: CustomSizes.SPACE_DEFAULT),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                          child:  _customSkill(context: context, imgUri: CustomIcons.DESIGN_FIGMA, title: "FIGMA"),
                        ),
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 4),*/

              // SKILLS
              /*Container(
                  height: 50,
                  color: darkDarkLightLightColor(context),
                  child: ListView.builder(
                      controller: controller.skillsLastScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.skills.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                        child: Image.asset(controller.skills[index], width: 30, height: 30),
                      ))),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),*/

              // PROJECTS
              SizedBox(
                width: getWidth(context) * 0.6,
                height: 550,
                child: CardSwiper(
                  cardsCount: 3,
                  numberOfCardsDisplayed: 3,
                  cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
                          _customProject(
                              context: context,
                              logoUri: "https://i.ytimg.com/an_webp/CbY0rSfUPYg/mqdefault_6s.webp?du=3000&sqp=CKiFnr8G&rs=AOn4CLDqARhPfRBcVHfKk_nfY3-R4hA5tg",
                              title: "https",
                              description: "https://i.ytimg.com/an_webp/CbY0rSfUPYg/mqdefault_6s.webp?du=3000&sqp=CKiFnr8G&rs=AOn4CLDqARhPfRBcVHfKk_nfY3-R4hA5tg",
                              thumbnailUri: "",
                              onInstallApk: (){},
                              onDetails: (){},
                              onGithub: (){}
                          ),
                ),
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              // ABOUT ME
              /*
              Text("About Me", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 50, color: darkDarkLightLightColor(context))),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),
              SizedBox(
                width: 650,
                height: 220,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
                        child: Image.asset(CustomImages.MOHAMED_EZRIOUIL,
                          width: getWidth(context),
                          height: getHeight(context),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: CustomSizes.SPACE_DEFAULT),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Know who am I", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: 'Recoleta-Medium', color: darkDarkLightLightColor(context))),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                          Text("Mohamed Ezriouil, ${DateTime.now().year - 2003} years old, is a mobile and web developer with a bachelor’s degree and ${DateTime.now().year - 2022} years of development experience. Passionate about building innovative applications, he specializes in creating efficient and high-performance solutions.",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: darkDarkLightLightColor(context))
                          ),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                          Row(
                            children: [
                              _customContact(context: context, imgUri: CustomIcons.CONTACT_GMAIL, onPressed: (){}),
                              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              // _customContact(context: context, imgUri: CustomIcons.CONTACT_WHATSAPP, onPressed: (){}),
                              // const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              _customContact(context: context, imgUri: CustomIcons.CONTACT_LINKEDIN, onPressed: (){}),
                              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              _customContact(context: context, imgUri: CustomIcons.CONTACT_GITHUB, color: darkDarkLightLightColor(context), onPressed: (){}),
                            ]
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT * 3),*/

              // CONTACT ME
              /*SizedBox(
                width: 600,
                child: Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      Text("Contact Me", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', fontSize: 50, color: darkDarkLightLightColor(context))),
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                      Text("Let's talk on something great together", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: 'Recoleta-Medium', color: darkDarkLightLightColor(context))),
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                      CustomTextField(
                          controller: controller.fullNameController,
                          hint: "Full Name",
                          icon: Iconsax.user,
                          validator: (value){
                            if (value == null || value.isEmpty || value.length < 2) { return "Field must not be empty"; }
                            return null;
                          }),
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                      CustomTextField(
                          controller: controller.objectController,
                          hint: "Object",
                          icon: Iconsax.message,
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
         const              const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_SECTIONS * 3),
                        child: CustomElevatedButton(onPressed: controller.onSend, bgColor: darkLightColor(context), child: const Text("Send")),
                      )
                    ],
                  ),
                ),
              )*/

              // FOOTER
              /*Container(
                color: darkLightColor(context),
                padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_DEFAULT),
                child: Column(
                  children: [
                    Text("Designed and built by Mohamed Ezriouil with love and coffee", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: darkDarkLightLightColor(context))),
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _customContact(context: context, imgUri: CustomIcons.CONTACT_LINKEDIN, onPressed: (){}),
                          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          _customContact(context: context, imgUri: CustomIcons.CONTACT_GMAIL, onPressed: (){}),
                          //_customContact(context: context, imgUri: CustomIcons.CONTACT_WHATSAPP, onPressed: (){}),
                          //const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          _customContact(context: context, imgUri: CustomIcons.CONTACT_GITHUB, color: darkDarkLightLightColor(context), onPressed: (){}),
                        ]
                    )
                  ],
                ),
              )*/

            ]
          ),
        ),
      )
    );
  }

  Widget _customProject({ required BuildContext context, required String logoUri, required String title, required String description, required String thumbnailUri, required GestureTapCallback onInstallApk, required GestureTapCallback onDetails, required GestureTapCallback onGithub }) => Container(
    width: getWidth(context) * 0.6,
    padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_ITEMS),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        color: grayColor(context),
        border: Border.all(color: darkDarkLightLightColor(context))
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_SECTIONS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
            children: [
              Row(
                spacing: CustomSizes.SPACE_BETWEEN_ITEMS,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      child: Image.network(CustomImages.REAL_MOROCCO_LOGO, height: 32, width: 32)),
                  Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Recoleta-Bold', color: darkDarkLightLightColor(context))),
                ],
              ),
              Text(description, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 12, color: darkDarkLightLightColor(context)), maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),

        const SizedBox(height: CustomSizes.SPACE_DEFAULT),

        SizedBox(
          width: getWidth(context) * 0.6,
          height: 300,
          child: DecoratedBox(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(thumbnailUri), fit: BoxFit.cover)))),

        const SizedBox(height: CustomSizes.SPACE_DEFAULT),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_SECTIONS),
          child: Row(
            spacing: CustomSizes.SPACE_DEFAULT,
            children: [
              Expanded(child: CustomElevatedButton(
                  onPressed: onInstallApk,
                  height: CustomSizes.SPACE_DEFAULT * 1.5,
                  bgColor: darkDarkLightLightColor(context),
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
                  bgColor: darkDarkLightLightColor(context),
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                    children: [
                      Icon(Iconsax.more_2, color: darkLightColor(context),),
                      Text('More Details', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: darkLightColor(context))),
                    ],
                  )
              )),
              Expanded(child: CustomElevatedButton(
                  onPressed: onGithub,
                  height: CustomSizes.SPACE_DEFAULT * 1.5,
                  bgColor: darkDarkLightLightColor(context),
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
    ),
  );

  Widget _customSkill({ required BuildContext context, required String imgUri, required String title, Color? color}) => Column(
    children: [
      Container(
        padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
        decoration: BoxDecoration(
            color: darkLightColor(context),
            borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
            border: Border.all(color: darkDarkLightLightColor(context))
        ),
        child: Image.asset(imgUri, width: 28.0, height: 28.0, fit: BoxFit.cover, color: color),
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
          color: darkLightColor(context),
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          border: Border.all(color: darkDarkLightLightColor(context))
      ),
      child: Image.asset(imgUri, width: 18.0, height: 18.0, fit: BoxFit.cover, color: color,),
    ),
  );
}
