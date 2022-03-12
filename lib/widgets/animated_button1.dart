import 'package:flutter/material.dart';

class AnimatedButton1 extends StatefulWidget {
  AnimatedButton1({
    Key? key,
    this.buttonTextStyle =
        const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
    this.width = 50,
    this.height = 50,
    required this.onPressed,
  }) : super(key: key);
  double width;
  double height;
  TextStyle buttonTextStyle;
  Function()? onPressed;

  @override
  State<AnimatedButton1> createState() => _AnimatedButton1State();
}

class _AnimatedButton1State extends State<AnimatedButton1>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<double> _borderRadiusAnim;
  bool isPressing = false;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _borderRadiusAnim =
        Tween<double>(begin: widget.height / 2, end: 5).animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isPressing = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isPressing = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, _) {
          return Container(
            width: widget.width,
            height: widget.height,
            child: GestureDetector(
              onTap: widget.onPressed,
              onLongPress: () {
                // ボタンの形を変える処理
                print('long press');
                controller.forward();
              },
              onLongPressEnd: (LongPressEndDetails detail) {
                // ボタンの形をもとに戻す処理
                print('long press end');
                controller.reverse();
              },
              // onLongPressCancelだとロングプレスを辞めた時に発火しない
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(_borderRadiusAnim.value),
                    color: Colors.blue),
                child: Text(
                  '1',
                  style: widget.buttonTextStyle,
                ),
              ),
            ),
          );
        });
  }
}
