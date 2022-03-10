import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_template/ui/main_page.dart';
import 'package:my_app_template/ui/themes.dart';
import 'package:my_app_template/widgets/button1.dart';
import 'package:my_app_template/widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _loginSuccessed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/001.jpg'),
                    opacity: 0.5,
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login Page',
                  style: headingStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MyInputField(passwordController: _emailController),
                const SizedBox(
                  height: 20,
                ),
                MyInputField(passwordController: _passwordController),
                const SizedBox(
                  height: 20,
                ),
                MyButton1(buttonText: "Login", onPressed: _login)
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _login() async {
    // login process
    // login successed _loginSuccessed = true;
    // login failed _loginSuccessed =
    Get.off(MainPage());
    setState(() {
      _loginSuccessed = true;
    });
  }
}
