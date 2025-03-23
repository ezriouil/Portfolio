import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/widgets/custom_elevated_button.dart';
import 'package:portfolio/common/widgets/custom_outlined_button.dart';
import 'package:portfolio/home/home_controller.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';
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
              SizedBox(
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
              const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),

              // SKILLS
              Container(
                  height: 60,
                  color: darkDarkLightLightColor(context),
                  child: ListView.builder(
                      controller: controller.skillsScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.skills.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                        child: Image.asset(controller.skills[index], width: 40, height: 40),
                      ))),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),

            ]
          ),
        ),
      )
    );
  }
}
