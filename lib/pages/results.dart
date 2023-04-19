import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  final int total, correct, incorrect, notattempted;
  Results({required this.incorrect, required this.total,
   required this.correct, required this.notattempted});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xff393053),
      appBar: AppBar(
        
          backgroundColor: Color(0xff443C68),
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            Text("Results"),
            Image.asset(
              'assets/images/white.png',
              fit: BoxFit.cover,
              width: 55,
              height: 55,
            ),
          ])),
          
      body: Container(
        
       // child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50,),
               Image.asset(
              'assets/images/result.png',
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            ),
            SizedBox(height: 40,),
            Text("${widget.correct}/ ${widget.total}", style: TextStyle(fontSize: 25, color: Colors.white),),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    "You answered ${widget.correct} answers correctly and ${widget.incorrect} answeres incorrectly",
               style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,),

              ),
              SizedBox(height: 60,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 60,
                  width: 180,
                  padding: EdgeInsets.fromLTRB(40, 18, 0, 15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 94, 83, 143),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text("Go to home", style: TextStyle(color: Colors.white, fontSize: 19),),
                ),
              )
          ],),
        ),
    //  ),
    );
  }
}
