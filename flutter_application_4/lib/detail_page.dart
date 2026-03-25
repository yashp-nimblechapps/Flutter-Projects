import 'package:flutter/material.dart';
import 'package:flutter_application_4/main.dart';
import 'package:flutter_application_4/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatelessWidget{
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Container(
        color: Colors.blue.shade300,
        child: Center(
          child: SizedBox(
            width: 200,
            height:50,
            child: ElevatedButton(
              onPressed: () async {
        
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashPageState.KEYLOGIN, false);
        
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Login Page')));          
              },
              child: Text('Logout', style: TextStyle(fontSize: 20),),
            ),
          )
        ),
      )
    );
  }
}