import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skill_it/pages/add_notes.dart';

class notes extends StatefulWidget {
   static const String id = 'notes';
  const notes({super.key});

  @override
  State<notes> createState() => _notesState();
}

class _notesState extends State<notes> {
  final List<Widget> _list = [
   
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Notes"),
         backgroundColor: Color(0xff443C68)),
        backgroundColor: Color(0xff393053),
        body: ListView.builder(
          itemCount: _list.length, //item count is the number of time the list builder will call this function
        padding: EdgeInsets.only(top: 20),
         itemBuilder: ((context, index) =>
           Container(
            width: MediaQuery.of(context).size.width,
           // height: MediaQuery.of(context).size.height,
            height:  90,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Card(

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
           child: Container
           (
           // width: MediaQuery.of(context).size.width,
           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
            _list[index]
            //Text(_list[index]),
           ],
           ),),
            ),
          )
          
         )
          ),


floatingActionButton: Builder(
 
  builder: (context) {
    return     FloatingActionButton(
      backgroundColor:  Color(0xff443C68),
      onPressed: () async {
    String newText = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=>AddnotesScreen()));   //we need the context so we will wrap the FAB with a builder
    setState(() {
      _list.add(Text(newText));
    });
    },
    child: Icon(Icons.add),
    );
  }
),
    );
  }
}