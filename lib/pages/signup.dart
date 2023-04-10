import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill_it/pages/home.dart';
import 'package:skill_it/widgets/reusable.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFFFACAC), Color(0xFFAC66CC)])),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 80, 20, 10),
                    child: Column(children: <Widget>[
                      // Image.asset(
                      //   "assets/images/white.png",
                      //   width: 250,
                      //   height: 150,
                      // ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "SIGN UP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      reusableTextField("Enter Username", Icons.person, false,
                          _userTextController),
                      const SizedBox(
                        height: 25,
                      ),
                      reusableTextField("Enter Email", Icons.email, false,
                          _emailTextController),
                      const SizedBox(
                        height: 25,
                      ),
                      reusableTextField("Enter Password", Icons.lock_outline,
                          true, _passwordTextController),
                      const SizedBox(
                        height: 30,
                      ),

                      SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          // getInfoAndSignUp();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            "Sign Up",
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

                      //  signInsignUpButton(context, false, (){
                      //    FirebaseAuth.instance.createUserWithEmailAndPassword(
                      //      email: _emailTextController.text,
                      //     password: _passwordTextController.text).then((value) {
                      //      print("Created New Account");
                      //          Navigator.push(context,
                      //    MaterialPageRoute(builder: (context) => home()));

                      //     }).onError((error, stackTrace) {
                      //      print("Error ${error.toString()}");
                      //     });

                      //  }
                      //   ),
                    ])))));
  }
}
