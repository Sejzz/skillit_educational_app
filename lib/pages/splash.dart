
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_it/mainmain.dart';
import 'package:skill_it/pages/home.dart';
import 'package:skill_it/pages/login.dart';
import 'package:skill_it/pages/onboarding.dart';



var finalusername;

class splash extends StatefulWidget {
   final String username;
 const splash(  {Key? key,
      required this.username,
       
     })
      : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

   late var  finalusername;
  @override
  void initState(){

    super.initState();
    getValidationData().whenComplete(() async{
       _navigatetousername();
    },);
   
    
  }

  _navigatetousername()async{
    await Future.delayed(Duration(milliseconds: 2500), (){

    });
     Navigator.push(context,
          MaterialPageRoute(builder: (context){return 
          FirebaseAuth.instance.currentUser!=null?mainmain(): OnBoardingScreen();}));
    // Navigator.pushReplacement(context, MaterialPageRoute(
    //   builder: (context) => OnBoardingScreen()
     // username()
    //  ));
  }

  Future getValidationData() async{
    final SharedPreferences sharedPreferences = 
     await SharedPreferences.getInstance();
    var obtainedusername =sharedPreferences.getString('username');
    
    setState(() {
      finalusername = obtainedusername;
      // savingUserData(){
                   //   DatabaseService().savingUserData(widget.username).then((value){
                     //   setState(() {
 // username = value;
  
//});
                    //  }
                    //  );
                   // }
     
    });
  //  print(finalusername);
    print(obtainedusername);
  }
  

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   Color(0xff393053),
        body: 
         Center(
           child: 
           Container( padding: EdgeInsets.only(top: 320),
            child: Column(children: [
              
                Image.asset(
                  "assets/images/white.png",
                  height: 100,
                  width: 150,
               
            )
               ]
           )
            ),
         ) );
    
  }
}