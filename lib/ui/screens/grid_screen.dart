import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ImagesGrid extends StatefulWidget {
  const ImagesGrid({Key? key}) : super(key: key);

  @override
  State<ImagesGrid> createState() => _ImagesGridState();
}

class _ImagesGridState extends State<ImagesGrid> {
  var images = List.generate(
    100,
    (index) => Image.asset(
      'images/${NumberFormat("000").format((index + 1)).toString()}.jpg',
      fit: BoxFit.cover,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          itemCount: images.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Container(child: images[index]);
          }),
    );
  }
}
