import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/detail_page.dart';
import 'package:flutter_application_4/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});


  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {  
  static const String KEYLOGIN = "Login";

  @override
  void initState() {
    super.initState();
    whereToGo(); 
  }

  @override
  Widget build(BuildContext context) { 
  return Scaffold(
    body: Container(
      color: Colors.lightBlue,
      child: Center(
        child: Icon(Icons.account_circle, size: 120, color: Colors.white,),
      ),
    ),
  );
  }
  
  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), () {

      if(isLoggedIn!=null){
        if(isLoggedIn){
          Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => DetailPage()));
        } else {
          Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Login Page')));
        }
      } else {
        Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Login Page')));
      }   
    });
  }
}

