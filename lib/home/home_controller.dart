import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/models/custom_project_entity.dart';
import 'package:portfolio/utils/constants/custom_icons.dart';

class HomeController extends GetxController{

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final ScrollController scrollController, skillsZeroScrollController, skillsFirstScrollController, skillsLastScrollController;
  late final TextEditingController fullNameController, objectController, messageController;
  late final RxBool isDarkTheme, isFabVisible;
  late final GlobalKey<FormState> formState;
  late final GlobalKey homeKey, skillsKey, projectsKey, contactKey;
  late final RxList<CustomProjectEntity> projects;

  final List<String> skills = [
    CustomIcons.DB_FIREBASE,
    CustomIcons.DB_MONGO_DB,
    CustomIcons.DB_SQL,
    CustomIcons.DB_SUPABASE,
    CustomIcons.DESIGN_FIGMA,
    CustomIcons.EDITORS_INTELLIJ_IDEA,
    CustomIcons.EDITORS_ANDROID_STUDIO,
    CustomIcons.EDITORS_SUBLIME,
    CustomIcons.EDITORS_VS_CODE,
    CustomIcons.MOBILE_DART,
    CustomIcons.MOBILE_FLUTTER,
    CustomIcons.MOBILE_JAVA,
    CustomIcons.MOBILE_KOTLIN,
    CustomIcons.MOBILE_SWIFT,
    CustomIcons.MOBILE_XML,
    CustomIcons.STORES_AMAZON,
    CustomIcons.STORES_APPLE,
    CustomIcons.STORES_GOOGLE_PLAY,
    CustomIcons.STORES_HUAWEI,
    CustomIcons.WEB_CSS,
    CustomIcons.WEB_EXPRESS_JS,
    CustomIcons.WEB_HTML,
    CustomIcons.WEB_JS,
    CustomIcons.WEB_NODE_JS,
    CustomIcons.WEB_PYTHON,
    CustomIcons.WEB_REACT_JS,
    CustomIcons.WEB_TAILWIND_CSS
  ];


  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    skillsZeroScrollController = ScrollController();
    skillsFirstScrollController = ScrollController();
    skillsLastScrollController = ScrollController();
    fullNameController = TextEditingController();
    objectController = TextEditingController();
    messageController = TextEditingController();
    isDarkTheme = false.obs;
    isFabVisible = false.obs;
    formState = GlobalKey<FormState>();
    homeKey = GlobalKey();
    skillsKey = GlobalKey();
    projectsKey = GlobalKey();
    contactKey = GlobalKey();
    projects = RxList.empty(growable: true);
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  void init() async {
    skills.shuffle();
    _autoScrolling();
    _getProjects();
  }

  // - - - - - - - - - - - - - - - - - - GET PROJECTS - - - - - - - - - - - - - - - - - -  //
  void _getProjects() async {
    try{
      final QuerySnapshot<Map<String, dynamic>> getAllProjects = await FirebaseFirestore.instance.collection('PROJECTS').get();
      if(getAllProjects.size <= 0) return;
      for(QueryDocumentSnapshot<Map<String, dynamic>> projectJson in getAllProjects.docs){
        final CustomProjectEntity customProjectEntity = CustomProjectEntity.fromJson(projectJson.data());
        projects.add(customProjectEntity);
      }

    }
    catch(_){}
  }

  // - - - - - - - - - - - - - - - - - - MENU CLICKS - - - - - - - - - - - - - - - - - -  //
  void onHome() {
    final context = homeKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
  void onSkills() {
    final context = skillsKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
  void onProjects() {
    final context = projectsKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
  void onContact() {
    final context = contactKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
  void onDownloadResume() {}

  // - - - - - - - - - - - - - - - - - - CONTACT BUTTON SEND - - - - - - - - - - - - - - - - - -  //
  void onSend() { if(!formState.currentState!.validate()) return; }

  // - - - - - - - - - - - - - - - - - - ADD AUTO SCROLLING TO LIST VIEW - - - - - - - - - - - - - - - - - -  //
  void _autoScrolling() async {

    await Future.delayed(const Duration(seconds: 3));

    skillsZeroScrollController.addListener(() { if (skillsZeroScrollController.position.pixels == skillsZeroScrollController.position.maxScrollExtent) skillsZeroScrollController.jumpTo(0); });
    skillsZeroScrollController.animateTo(
      skillsFirstScrollController.position.maxScrollExtent,
      curve: Curves.linear,
      duration: const Duration(seconds: 40),
    );

    skillsFirstScrollController.addListener(() { if (skillsFirstScrollController.position.pixels == skillsFirstScrollController.position.maxScrollExtent) skillsFirstScrollController.jumpTo(0); });
    skillsFirstScrollController.animateTo(
      skillsFirstScrollController.position.maxScrollExtent,
      curve: Curves.linear,
      duration: const Duration(seconds: 40),
    );

    skillsLastScrollController.addListener(() { if (skillsLastScrollController.position.pixels == skillsLastScrollController.position.maxScrollExtent) skillsLastScrollController.jumpTo(0); });
    skillsLastScrollController.animateTo(
      skillsLastScrollController.position.maxScrollExtent,
      curve: Curves.linear,
      duration: const Duration(seconds: 40),
    );

    scrollController.addListener(() {
      if (scrollController.offset > 200 && !isFabVisible.value) { isFabVisible.value = true; }
      else if (scrollController.offset <= 200 && isFabVisible.value) { isFabVisible.value = false; }
    });

  }

  // - - - - - - - - - - - - - - - - - - SCROLL UP - - - - - - - - - - - - - - - - - -  //
  void scrollingUp(){ scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut); }

  // - - - - - - - - - - - - - - - - - - CHANGE COLOR THEME - - - - - - - - - - - - - - - - - -  //
  void onChangeColorTheming() {
    try{
      Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
      isDarkTheme.value = !isDarkTheme.value;
    }
    catch(_){}
  }

  @override
  void dispose() {
    scrollController.dispose();
    skillsFirstScrollController.dispose();
    super.dispose();
  }

}