import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skill_it/pages/create_quiz.dart';
import 'package:skill_it/pages/play_quiz.dart';
import 'package:skill_it/services/database.dart';


class home extends StatefulWidget {
 home(){

 }

// int selectedIndex = 0;

//  home.sellActivated(){
//     selectedIndex=1;
//   }
//   home.launchSlide(int index){
//     selectedIndex=index;

//  }
  static String id = "/home";
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
   void _onItemTapped(int index) {
    setState(() {
     // widget.selectedIndex = index;
    });
  }
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
      body: quizList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFAC66CC),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateQuiz()));
        },
      ),
     bottomNavigationBar:BottomNavigationBar(
     // backgroundColor: kGrey,
      //  currentIndex: widget.selectedIndex,
       // selectedItemColor: kRed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Homealone',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'Study',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Doubt',
          ),
        ],
      ),
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
