import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skill_it/services/database.dart';
import 'package:skill_it/widgets/reusable.dart';

class AddQuestion extends StatefulWidget {
   final String quizId;
  AddQuestion(this.quizId);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
   DatabaseService databaseService = new DatabaseService();
  final formKey = GlobalKey<FormState>();
   bool isLoading = false;
  late String question, option1, option2, option3, option4;

  uploadQuestionData() async{

    if (formKey.currentState!.validate()) {

      setState(() {
        isLoading = true;
      });

      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };

      print("${widget.quizId}");
      await databaseService.addQuestionData(questionMap, widget.quizId).then((value) {
        question = "";
        option1 = "";
        option2 = "";
        option3 = "";
        option4 = "";
        setState(() {
          isLoading = false;
        });

      }).catchError((e){
        print(e);
      });


    }else{
      print("error is happening ");
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
          body:  isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Form(
             key: formKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? "Enter Question" : null,
                        decoration: InputDecoration(hintText: "Question"),
                        onChanged: (val) {
                          question = val;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? "Enter Option1" : null,
                        decoration: InputDecoration(hintText: "Option1 (Correct Answer)"),
                        onChanged: (val) {
                          option1 = val;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? "Enter Option2" : null,
                        decoration: InputDecoration(hintText: "Option2"),
                        onChanged: (val) {
                          option2 = val;
                        },
                      ),
                       SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? "Enter Option3" : null,
                        decoration: InputDecoration(hintText: "Option3"),
                        onChanged: (val) {
                          option3 = val;
                        },
                      ),
                       TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? "Enter Option4" : null,
                        decoration: InputDecoration(hintText: "Option4"),
                        onChanged: (val) {
                          option4 = val;
                        },
                      ),
                      Spacer(),
                      
                      Row(children:[ 
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: ourButton( 
                             context: context, 
                             label: 'Submit',
                             buttonWidth: MediaQuery.of(context).size.width/2 - 36),
                        ),
                           SizedBox(width: 24,),
                           GestureDetector(
                            onTap: () {
                              uploadQuestionData();
                            },
                             child: ourButton( 
                             context: context, 
                             label: 'Add Question',
                             buttonWidth: MediaQuery.of(context).size.width/2 - 36),
                           )
                           
                           ]
                           ),
                      SizedBox(height: 60),
          
                ],
              ),
            ),
          ),
    );
  }
}
