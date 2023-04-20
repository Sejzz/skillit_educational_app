import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill_it/mainmain.dart';
import 'package:skill_it/pages/home.dart';
import 'package:skill_it/pages/signup.dart';
import 'package:skill_it/services/auth.dart';

import 'package:skill_it/widgets/reusable.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  // final AuthService _authService = AuthService();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        body: Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(
                  begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                colors: [Color(0xff443C68), Color(0xff393053),])),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 10),
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/images/white.png",
              width: 250,
              height: 150,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "LOG IN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 30,
            ),

            reusableTextField(
                "Enter Email", Icons.email, false, _emailTextController),
            const SizedBox(
              height: 25,
            ),
            reusableTextField("Enter Password", Icons.lock_outline, true,
                _passwordTextController),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 24,
            ),
          
          
             signInsignUpButton(context, true, (){
              FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text,
               password: _passwordTextController.text).then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => mainmain()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
             });

             }),
  SizedBox(
              height: 20,
            ),
            SignUpOption()
          ],
        ),
      )),
    ));
  }

  Row SignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const signup()),
            );
          },
          child: const Text(
            "Sign up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
