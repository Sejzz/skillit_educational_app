import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skill_it/models/studyModel.dart';
import 'package:skill_it/pages/study_reading.dart';

class study extends StatefulWidget {
   static const String id = 'study';



  @override
  State<study> createState() => _studyState();
}

class _studyState extends State<study> {
 // late Document doc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff393053),
      appBar: AppBar(title: Text("Study Space"),
      backgroundColor: Color(0xff443C68),),
      
      body: 
      SafeArea(
     
          
          child: SingleChildScrollView(
            child: Container(
               //decoration: BoxDecoration(border: Border(top: BorderSide())),
               padding: EdgeInsets.only(top: 0),
               child: Column(
               
              children: 
                Document.doc_list.map((doc) => ListTile(
                  minVerticalPadding: 20,
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                  tileColor: Color(0xff393053),
                 
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: Color(0xff443C68)),
                    borderRadius: BorderRadius.circular(0)
                  ),
                  onTap: () {
                     Navigator.push(context,
                       MaterialPageRoute(builder: (context)=>reading(doc)
                      ));
                  },
               title: Text(doc.doc_title!, style: TextStyle(fontSize: 18, color: Colors.white),),
            leading: SizedBox(
               height: 50.0,
  width:50.0,
              child: CircleAvatar(
                
              backgroundImage: AssetImage(doc.img!)
              //AssetImage("..."), 
                      ),
            )
                )).toList(),
                 
              
            ),
                  ),
          ),
      )
    

         
    );
  }
}