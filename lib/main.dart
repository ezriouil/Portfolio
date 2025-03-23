import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:portfolio/home/home_controller.dart';
import 'package:portfolio/home/screens/home_mobile_screen.dart';
import 'package:portfolio/home/screens/home_tablet_screen.dart';
import 'package:portfolio/home/screens/home_web_screen.dart';
import 'package:portfolio/utils/state/custom_layout.dart';

import 'utils/theme/theme_app.dart';

void main() async {

  // - - - - - - - - - - - - - - - - - - INIT WIDGETS - - - - - - - - - - - - - - - - - -  //
  WidgetsFlutterBinding.ensureInitialized();

  // - - - - - - - - - - - - - - - - - - INIT FIREBASE - - - - - - - - - - - - - - - - - -  //
  //await Firebase.initializeApp();

  // - - - - - - - - - - - - - - - - - - HIDE TOP STATUS BAR + SYSTEM BOTTOM BAR - - - - - - - - - - - - - - - - - -  //
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeApp.lightTheme,
        darkTheme: ThemeApp.darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: DependencyInjection(),
        getPages: const [],
        home: const CustomLayout(
            mobile: HomeMobileScreen(),
            tablet: HomeTabletScreen(),
            web: HomeWebScreen()
        )
    );
  }

}

class DependencyInjection implements Bindings {

  @override
  void dependencies() {
    Get.put(HomeController());
  }

}