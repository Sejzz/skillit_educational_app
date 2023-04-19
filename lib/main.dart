import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skill_it/mainmain.dart';
import 'package:skill_it/pages/AddQuestion.dart';
import 'package:skill_it/pages/create_quiz.dart';
import 'package:skill_it/pages/home.dart';
import 'package:skill_it/pages/login.dart';
import 'package:skill_it/pages/splash.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  //make sure that firebase is initialized before we run our application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: 
      splash(username: '',),
     // home: mainmain(),
    );
  }
}
