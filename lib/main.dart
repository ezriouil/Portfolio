import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'package:portfolio/home/home_controller.dart';
import 'package:portfolio/utils/constants/custom_colors.dart';
import 'package:portfolio/utils/state/custom_layout.dart';

import 'firebase_options.dart';
import 'home/screens/home_mobile_screen.dart';
import 'home/screens/home_tablet_screen.dart';
import 'home/screens/home_web_screen.dart';
import 'utils/theme/theme_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mohamed Ezriouil',
      themeMode: ThemeMode.light,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController(), fenix: true);
      }),
      getPages: [
        GetPage(name: "/", page: () => MouseFollower(
          onHoverMouseStylesStack: [
            MouseStyle(
              latency: const Duration(milliseconds: 75),
              size: const Size(12, 12),
              visibleOnHover: true,
              decoration: BoxDecoration(
                color: CustomColors.GRAY_DARK,
                border: Border.all(color: CustomColors.GRAY_LIGHT.withValues(alpha: 0.4), width: 0.6),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GRAY_DARK.withValues(alpha: 0.4),
                    blurRadius: 12,
                    spreadRadius: 12,
                  ),
                ],
              ),
            ),
          ],
          mouseStylesStack: [
            MouseStyle(
              latency: const Duration(milliseconds: 75),
              size: const Size(12, 12),
              visibleOnHover: true,
              decoration: BoxDecoration(
                color: CustomColors.GRAY_DARK,
                border: Border.all(color: CustomColors.GRAY_LIGHT.withValues(alpha: 0.4), width: 0.6),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GRAY_DARK.withValues(alpha: 0.4),
                    blurRadius: 12,
                    spreadRadius: 12,
                  ),
                ],
              ),
            ),
          ],
          child: const CustomLayout(
              mobile: HomeMobileScreen(),
              tablet: HomeTabletScreen(),
              web: HomeWebScreen(),
            ),
        )),
      ],
      initialRoute: '/',
    );
  }
}