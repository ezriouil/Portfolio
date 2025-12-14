import 'dart:convert';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/common/models/project_entity.dart';
import 'package:portfolio/common/widgets/custom_snackbar.dart';
import 'package:portfolio/utils/constants/custom_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants/custom_constants.dart';

class HomeController extends GetxController{

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final ScrollController scrollController, skillsZeroScrollController, skillsFirstScrollController, skillsSecondScrollController, skillsLastScrollController;
  late final CardSwiperController cardSwiperController;
  late final TextEditingController fullNameController, objectController, messageController;
  late final RxBool isDarkTheme, isFabVisible, isSending;
  late final GlobalKey<FormState> formState;
  late final GlobalKey homeKey, skillsKey, projectsKey, experiencesKey, contactKey;
  late final RxList<ProjectEntity> projects;

  final List<String> skills = [
    CustomIcons.DB_FIREBASE,
    CustomIcons.DB_MONGO_DB,
    CustomIcons.DB_SQL,
    CustomIcons.DB_SUPABASE,
    CustomIcons.DESIGN_FIGMA,
    CustomIcons.DESIGN_CANVA,
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
    skillsSecondScrollController = ScrollController();
    skillsLastScrollController = ScrollController();
    cardSwiperController = CardSwiperController();
    fullNameController = TextEditingController();
    objectController = TextEditingController();
    messageController = TextEditingController();
    isDarkTheme = false.obs;
    isFabVisible = false.obs;
    isSending = false.obs;
    formState = GlobalKey<FormState>();
    homeKey = GlobalKey();
    skillsKey = GlobalKey();
    projectsKey = GlobalKey();
    experiencesKey = GlobalKey();
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
        final ProjectEntity customProjectEntity = ProjectEntity.fromJson(projectJson.data());
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
  void onExperiences() {
    final context = experiencesKey.currentContext;
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
  void onDownloadResume() {
    try{
      const pdfUrl = "https://drive.google.com/file/d/1j5N2ef1JqwiV4r2nmWYziK0_ofuXzN3f/view?usp=sharing";
      html.window.open(pdfUrl, "_blank");
    }
    catch(_){ CustomSnackBar.error(); }
  }

  // - - - - - - - - - - - - - - - - - - CONTACT BUTTON SEND - - - - - - - - - - - - - - - - - -  //
  void onSend() async {
    try {

      if (!formState.currentState!.validate()) return;
      isSending.value = true;

      const email = 'Ezriouil.dev@gmail.com';

      final fullName = fullNameController.text.trim();
      final subject = objectController.text.trim();
      final message = messageController.text.trim();

      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "service_id": "service_8zujzq9",
          "template_id": "template_uo7rpui",
          "user_id": "Irf3D8ppyEMw-utpO",
          "template_params": {
            "from_name": fullName,
            "from_email": email,
            "subject": subject,
            "message": message,
            "to_email": "Ezriouil.dev@gmail.com"
          }
        }),
      );

      if (response.statusCode == 200) { CustomSnackBar.emailSent(); }

      fullNameController.clear();
      objectController.clear();
      messageController.clear();

      Future.delayed(const Duration(milliseconds: 300), (){ formState.currentState?.reset(); });

    } catch (_) { CustomSnackBar.error(); }
    finally { isSending.value = false; }
  }

  // - - - - - - - - - - - - - - - - - - ADD AUTO SCROLLING TO LIST VIEW - - - - - - - - - - - - - - - - - -  //
  void _autoScrolling() async {

    await Future.delayed(const Duration(seconds: 3));

    // Setup auto-scrolling for skillsZeroScrollController
    void startZeroScrolling() {
      if (skillsZeroScrollController.hasClients && skillsZeroScrollController.position.maxScrollExtent > 0) {
        skillsZeroScrollController.animateTo(
          skillsZeroScrollController.position.maxScrollExtent,
          curve: Curves.linear,
          duration: const Duration(seconds: 40),
        ).then((_) {
          if (skillsZeroScrollController.hasClients) {
            skillsZeroScrollController.jumpTo(0);
            Future.delayed(const Duration(milliseconds: 100), () => startZeroScrolling());
          }
        });
      } else {
        // Retry if not ready yet
        Future.delayed(const Duration(milliseconds: 500), () => startZeroScrolling());
      }
    }
    skillsZeroScrollController.addListener(() {
      if (skillsZeroScrollController.hasClients && skillsZeroScrollController.position.pixels >= skillsZeroScrollController.position.maxScrollExtent && skillsZeroScrollController.position.maxScrollExtent > 0) {
        skillsZeroScrollController.jumpTo(0);
      }
    });
    startZeroScrolling();

    // Setup auto-scrolling for skillsFirstScrollController
    void startFirstScrolling() {
      if (skillsFirstScrollController.hasClients && skillsFirstScrollController.position.maxScrollExtent > 0) {
        skillsFirstScrollController.animateTo(
          skillsFirstScrollController.position.maxScrollExtent,
          curve: Curves.linear,
          duration: const Duration(seconds: 40),
        ).then((_) {
          if (skillsFirstScrollController.hasClients) {
            skillsFirstScrollController.jumpTo(0);
            Future.delayed(const Duration(milliseconds: 100), () => startFirstScrolling());
          }
        });
      } else {
        // Retry if not ready yet
        Future.delayed(const Duration(milliseconds: 500), () => startFirstScrolling());
      }
    }
    skillsFirstScrollController.addListener(() {
      if (skillsFirstScrollController.hasClients && skillsFirstScrollController.position.pixels >= skillsFirstScrollController.position.maxScrollExtent && skillsFirstScrollController.position.maxScrollExtent > 0) {
        skillsFirstScrollController.jumpTo(0);
      }
    });
    startFirstScrolling();

    // Setup auto-scrolling for skillsLastScrollController
    void startLastScrolling() {
      if (skillsLastScrollController.hasClients && skillsLastScrollController.position.maxScrollExtent > 0) {
        skillsLastScrollController.animateTo(
          skillsLastScrollController.position.maxScrollExtent,
          curve: Curves.linear,
          duration: const Duration(seconds: 40),
        ).then((_) {
          if (skillsLastScrollController.hasClients) {
            skillsLastScrollController.jumpTo(0);
            Future.delayed(const Duration(milliseconds: 100), () => startLastScrolling());
          }
        });
      } else {
        // Retry if not ready yet
        Future.delayed(const Duration(milliseconds: 500), () => startLastScrolling());
      }
    }
    skillsLastScrollController.addListener(() {
      if (skillsLastScrollController.hasClients && skillsLastScrollController.position.pixels >= skillsLastScrollController.position.maxScrollExtent && skillsLastScrollController.position.maxScrollExtent > 0) {
        skillsLastScrollController.jumpTo(0);
      }
    });
    startLastScrolling();

    // Setup auto-scrolling for skillsSecondScrollController
    void startSecondScrolling() {
      if (skillsSecondScrollController.hasClients && skillsSecondScrollController.position.maxScrollExtent > 0) {
        skillsSecondScrollController.animateTo(
          skillsSecondScrollController.position.maxScrollExtent,
          curve: Curves.linear,
          duration: const Duration(seconds: 40),
        ).then((_) {
          if (skillsSecondScrollController.hasClients) {
            skillsSecondScrollController.jumpTo(0);
            Future.delayed(const Duration(milliseconds: 100), () => startSecondScrolling());
          }
        });
      } else {
        // Retry if not ready yet
        Future.delayed(const Duration(milliseconds: 500), () => startSecondScrolling());
      }
    }
    skillsSecondScrollController.addListener(() {
      if (skillsSecondScrollController.hasClients && skillsSecondScrollController.position.pixels >= skillsSecondScrollController.position.maxScrollExtent && skillsSecondScrollController.position.maxScrollExtent > 0) {
        skillsSecondScrollController.jumpTo(0);
      }
    });
    startSecondScrolling();

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
      Get.changeThemeMode(isDarkTheme.value ? ThemeMode.light : ThemeMode.dark);
      isDarkTheme.value = !isDarkTheme.value;
    }
    catch(_){}
  }

  // - - - - - - - - - - - - - - - - - - GITHUB - - - - - - - - - - - - - - - - - -  //
  void onGithub() async {
    try{ await launchUrl(Uri.parse(CustomConstants.GITHUB)); }
    catch(_){ CustomSnackBar.error(); }
  }

  // - - - - - - - - - - - - - - - - - - LINKEDIN - - - - - - - - - - - - - - - - - -  //
  void onLinkedIn() async {
    try{ await launchUrl(Uri.parse(CustomConstants.LIKED_IN)); }
    catch(_){ CustomSnackBar.error(); }
  }

  // - - - - - - - - - - - - - - - - - - GMAIL - - - - - - - - - - - - - - - - - -  //
  void onGmail() async {
    try {
      final Uri gmailUri = Uri(scheme: 'mailto', path: 'Ezriouil.dev@gmail.com');
      if (await canLaunchUrl(gmailUri)) { await launchUrl(gmailUri); }
    }
    catch (_) { CustomSnackBar.error(); }
  }

  @override
  void dispose() {
    scrollController.dispose();
    skillsZeroScrollController.dispose();
    skillsFirstScrollController.dispose();
    skillsSecondScrollController.dispose();
    skillsLastScrollController.dispose();
    cardSwiperController.dispose();
    fullNameController.dispose();
    objectController.dispose();
    messageController.dispose();
    super.dispose();
  }

}