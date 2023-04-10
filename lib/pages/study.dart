import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class study extends StatefulWidget {
   static const String id = 'study';
   study(){

 }

int selectedIndex = 0;
study.sellActivated(){
    selectedIndex=2;
  }
  study.launchSlide(int index){
    selectedIndex=index;

  }

  @override
  State<study> createState() => _studyState();
}

class _studyState extends State<study> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}