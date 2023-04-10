import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
              LinearGradient(colors: [Color(0xFFFFACAC), Color(0xFFAC66CC)])),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 10),
        child: Column(
          children: <Widget>[
            // Image.asset(
            //   "assets/images/white.png",
            //   width: 250,
            //   height: 150,
            // ),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => home()));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Log In",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFAC66CC)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //  signInsignUpButton(context, true, (){
            //   FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text,
            //    password: _passwordTextController.text).then((value) {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
            //   }).onError((error, stackTrace) {
            //     print("Error ${error.toString()}");
            //  });

            //  }),

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
