import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intouch/firebase_options.dart';
import 'package:intouch/services/auth/auth_gate.dart';
import 'package:intouch/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      ),
    );
  } catch (e) {
    print('Firebase initialization error: $e');
    // Handle initialization error appropriately
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}


// Platform  Firebase App Id
// android   1:995363957392:android:0e7c211ef2494689294615
// ios       1:995363957392:ios:26f13c788adb8955294615