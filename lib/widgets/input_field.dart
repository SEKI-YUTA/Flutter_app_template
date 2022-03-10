import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  const MyInputField({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(25)),
        child: TextFormField(
          controller: _passwordController,
          decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0))),
        ));
  }
}
