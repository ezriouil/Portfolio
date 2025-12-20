import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/models/project_entity.dart';
import 'package:portfolio/common/models/experience_entity.dart';

class PanelController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final TextEditingController passwordController;
  late final RxBool isAuthenticated;
  late final RxBool isDarkTheme;
  late final RxString selectedFormType; // 'project' or 'experience'
  
  // Project form controllers
  late final TextEditingController projectTitleController;
  late final TextEditingController projectDescriptionController;
  late final TextEditingController projectLogoController;
  late final TextEditingController projectThumbnailController;
  late final TextEditingController projectGooglePlayController;
  late final TextEditingController projectAppStoreController;
  late final TextEditingController projectWebsiteUriController;
  late final TextEditingController projectVideoLinkController;
  late final RxString projectType;
  late final GlobalKey<FormState> projectFormState;
  
  // Experience form controllers
  late final TextEditingController experienceTitleController;
  late final TextEditingController experienceSubTitleController;
  late final TextEditingController experienceFromDateController;
  late final TextEditingController experienceToDateController;
  late final TextEditingController experienceDescriptionController;
  late final GlobalKey<FormState> experienceFormState;
  
  late final RxBool isSavingProject;
  late final RxBool isSavingExperience;
  
  static const String password = 'Ezil2003';

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    isAuthenticated = false.obs;
    isDarkTheme = false.obs;
    selectedFormType = 'project'.obs;
    
    // Always reset authentication when controller is initialized (when navigating to /panel)
    resetAuthentication();
    
    // Project controllers
    projectTitleController = TextEditingController();
    projectDescriptionController = TextEditingController();
    projectLogoController = TextEditingController();
    projectThumbnailController = TextEditingController();
    projectGooglePlayController = TextEditingController();
    projectAppStoreController = TextEditingController();
    projectWebsiteUriController = TextEditingController();
    projectVideoLinkController = TextEditingController();
    projectType = 'mobile'.obs;
    projectFormState = GlobalKey<FormState>();
    
    // Experience controllers
    experienceTitleController = TextEditingController();
    experienceSubTitleController = TextEditingController();
    experienceFromDateController = TextEditingController();
    experienceToDateController = TextEditingController();
    experienceDescriptionController = TextEditingController();
    experienceFormState = GlobalKey<FormState>();
    
    isSavingProject = false.obs;
    isSavingExperience = false.obs;
    
    // Check theme mode
    isDarkTheme.value = Get.theme.brightness == Brightness.dark;
  }

  // - - - - - - - - - - - - - - - - - - ON READY - - - - - - - - - - - - - - - - - -  //
  @override
  void onReady() {
    super.onReady();
    // Always reset authentication when screen is ready (when navigating to /panel)
    resetAuthentication();
  }

  // - - - - - - - - - - - - - - - - - - RESET AUTHENTICATION - - - - - - - - - - - - - - - - - -  //
  void resetAuthentication() {
    isAuthenticated.value = false;
    passwordController.clear();
  }

  // - - - - - - - - - - - - - - - - - - PASSWORD AUTHENTICATION - - - - - - - - - - - - - - - - - -  //
  void onPasswordSubmit() {
    final enteredPassword = passwordController.text.trim();
    if (enteredPassword == password) {
      isAuthenticated.value = true;
      passwordController.clear();
    } else {
      Get.snackbar(
        'Error',
        'Incorrect password. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
      passwordController.clear();
    }
  }

  // - - - - - - - - - - - - - - - - - - CHANGE THEME - - - - - - - - - - - - - - - - - -  //
  void onChangeColorTheming() {
    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.light : ThemeMode.dark);
    isDarkTheme.value = !isDarkTheme.value;
  }

  // - - - - - - - - - - - - - - - - - - SAVE PROJECT - - - - - - - - - - - - - - - - - -  //
  Future<void> onSaveProject() async {
    try {
      if (!projectFormState.currentState!.validate()) return;
      
      isSavingProject.value = true;
      
      final project = ProjectEntity(
        title: projectTitleController.text.trim(),
        description: projectDescriptionController.text.trim(),
        logo: projectLogoController.text.trim().isEmpty ? null : projectLogoController.text.trim(),
        thumbnail: projectThumbnailController.text.trim().isEmpty ? null : projectThumbnailController.text.trim(),
        googlePlayLink: projectGooglePlayController.text.trim().isEmpty ? null : projectGooglePlayController.text.trim(),
        appStoreLink: projectAppStoreController.text.trim().isEmpty ? null : projectAppStoreController.text.trim(),
        websiteUri: projectWebsiteUriController.text.trim().isEmpty ? null : projectWebsiteUriController.text.trim(),
        videoLink: projectVideoLinkController.text.trim().isEmpty ? null : projectVideoLinkController.text.trim(),
        type: projectType.value,
        createdAt: DateTime.now(),
      );
      
      await FirebaseFirestore.instance
          .collection('PROJECTS')
          .add(project.toJson());
      
      // Clear form
      projectTitleController.clear();
      projectDescriptionController.clear();
      projectLogoController.clear();
      projectThumbnailController.clear();
      projectGooglePlayController.clear();
      projectAppStoreController.clear();
      projectWebsiteUriController.clear();
      projectVideoLinkController.clear();
      projectType.value = 'mobile';
      projectFormState.currentState?.reset();
      
      Get.snackbar(
        'Success',
        'Project saved successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.primary,
        colorText: Get.theme.colorScheme.onPrimary,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save project: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
    } finally {
      isSavingProject.value = false;
    }
  }

  // - - - - - - - - - - - - - - - - - - SAVE EXPERIENCE - - - - - - - - - - - - - - - - - -  //
  Future<void> onSaveExperience() async {
    try {
      if (!experienceFormState.currentState!.validate()) return;
      
      isSavingExperience.value = true;
      
      final experience = ExperienceEntity(
        title: experienceTitleController.text.trim(),
        subTitle: experienceSubTitleController.text.trim(),
        fromDate: experienceFromDateController.text.trim(),
        toDate: experienceToDateController.text.trim(),
        description: experienceDescriptionController.text.trim(),
        createdAt: DateTime.now(),
      );
      
      await FirebaseFirestore.instance
          .collection('EXPERIENCES')
          .add(experience.toJson());
      
      // Clear form
      experienceTitleController.clear();
      experienceSubTitleController.clear();
      experienceFromDateController.clear();
      experienceToDateController.clear();
      experienceDescriptionController.clear();
      experienceFormState.currentState?.reset();
      
      Get.snackbar(
        'Success',
        'Experience saved successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.primary,
        colorText: Get.theme.colorScheme.onPrimary,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save experience: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
    } finally {
      isSavingExperience.value = false;
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    projectTitleController.dispose();
    projectDescriptionController.dispose();
    projectLogoController.dispose();
    projectThumbnailController.dispose();
    projectGooglePlayController.dispose();
    projectAppStoreController.dispose();
    projectWebsiteUriController.dispose();
    projectVideoLinkController.dispose();
    experienceTitleController.dispose();
    experienceSubTitleController.dispose();
    experienceFromDateController.dispose();
    experienceToDateController.dispose();
    experienceDescriptionController.dispose();
    super.dispose();
  }
}

