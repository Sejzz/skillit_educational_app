import 'package:flutter/material.dart';

class AddnotesScreen extends StatefulWidget {
  const AddnotesScreen({super.key});

  @override
  State<AddnotesScreen> createState() => _AddnotesScreenState();
}

class _AddnotesScreenState extends State<AddnotesScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("New Note"),
       backgroundColor: Color(0xff443C68),
      ),
       backgroundColor: Color(0xff393053),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
        
          children: [
            Padding(padding: EdgeInsets.fromLTRB(30, 80, 30, 80)),
            TextField( 
               keyboardType: TextInputType.multiline,
  maxLines: null,
              style: TextStyle(color: Colors.white),
              cursorColor: Color.fromARGB(255, 130, 114, 223),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                hintText: "Notes", hintStyle: TextStyle(color: Color.fromARGB(255, 216, 214, 214)),
                labelText: "Add Notes", labelStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Color(0xff443C68),
              prefixIcon: Icon(Icons.event,
          
              color: Colors.white,
             ),
              focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(40),
      //  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 56, 49, 145),),
      ),
             border: OutlineInputBorder(
            //  borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 56, 49, 145),),
              borderRadius: BorderRadius.circular(40)),
             ),
             controller: _textEditingController,
            ),
          SizedBox(height: 30,),
            SizedBox(
              height: 50,
              width: 330,
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 100, 88, 151),
                      shape:  RoundedRectangleBorder( 
                  borderRadius: BorderRadius.circular(30)
              ),
                    ),
                    onPressed: (){
                    String newEventText = _textEditingController.text;
                    Navigator.of(context).pop(newEventText);
                  }, child: Text("ADD"));
                }
              ),
            ),
          ],
        ),
      ),
      );
    
  }
}