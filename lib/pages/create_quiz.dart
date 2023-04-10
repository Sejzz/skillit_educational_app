import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:skill_it/pages/AddQuestion.dart';
import 'package:skill_it/services/database.dart';
import 'package:skill_it/widgets/reusable.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formkey = GlobalKey<FormState>();
  late String quizImgUrl, quizTitle, quizDesc;
  bool isLoading = false;
  late String quizId;
  DatabaseService databaseService = new DatabaseService();

  createQuizOnline() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      quizId = randomAlphaNumeric(16);
      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImgUrl": quizImgUrl,
        "quizTitle": quizTitle,
        "quizDesc": quizDesc
      };
      await databaseService.addQuizData(quizMap, quizId).then((value) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AddQuestion(quizId)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFAC66CC),
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Image.asset(
            //   'assets//images/white.png',
            //   fit: BoxFit.cover,
            //   width: 55,
            //   height: 55,
            // ),
          ])),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Form(
              key: _formkey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Quiz Image Url" : null,
                      decoration: InputDecoration(hintText: "Quiz Image Url"),
                      onChanged: (val) {
                        quizImgUrl = val;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Quiz Title" : null,
                      decoration: InputDecoration(hintText: "Quiz Title"),
                      onChanged: (val) {
                        quizTitle = val;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Quiz Description" : null,
                      decoration: InputDecoration(hintText: "Quiz Description"),
                      onChanged: (val) {
                        quizDesc = val;
                      },
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          createQuizOnline();
                        },
                        child: ourButton(
                          context: context, 
                          label:"Create Quiz")),
                    SizedBox(height: 60),
                  ],
                ),
              )),
    );
  }
}
