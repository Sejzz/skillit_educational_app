import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skill_it/models/studyModel.dart';
import 'package:skill_it/pages/study_reading.dart';

class study extends StatefulWidget {
   static const String id = 'study';
//    study(){

//  }

// int selectedIndex = 0;
// study.sellActivated(){
//     selectedIndex=2;
//   }
//   study.launchSlide(int index){
//     selectedIndex=index;

//   }


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
      // SafeArea(
        
      //   child: Container(child: Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: GridView(children: [
      //        InkWell(
      //           onTap: (){
      //           Navigator.push(context,
      //            MaterialPageRoute(builder: (context)=>reading(doc)
      //            ));
      //         },
      //         child: Container(
      //            width: MediaQuery.of(context).size.width,
      //           decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(20),
      //           color: Color(0xff444654)),
      //         child: Column(
                
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //        //   Icon(Icons.book,size: 50,color: Colors.white,),
      //           Text("Books",style: TextStyle(color: Colors.white,fontSize:
      //            14),)
      //         ],),
      //         ),
      //       ),
      //       InkWell(
      //         onTap: (){
      //        //   Navigator.push(context, MaterialPageRoute(
      //          //   builder: (context)=>HomePage()));
      //         },
      //         child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff444654),),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //              Image.asset(
      //         "assets/images/white.png",
      //         width: 150,
      //         height: 70,
      //       ),
      //          // Icon(Icons.home,size: 50,color: Colors.white,),
      //           Text("Home",style: TextStyle(color: Colors.white,fontSize: 14),)
      //         ],),
      //         ),
      //       ),
      //      InkWell(
      //          onTap: (){
      //        //   Navigator.push(context, MaterialPageRoute(
      //           //  builder: (context)=>HomePage()));
      //         },
      //        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff444654)),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //          // Icon(Icons.search,size: 50,color: Colors.white,),
      //           Text("Search",style: TextStyle(color: Colors.white,fontSize: 14),)
      //         ],),
      //         ),
      //      ),
      //       InkWell(
      //           onTap: (){
      //          // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      //         },
      //         child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff444654)),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //        //   Icon(Icons.settings,size: 50,color: Colors.white,),
      //           Text("Settings",style: TextStyle(color: Colors.white,fontSize: 14),)
      //         ],),
      //         ),
      //       ),
      //       InkWell(
      //           onTap: (){
      //         //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      //         },
      //         child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff444654)),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //        //   Icon(Icons.book,size: 50,color: Colors.white,),
      //           Text("Books",style: TextStyle(color: Colors.white,fontSize: 14),)
      //         ],),
      //         ),
      //       ),
      //        InkWell(
      //         onTap: (){
      //        //   Navigator.push(context, MaterialPageRoute(
      //          //   builder: (context)=>HomePage()));
      //         },
      //         child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff444654),),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //          // Icon(Icons.home,size: 50,color: Colors.white,),
      //           Text("Home",style: TextStyle(color: Colors.white,fontSize: 14),)
      //         ],),
      //         ),
      //       ),
      //      InkWell(
      //          onTap: (){
      //        //   Navigator.push(context, MaterialPageRoute(
      //           //  builder: (context)=>HomePage()));
      //         },
      //        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff444654)),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //          // Icon(Icons.search,size: 50,color: Colors.white,),
      //           Text("Search",style: TextStyle(color: Colors.white,fontSize: 14),)
      //         ],),
      //         ),
      //      ),
      //       InkWell(
      //           onTap: (){
      //          // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      //         },
      //         child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff444654)),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //        //   Icon(Icons.settings,size: 50,color: Colors.white,),
      //           Text("Settings",style: TextStyle(color: Colors.white,fontSize: 14),)
      //         ],),
      //         ),
      //       ),
      //       InkWell(
      //           onTap: (){
      //         //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      //         },
      //         child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff444654)),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //        //   Icon(Icons.book,size: 50,color: Colors.white,),
      //           Text("Books",style: TextStyle(color: Colors.white,fontSize: 14),)
      //         ],),
      //         ),
      //       ),
      //     ],
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
      //     ),
      //   ),
      //   ),
      // ),

         
    );
  }
}