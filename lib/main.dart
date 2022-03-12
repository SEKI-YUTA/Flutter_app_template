import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_app_template/services/theme_service.dart';
import 'package:my_app_template/ui/login_page.dart';
import 'package:my_app_template/ui/main_page.dart';
import 'package:my_app_template/ui/screens/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app_template/ui/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Future<bool> haveSeenIntro() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print('haveseen:${pref.getBool('haveSeenIntro')}');
    bool haveSeen = pref.getBool('haveSeenIntro') ?? false;
    return haveSeen;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: haveSeenIntro() == true
          ? LoginPage()
          : IntroductionScreen(
              pages: [
                PageViewModel(
                  title: 'Introduction Screen',
                  body: 'This is introduction screen',
                )
              ],
              done: const Text("Done",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              onDone: () async {
                // When done button is press
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setBool('haveSeenIntro', true);
                Get.to(LoginPage());
              },
              showNextButton: false,
            ),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
    );
  }

  void setReset() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('haveSeenIntro', false);
  }
}
