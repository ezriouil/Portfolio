import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/widgets/custom_dropdown.dart';
import 'package:portfolio/common/widgets/custom_elevated_button.dart';
import 'package:portfolio/common/widgets/custom_text_field.dart';
import 'package:portfolio/panel/panel_controller.dart';
import 'package:portfolio/utils/constants/custom_sizes.dart';
import 'package:portfolio/utils/state/custom_state.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class PanelWebScreen extends CustomState {
  const PanelWebScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // Get controller (should be initialized by binding)
    final PanelController controller = Get.find<PanelController>();
    
    return Obx(() => Scaffold(
      backgroundColor: grayColor(context),
      body: Stack(
        children: [
          // Password Dialog - Always shown until authenticated
          if (!controller.isAuthenticated.value)
            Container(
              color: grayColor(context).withValues(alpha: 0.95),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.symmetric(
                    horizontal: CustomSizes.SPACE_BETWEEN_ITEMS,
                    vertical: CustomSizes.SPACE_BETWEEN_SECTIONS,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                  decoration: BoxDecoration(
                    color: grayColor(context),
                    borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
                    border: Border.all(
                      width: 0.6,
                      color: darkDarkLightLightColor(context),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.wave(effectStrength: 0.6),
                        child: Icon(
                          Icons.lock_outline,
                          size: 64,
                          color: darkDarkLightLightColor(context),
                        ),
                      ),
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                      Text(
                        'Admin Access',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontFamily: 'Recoleta-Bold',
                              fontSize: 28,
                              color: darkDarkLightLightColor(context),
                            ),
                      ),
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      Text(
                        'Enter password to access the admin panel',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                              color: darkDarkLightLightColor(context),
                            ),
                      ),
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),
                      CustomTextField(
                        controller: controller.passwordController,
                        hint: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                      CustomElevatedButton(
                        onPressed: controller.onPasswordSubmit,
                        textColor: darkLightColor(context),
                        elevation: 0,
                        child: const Text('Enter'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          
          // Main Content - Only shown when authenticated
          if (controller.isAuthenticated.value)
            Center(
              child: SingleChildScrollView(
                child: Container(
                  width: _getPanelWidth(context),
                  padding: EdgeInsets.symmetric(
                    horizontal: _getPanelPadding(context),
                    vertical: CustomSizes.SPACE_BETWEEN_SECTIONS,
                  ),
                  child: Column(
                    children: [
                      // Dynamic Content based on selected type
                      Obx(() {
                        final formType = controller.selectedFormType.value;
                        return _buildSection(
                          context: context,
                          title: 'Admin Panel',
                          subtitle: 'Manage your portfolio content',
                          formTypeDropdown: _buildFormTypeDropdown(context, controller),
                          child: formType == 'project'
                              ? _buildProjectForm(context, controller)
                              : _buildExperienceForm(context, controller),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    ));
  }

  double _getPanelWidth(BuildContext context) {
    final width = getWidth(context);
    return width <= 650 ? width : width * 0.8;
  }

  double _getPanelPadding(BuildContext context) {
    return getWidth(context) <= 650 
        ? CustomSizes.SPACE_BETWEEN_ITEMS / 2 
        : CustomSizes.SPACE_DEFAULT;
  }

  Widget _buildFormTypeDropdown(BuildContext context, PanelController controller) {
    return CustomDropdown<String>(
      value: controller.selectedFormType.value,
      hint: 'Select form type',
      icon: Icons.category,
      items: const [
        DropdownMenuItem(
          value: 'project',
          child: Text('Insert New Project'),
        ),
        DropdownMenuItem(
          value: 'experience',
          child: Text('Insert New Experience'),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          controller.selectedFormType.value = value;
        }
      },
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Widget formTypeDropdown,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: CustomSizes.SPACE_BETWEEN_ITEMS,
        vertical: CustomSizes.SPACE_BETWEEN_SECTIONS,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title - Centered
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(
                  fontFamily: 'Recoleta-Bold',
                  fontSize: 40,
                  color: darkDarkLightLightColor(context),
                ),
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          // Subtitle - Centered
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(
                  fontSize: 16,
                  color: darkDarkLightLightColor(context),
                ),
          ),
          const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),
          // Form Type Dropdown
          formTypeDropdown,
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          // Form Content
          child,
        ],
      ),
    );
  }

  Widget _buildProjectForm(BuildContext context, PanelController controller) {
    return Form(
      key: controller.projectFormState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: controller.projectTitleController,
            hint: 'Project Title',
            icon: Icons.title,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 2) {
                return 'Title must not be empty';
              }
              return null;
            },
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          CustomTextField(
            controller: controller.projectDescriptionController,
            hint: 'Description',
            minLines: 3,
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 10) {
                return 'Description must not be empty';
              }
              return null;
            },
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          // Project Type Dropdown
          Obx(() => CustomDropdown<String>(
            value: controller.projectType.value,
            hint: 'Project Type',
            icon: Icons.phone_android,
            items: const [
              DropdownMenuItem(
                value: 'mobile',
                child: Text('Mobile'),
              ),
              DropdownMenuItem(
                value: 'web',
                child: Text('Web'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                controller.projectType.value = value;
              }
            },
          )),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          CustomTextField(
            controller: controller.projectLogoController,
            hint: 'Logo URL (optional)',
            icon: Icons.image,
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          CustomTextField(
            controller: controller.projectThumbnailController,
            hint: 'Thumbnail URL (optional)',
            icon: Icons.image_outlined,
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          Obx(() => controller.projectType.value == 'web'
              ? CustomTextField(
                  controller: controller.projectWebsiteUriController,
                  hint: 'Website URL (optional)',
                  icon: Icons.language,
                )
              : Column(
                  children: [
                    CustomTextField(
                      controller: controller.projectGooglePlayController,
                      hint: 'Google Play Link (optional)',
                      icon: Icons.android,
                    ),
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                    CustomTextField(
                      controller: controller.projectAppStoreController,
                      hint: 'App Store Link (optional)',
                      icon: Icons.apple,
                    ),
                  ],
                )),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          CustomTextField(
            controller: controller.projectVideoLinkController,
            hint: 'Video/Demo Link (optional)',
            icon: Icons.video_library,
          ),
          const SizedBox(height: CustomSizes.SPACE_DEFAULT),
          Obx(() => CustomElevatedButton(
            onPressed: controller.isSavingProject.value
                ? () {}
                : controller.onSaveProject,
            textColor: darkLightColor(context),
            elevation: 0,
            child: controller.isSavingProject.value
                ? SizedBox(
                    width: CustomSizes.SPACE_DEFAULT,
                    height: CustomSizes.SPACE_DEFAULT,
                    child: CircularProgressIndicator(
                      color: darkLightColor(context),
                      strokeWidth: 3,
                      backgroundColor: darkLightColor(context).withValues(alpha: 0.2),
                    ),
                  )
                : const Text('Save Project'),
          )),
        ],
      ),
    );
  }

  Widget _buildExperienceForm(BuildContext context, PanelController controller) {
    return Form(
      key: controller.experienceFormState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: controller.experienceTitleController,
            hint: 'Title',
            icon: Icons.work_outline,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 2) {
                return 'Title must not be empty';
              }
              return null;
            },
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          CustomTextField(
            controller: controller.experienceSubTitleController,
            hint: 'Subtitle (Company/Position)',
            icon: Icons.business,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 2) {
                return 'Subtitle must not be empty';
              }
              return null;
            },
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: controller.experienceFromDateController,
                  hint: 'From Date (Jan 2020)',
                  icon: Icons.calendar_today,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'From date is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
              Expanded(
                child: CustomTextField(
                  controller: controller.experienceToDateController,
                  hint: 'To Date (Dec 2023 or Present)',
                  icon: Icons.event,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'To date is required';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          CustomTextField(
            controller: controller.experienceDescriptionController,
            hint: 'Description',
            minLines: 5,
            maxLines: 8,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 10) {
                return 'Description must not be empty';
              }
              return null;
            },
          ),
          const SizedBox(height: CustomSizes.SPACE_DEFAULT),
          Obx(() => CustomElevatedButton(
            onPressed: controller.isSavingExperience.value
                ? () {}
                : controller.onSaveExperience,
            textColor: darkLightColor(context),
            elevation: 0,
            child: controller.isSavingExperience.value
                ? SizedBox(
                    width: CustomSizes.SPACE_DEFAULT,
                    height: CustomSizes.SPACE_DEFAULT,
                    child: CircularProgressIndicator(
                      color: darkLightColor(context),
                      strokeWidth: 3,
                      backgroundColor: darkLightColor(context).withValues(alpha: 0.2),
                    ),
                  )
                : const Text('Save Experience'),
          )),
        ],
      ),
    );
  }
}

