import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/models/project_entity.dart';
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
    print('=====');
    print(projectId);
    print('=====');
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
  void onGooglePlay() {}

  // - - - - - - - - - - - - - - - - - - APPLE STORE - - - - - - - - - - - - - - - - - -  //
  void onAppleStore() {}

  // - - - - - - - - - - - - - - - - - - Download APK - - - - - - - - - - - - - - - - - -  //
  void onDownloadAPK() {}

  // - - - - - - - - - - - - - - - - - - GITHUB - - - - - - - - - - - - - - - - - -  //
  void onGithub() {}

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
    super.dispose();
  }

}