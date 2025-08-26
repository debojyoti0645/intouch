import 'package:flutter/material.dart';
import 'package:intouch/components/my_button.dart';
import 'package:intouch/components/my_testfield.dart';
import 'package:intouch/services/auth/auth_service.dart';

class RegisterPageView extends StatelessWidget {
  //Email and Password Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController rpwController = TextEditingController();

  //To go to register page
  final void Function()? onTap;

  RegisterPageView({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();

    if (pwController.text.length >= 8) {
      if (pwController.text == rpwController.text) {
        try {
          _auth.signUpWithEmailPassword(
              emailController.text, pwController.text);
        } catch (e) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(e.toString()),
                  ));
        }
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Passwords do not match!"),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Passwords too small!"),
              ));
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
              Text(
                "Always keep inTouch.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              SizedBox(
                height: 40,
              ),

              Text(
                "Let's create an account",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(
                height: 20,
              ),

              //Email TextField
              MyTextField(
                hintText: "Email...",
                obscureText: false,
                controller: emailController,
              ),

              SizedBox(
                height: 10,
              ),

              //Password TextField
              MyTextField(
                hintText: "Password...",
                obscureText: true,
                controller: pwController,
              ),

              SizedBox(
                height: 10,
              ),

              MyTextField(
                hintText: "Re-Type Password...",
                obscureText: true,
                controller: rpwController,
              ),

              SizedBox(
                height: 30,
              ),

              //Login Button
              MyButton(
                text: "REGISTER",
                onTap: () => register(context),
              ),

              SizedBox(
                height: 15,
              ),

              //Have acc if no then register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already an inTouch user?"),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Log-in",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
