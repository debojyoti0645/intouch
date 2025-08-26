import 'package:flutter/material.dart';
import 'package:intouch/components/my_button.dart';
import 'package:intouch/components/my_testfield.dart';
import 'package:intouch/services/auth/auth_service.dart';

class LoginPageView extends StatelessWidget {
  //Email and Password Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  //To go to register page
  final void Function()? onTap;

  LoginPageView({super.key, required this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();

    //try login
    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        pwController.text,
      );
    }
    //catch errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(Icons.logo_dev, size: 60),

              //Title
              Text("Always keep inTouch.", style: TextStyle(fontSize: 16)),

              SizedBox(height: 60),

              //Welcome Text
              Text("Welcome...!", style: TextStyle(fontSize: 20)),

              SizedBox(height: 20),

              //Email TextField
              MyTextField(
                hintText: "Email...",
                obscureText: false,
                controller: emailController,
              ),

              SizedBox(height: 10),

              //Password TextField
              MyTextField(
                hintText: "Password...",
                obscureText: true,
                controller: pwController,
              ),

              SizedBox(height: 30),

              //Login Button
              MyButton(text: "LOGIN", onTap: () => login(context)),

              SizedBox(height: 15),

              //Have acc if no then register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not an inTouch user? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register Now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
