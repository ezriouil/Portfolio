import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/constants/custom_icons.dart';

class HomeController extends GetxController{

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final ScrollController scrollController;
  late final ScrollController skillsFirstScrollController;
  late final ScrollController skillsLastScrollController;
  late final TextEditingController fullNameController, objectController, messageController;
  late final GlobalKey<FormState> formState;

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
    skillsFirstScrollController = ScrollController();
    skillsLastScrollController = ScrollController();
    fullNameController = TextEditingController();
    objectController = TextEditingController();
    messageController = TextEditingController();
    formState = GlobalKey<FormState>();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  void init() async {
    skills.shuffle();
    _autoScrolling();
  }

  // - - - - - - - - - - - - - - - - - - MENU CLICKS - - - - - - - - - - - - - - - - - -  //
  void onHome() {}
  void onSkills() {}
  void onWorks() {}
  void onAbout() {}
  void onLetsTalk() {}
  void onResume() {}

  // - - - - - - - - - - - - - - - - - - CONTACT BUTTON SEND - - - - - - - - - - - - - - - - - -  //
  void onSend() { if(!formState.currentState!.validate()) return; }

  // - - - - - - - - - - - - - - - - - - ADD AUTO SCROLLING TO LIST VIEW - - - - - - - - - - - - - - - - - -  //
  void _autoScrolling() async {
    await Future.delayed(const Duration(seconds: 3));
    skillsFirstScrollController.addListener(() { if (skillsFirstScrollController.position.pixels == skillsFirstScrollController.position.maxScrollExtent) skillsFirstScrollController.jumpTo(0); });
    skillsFirstScrollController.animateTo(
      skillsFirstScrollController.position.maxScrollExtent,
      curve: Curves.linear,
      duration: const Duration(seconds: 60),
    );
    skillsLastScrollController.addListener(() { if (skillsLastScrollController.position.pixels == skillsLastScrollController.position.maxScrollExtent) skillsLastScrollController.jumpTo(0); });
    skillsLastScrollController.animateTo(
      skillsLastScrollController.position.maxScrollExtent,
      curve: Curves.linear,
      duration: const Duration(seconds: 60),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    skillsFirstScrollController.dispose();
    super.dispose();
  }

}