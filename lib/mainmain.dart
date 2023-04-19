import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skill_it/pages/doubt_gpt.dart';
import 'package:skill_it/pages/home.dart';
import 'package:skill_it/pages/notes.dart';
import 'package:skill_it/pages/study.dart';

class mainmain extends StatefulWidget {
  const mainmain({super.key});

  @override
  State<mainmain> createState() => _mainmainState();
}

class _mainmainState extends State<mainmain> {
    int index = 0;
   final screens = [
    home(),
    study(),
    notes(),
    chat_doubt(),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Color(0xff393053),
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
          )
        ),
        child: NavigationBar(
          height: 60,
         
          backgroundColor: Color(0xff443C68),
          selectedIndex: index,
          onDestinationSelected: (index) => 
          setState(() => this.index = index),
          destinations: [
          NavigationDestination(
          
            icon: Icon(Icons.quiz_outlined, color: Colors.white,),
          selectedIcon: Icon(Icons.quiz, color: Colors.white,),
           label: 'Tests',
           ),
          NavigationDestination(icon: Icon(Icons.book_outlined,  color: Colors.white,),
           selectedIcon: Icon(Icons.book,  color: Colors.white,), 
          label: 'Study'
          ),
           NavigationDestination(icon: Icon(Icons.edit_note_outlined,  color: Colors.white,), 
            selectedIcon: Icon(Icons.edit_note,  color: Colors.white,),
           label: 'Notes'
           ),
          NavigationDestination(icon: Icon(Icons.error_outline,  color: Colors.white,), 
           selectedIcon: Icon(Icons.error,  color: Colors.white,),
          label: 'Doubts'
          ),
        ]),
      ),
    );
  }
}