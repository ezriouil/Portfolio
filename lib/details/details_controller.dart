import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/models/project_entity.dart';
import 'package:portfolio/common/widgets/custom_snackbar.dart';
import 'package:portfolio/utils/constants/custom_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailsController extends GetxController{

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final ScrollController scrollController;
  late final RxBool isLoading, isFabVisible;
  late final Rx<ProjectEntity?> projectEntity;
  late final Rx<YoutubePlayerController?> youtubePlayerController;
  late final RxList<String> lightImages, darkImages;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    isLoading = true.obs;
    isFabVisible = false.obs;
    projectEntity = Rx(null);
    youtubePlayerController = Rx(null);
    lightImages = RxList.empty(growable: true);
    darkImages = RxList.empty(growable: true);
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  void init() async { _getProjectInfo(); _scrollController(); }

  // - - - - - - - - - - - - - - - - - - GET PROJECT INFO - - - - - - - - - - - - - - - - - -  //
  void _getProjectInfo() async {
    isLoading.value = true;
    final String projectId = Get.parameters['id'] ?? "";
    try{
      final DocumentSnapshot<Map<String, dynamic>> getProject = await FirebaseFirestore.instance.collection('PROJECTS').doc(projectId).get();
      if(!getProject.exists || getProject.data() == null) { isLoading.value = false; projectEntity.value = null; return; }
      projectEntity.value = ProjectEntity.fromJson(getProject.data()!);
      if(projectEntity.value!.lightImages != null && projectEntity.value!.lightImages!.isNotEmpty) lightImages.addAll(projectEntity.value!.lightImages!);
      if(projectEntity.value!.darkImages != null && projectEntity.value!.darkImages!.isNotEmpty) darkImages.addAll(projectEntity.value!.darkImages!);
      if(projectEntity.value!.videoLink != "") {
        youtubePlayerController.value = YoutubePlayerController.fromVideoId(
          videoId: projectEntity.value!.videoLink!,
          params: const YoutubePlayerParams(
            mute: true,
            showControls: true,
            showFullscreenButton: true,
          ),
        );
      }
    }
    catch(_){ projectEntity.value = null; }
    finally{ isLoading.value = false; }
  }

  // - - - - - - - - - - - - - - - - - - SCROLL UP - - - - - - - - - - - - - - - - - -  //
  // void scrollingUp(){ scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut); }

  // - - - - - - - - - - - - - - - - - - GOOGLE PLAY - - - - - - - - - - - - - - - - - -  //
  void onGooglePlay() async {
    if(projectEntity.value?.googlePlayLink == null || projectEntity.value?.googlePlayLink == ""){
      CustomSnackBar.error();
      return;
    }
    try{ await launchUrl(Uri.parse(projectEntity.value?.googlePlayLink ?? CustomConstants.GITHUB)); }
    catch(_){ CustomSnackBar.error(); }
  }

  // - - - - - - - - - - - - - - - - - - APPLE STORE - - - - - - - - - - - - - - - - - -  //
  void onAppleStore() async {
    if(projectEntity.value?.appStoreLink == null || projectEntity.value?.appStoreLink == ""){
      CustomSnackBar.error();
      return;
    }
    try{ await launchUrl(Uri.parse(projectEntity.value?.appStoreLink ?? CustomConstants.GITHUB)); }
    catch(_){ CustomSnackBar.error(); }
  }

  // - - - - - - - - - - - - - - - - - - Download APK - - - - - - - - - - - - - - - - - -  //
  void onDownloadAPK() async {
    try{ await launchUrl(Uri.parse(projectEntity.value?.apkLink ?? CustomConstants.GITHUB)); }
    catch(_){ CustomSnackBar.error(); }
  }

  // - - - - - - - - - - - - - - - - - - GITHUB - - - - - - - - - - - - - - - - - -  //
  void onGithub() async {
    try{ await launchUrl(Uri.parse(CustomConstants.GITHUB)); }
    catch(_){ CustomSnackBar.error(); }
  }

  // - - - - - - - - - - - - - - - - - - LINKEDIN - - - - - - - - - - - - - - - - - -  //
  void onLinkedin() {}

  // - - - - - - - - - - - - - - - - - - GMAIL - - - - - - - - - - - - - - - - - -  //
  void onGmail() {}

  // - - - - - - - - - - - - - - - - - - LISTEN TO SCROLL CONTROLLER - - - - - - - - - - - - - - - - - -  //
  void _scrollController() {
    scrollController.addListener(() {
      if (scrollController.offset > 200 && !isFabVisible.value) { isFabVisible.value = true; }
      else if (scrollController.offset <= 200 && isFabVisible.value) { isFabVisible.value = false; }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

}