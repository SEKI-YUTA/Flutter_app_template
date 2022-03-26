import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_template/services/theme_service.dart';
import 'package:my_app_template/ui/screens/grid_screen.dart';
import 'package:my_app_template/ui/screens/list_screen.dart';
import 'package:my_app_template/ui/screens/sample_screen.dart';
import 'package:my_app_template/ui/setting_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final _pageWidgets = <Widget>[
    ImagesGrid(),
    ListScreen(),
    SampleScreen(text: "3"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ThemeService().switchTheme();
          },
          icon: Icon(Get.isDarkMode ? Icons.wb_sunny : Icons.nightlight),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(SettingPage());
              },
              icon: Icon(Icons.settings))
        ],
        title: const Text('MyAppTemplate'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pageWidgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "notification"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
        ],
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
      ),
    );
  }
}
