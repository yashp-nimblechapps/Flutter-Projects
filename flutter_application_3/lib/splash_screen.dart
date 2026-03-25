import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/main.dart';


class SplashPage extends StatefulWidget{
  const SplashPage({super.key});


  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {  

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'MP APP')
        ));
    });
  }

  @override
  Widget build(BuildContext context) { 
  return Scaffold(
    body: Container(
      color: Colors.blue.shade400,
      child: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          
          child: Center(child: Text(' APP ', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.black),)))
        ),
    ),

  
  );
  }
}

