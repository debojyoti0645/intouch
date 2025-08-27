import 'package:flutter/material.dart';
import 'package:intouch/pages/loginpage.dart';
import 'package:intouch/pages/registerpage.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPageView(
        onTap: togglePages,
      );
    } else{
      return RegisterPageView(
        onTap: togglePages,
      );
    }
  }
}