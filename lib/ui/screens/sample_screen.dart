import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_template/ui/themes.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            'SampleScreen ${text}',
            style: headingStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Text(Get.isDarkMode.toString())
      ],
    );
  }
}
