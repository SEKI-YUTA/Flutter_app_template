import 'package:flutter/material.dart';
import 'package:my_app_template/ui/themes.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('SampleScreen ${text}', style: headingStyle),
    );
  }
}
