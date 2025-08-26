import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intouch/pages/homepage.dart';
import 'package:intouch/services/auth/loginorregister.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            //user logged in
            if(snapshot.hasData){
              return HomePageView();
            }

            else{
              return LoginOrRegister();
            }
          }
        ),
    );
  }
}
