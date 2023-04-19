import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skill_it/pages/create_quiz.dart';
import 'package:skill_it/pages/doubt_gpt.dart';
import 'package:skill_it/pages/login.dart';
import 'package:skill_it/pages/notes.dart';
import 'package:skill_it/pages/play_quiz.dart';
import 'package:skill_it/pages/study.dart';
import 'package:skill_it/services/database.dart';


class home extends StatefulWidget {
 home(){

 }


  static String id = "/home";
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  //  int index = 0;
  //  final screens = [
  //   home(),
  //   study(),
  //   notes(),
  //   chat_doubt(),
  //  ];

  //  void _onItemTapped(int index) {
  //   setState(() {
  //    // widget.selectedIndex = index;
  //   });
  // }
    Stream? quizStream;
  DatabaseService databaseService = new DatabaseService();
  Widget quizList(){
    return Container(
     // margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot){
        return snapshot.data == null
        ? Container():
        ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index){
          return QuizTile(
             noOfQuestions: snapshot.data.docs.length,
                          imageUrl:
                              snapshot.data.docs[index].data()['quizImgUrl'],
                          title:
                              snapshot.data.docs[index].data()['quizTitle'],
                          description:
                              snapshot.data.docs[index].data()['quizDesc'],
                          id: snapshot.data.docs[index].data()["quizId"],
              );
        });
      }),
    );
  }
@override
void initState(){
  databaseService.getQuizData().then((value) {
      quizStream = value;
      setState(() {});
    });
  super.initState();
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer( 
          backgroundColor: Color(0xff393053), 
          child: ListView(
               padding: EdgeInsets.only(top: 30),  
    children: <Widget>[  
     
           ListTile(  
            
        title: Text("Log Out", style: TextStyle(color: Colors.white),),  
        onTap: () {  
         FirebaseAuth.instance.signOut().then((value) {
          print("logged out");
          Navigator.push(context,
           MaterialPageRoute(builder: (context) => login()));

         } );
        },  
      ),  
    ]
          ),
        ),
      backgroundColor: Color(0xff393053),
      appBar: AppBar(
        
          backgroundColor: Color(0xff443C68),
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            Text("Tests"),
            Image.asset(
              'assets/images/white.png',
              fit: BoxFit.cover,
              width: 55,
              height: 55,
            ),
          ])),
          
      body: Padding(
        padding:  EdgeInsets.only(top: 15.0),
        
        child: quizList()),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 242, 242, 245),
        child: Icon(Icons.add, color: Color(0xff393053),),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateQuiz()));
        },
      ),

      // bottomNavigationBar: NavigationBarTheme(
      //   data: NavigationBarThemeData(
      //     indicatorColor: Colors.blue.shade100,
      //     labelTextStyle: MaterialStateProperty.all(
      //       TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
      //     )
      //   ),
      //   child: NavigationBar(
      //     height: 60,
      //     backgroundColor: Color(0xFFf1f5fb),
      //     selectedIndex: index,
      //     onDestinationSelected: (index) => 
      //     setState(() => this.index = index),
      //     destinations: [
      //     NavigationDestination(icon: Icon(Icons.email_outlined), label: 'Mail'),
      //     NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
      //      NavigationDestination(icon: Icon(Icons.email_outlined), label: 'Mail'),
      //     NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
      //   ]),
      // ),
    //  bottomNavigationBar:NavigationBar(
    //  // backgroundColor: kGrey,
    //   //  currentIndex: widget.selectedIndex,
    //    // selectedItemColor: kRed,
    //    // unselectedItemColor: Colors.black,
    //    // selectedItemColor: Colors.red,
    //    selectedItemColor: Colors.red,
    //    currentIndex: _currentIndex,
    //     onTap: onTabTapped,
    //     type: BottomNavigationBarType.fixed,
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         //label: 'Homealone',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.sell),
    //         //label: 'Study',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.handshake),
    //         //label: 'Notes',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.group),
    //         label: 'Doubt',
    //       ),
    //     ],
    //   ),
    );
  }
}
class QuizTile extends StatelessWidget {
  final String imageUrl, title, id, description;
  final int noOfQuestions;

  QuizTile(
      {required this.title,
      required this.imageUrl,
      required this.description,
      required this.id,
      required this.noOfQuestions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => PlayQuiz(id)
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        margin: EdgeInsets.only(bottom: 8),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                color: Colors.black26,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 4,),
                      Text(
                        description,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
