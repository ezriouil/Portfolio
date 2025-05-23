import 'package:cloudinary/cloudinary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:portfolio/details/details_controller.dart';
import 'package:portfolio/details/screens/details_mobile_screen.dart';
import 'package:portfolio/details/screens/details_tablet_and_web_screen.dart';
import 'package:portfolio/home/home_controller.dart';
import 'package:portfolio/utils/state/custom_layout.dart';

import 'firebase_options.dart';
import 'home/screens/home_mobile_screen.dart';
import 'home/screens/home_tablet_screen.dart';
import 'home/screens/home_web_screen.dart';
import 'utils/theme/theme_app.dart';

void main() async {

  // - - - - - - - - - - - - - - - - - - INIT WIDGETS - - - - - - - - - - - - - - - - - -  //
  WidgetsFlutterBinding.ensureInitialized();

  // - - - - - - - - - - - - - - - - - - INIT FIREBASE - - - - - - - - - - - - - - - - - -  //
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // - - - - - - - - - - - - - - - - - - HIDE TOP STATUS BAR + SYSTEM BOTTOM BAR - - - - - - - - - - - - - - - - - -  //
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeApp.lightTheme,
        darkTheme: ThemeApp.darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: DependencyInjection(),
        getPages: [
          GetPage(name: "/", page: () => const CustomLayout(
            mobile: HomeMobileScreen(),
            tablet: HomeTabletScreen(),
            web: HomeWebScreen(),
          )),
          GetPage(name: "/details/:id", page: () => const CustomLayout(
            mobile: DetailsMobileScreen(),
            tablet: DetailsTabletAndWebScreen(),
            web: DetailsTabletAndWebScreen(),
          )),
        ],
        initialRoute: '/',
    );
  }

}

class DependencyInjection implements Bindings {

  @override
  void dependencies() {
    Get.put(Cloudinary.signedConfig(apiKey: "336153497372995", apiSecret: "2n4ZVVLFLsmBxY74pSCwiMRXqq0", cloudName: "dwcnliksx"));
    Get.lazyPut(() => HomeController(), fenix: false);
    Get.lazyPut(() => DetailsController(), fenix: false);
  }

}