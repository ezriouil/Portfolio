import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'utils/theme/theme_app.dart';

void main() async {

  // - - - - - - - - - - - - - - - - - - INIT WIDGETS - - - - - - - - - - - - - - - - - -  //
  WidgetsFlutterBinding.ensureInitialized();

  // - - - - - - - - - - - - - - - - - - INIT FIREBASE - - - - - - - - - - - - - - - - - -  //
  await Firebase.initializeApp();

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
        home: const SizedBox()
    );
  }

}

class DependencyInjection implements Bindings {

  @override
  void dependencies() {

  }

}