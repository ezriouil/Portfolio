import 'dart:convert';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/common/models/project_entity.dart';
import 'package:portfolio/common/models/experience_entity.dart';
import 'package:portfolio/utils/constants/custom_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants/custom_constants.dart';

class HomeController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final ScrollController scrollController,
      skillsZeroScrollController,
      skillsFirstScrollController,
      skillsSecondScrollController,
      skillsLastScrollController;
  late final CardSwiperController cardSwiperController;
  late final TextEditingController fullNameController,
      objectController,
      messageController;
  late final RxBool isDarkTheme, isFabVisible, isSending;
  late final GlobalKey<FormState> formState;
  late final GlobalKey homeKey,
      skillsKey,
      projectsKey,
      experiencesKey,
      contactKey;
  late final RxList<ProjectEntity> projects;
  late final RxList<ExperienceEntity> experiences;

  static const List<String> _skillsList = [
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

  late final List<String> skills;

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
    experiences = RxList.empty(growable: true);
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  void init() {
    skills = List.from(_skillsList)..shuffle();
    _autoScrolling();
    _getProjects();
    _getExperiences();
  }

  // - - - - - - - - - - - - - - - - - - GET PROJECTS - - - - - - - - - - - - - - - - - -  //
  Future<void> _getProjects() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('PROJECTS')
              .orderBy('createdAt', descending: true)
              .get();
      
      if (snapshot.docs.isEmpty) return;
      
      projects.value = snapshot.docs.map((doc) {
        final data = {...doc.data()};
        data['id'] ??= doc.id;
        return ProjectEntity.fromJson(data);
      }).toList();
    } catch (_) {
      // Silently handle errors
    }
  }

  // - - - - - - - - - - - - - - - - - - GET EXPERIENCES - - - - - - - - - - - - - - - - - -  //
  Future<void> _getExperiences() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('EXPERIENCES')
              .orderBy('createdAt', descending: true)
              .get();
      
      if (snapshot.docs.isEmpty) return;
      
      experiences.value = snapshot.docs
          .map((doc) => ExperienceEntity.fromJson(doc.data()))
          .toList();
    } catch (_) {
      // Silently handle errors
    }
  }

  // - - - - - - - - - - - - - - - - - - MENU CLICKS - - - - - - - - - - - - - - - - - -  //
  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void onHome() => _scrollToKey(homeKey);
  void onSkills() => _scrollToKey(skillsKey);
  void onProjects() => _scrollToKey(projectsKey);
  void onExperiences() => _scrollToKey(experiencesKey);
  void onContact() => _scrollToKey(contactKey);

  void onDownloadResume() {
    try {
      const pdfUrl = "https://drive.google.com/file/d/1fyUBU8oJ6wWHaXo4Cd2qW79klP0I5HYi/view?usp=sharing";
      html.window.open(pdfUrl, "_blank");
    } catch (_) {}
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

      await http.post(
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

      fullNameController.clear();
      objectController.clear();
      messageController.clear();

      Future.delayed(const Duration(milliseconds: 300), () {
        formState.currentState?.reset();
      });
    } catch (_) {
      // Silently handle errors
    } finally {
      isSending.value = false;
    }
  }

  // - - - - - - - - - - - - - - - - - - ADD AUTO SCROLLING TO LIST VIEW - - - - - - - - - - - - - - - - - -  //
  void _autoScrolling() async {
    await Future.delayed(const Duration(seconds: 3));

    void _setupAutoScrolling(ScrollController controller) {
      void startScrolling() {
        if (controller.hasClients &&
            controller.position.maxScrollExtent > 0) {
          controller
              .animateTo(
            controller.position.maxScrollExtent,
            curve: Curves.linear,
            duration: const Duration(seconds: 40),
          )
              .then((_) {
            if (controller.hasClients) {
              controller.jumpTo(0);
              Future.delayed(
                  const Duration(milliseconds: 100), () => startScrolling());
            }
          });
        } else {
          Future.delayed(
              const Duration(milliseconds: 500), () => startScrolling());
        }
      }

      controller.addListener(() {
        if (controller.hasClients &&
            controller.position.pixels >=
                controller.position.maxScrollExtent &&
            controller.position.maxScrollExtent > 0) {
          controller.jumpTo(0);
        }
      });
      startScrolling();
    }

    _setupAutoScrolling(skillsZeroScrollController);
    _setupAutoScrolling(skillsFirstScrollController);
    _setupAutoScrolling(skillsLastScrollController);
    _setupAutoScrolling(skillsSecondScrollController);

    scrollController.addListener(() {
      if (scrollController.offset > 200 && !isFabVisible.value) {
        isFabVisible.value = true;
      } else if (scrollController.offset <= 200 && isFabVisible.value) {
        isFabVisible.value = false;
      }
    });
  }

  // - - - - - - - - - - - - - - - - - - SCROLL UP - - - - - - - - - - - - - - - - - -  //
  void scrollingUp() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  // - - - - - - - - - - - - - - - - - - CHANGE COLOR THEME - - - - - - - - - - - - - - - - - -  //
  void onChangeColorTheming() {
    try {
      Get.changeThemeMode(isDarkTheme.value ? ThemeMode.light : ThemeMode.dark);
      isDarkTheme.value = !isDarkTheme.value;
    } catch (_) {}
  }

  // - - - - - - - - - - - - - - - - - - GITHUB - - - - - - - - - - - - - - - - - -  //
  void onGithub() async {
    try {
      await launchUrl(Uri.parse(CustomConstants.GITHUB));
    } catch (_) {}
  }

  // - - - - - - - - - - - - - - - - - - LINKEDIN - - - - - - - - - - - - - - - - - -  //
  void onLinkedIn() async {
    try {
      await launchUrl(Uri.parse(CustomConstants.LIKED_IN));
    } catch (_) {}
  }

  // - - - - - - - - - - - - - - - - - - GMAIL - - - - - - - - - - - - - - - - - -  //
  void onGmail() async {
    try {
      final Uri gmailUri =
          Uri(scheme: 'mailto', path: 'Ezriouil.dev@gmail.com');
      if (await canLaunchUrl(gmailUri)) {
        await launchUrl(gmailUri);
      }
    } catch (_) {}
  }

  // - - - - - - - - - - - - - - - - - - HELPER: LAUNCH URL WITH GITHUB FALLBACK - - - - - - - - - - - -  //
  Future<void> launchProjectLink(String? link) async {
    try {
      final url = (link != null && link.isNotEmpty) ? link : CustomConstants.GITHUB;
      await launchUrl(Uri.parse(url));
    } catch (_) {
      // Silently handle errors
    }
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
