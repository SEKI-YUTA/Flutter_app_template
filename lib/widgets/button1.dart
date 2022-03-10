import 'package:flutter/material.dart';

class MyButton1 extends StatelessWidget {
  MyButton1({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.width = 150,
    this.height = 60,
    this.textColor = Colors.white,
    this.textSize = 20,
  }) : super(key: key);
  final int width;
  final int height;
  final Color textColor;
  final int textSize;
  final String buttonText;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 150,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(30)),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
