import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/home/home_controller.dart';
import 'package:portfolio/utils/state/custom_state.dart';

class HomeMobileScreen extends CustomState {
  const HomeMobileScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(title: const Text('App Bar Mobile')),
      body: Container(color: blueColor(context)),
    );
  }
}
