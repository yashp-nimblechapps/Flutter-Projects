import 'package:flutter/material.dart';


class SecondPage extends StatelessWidget{

  var nameFromHome;

  SecondPage(this.nameFromHome, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Second Page')),
      ),
      body: Container(
        color: Colors.lightBlue.shade200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome $nameFromHome', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
        
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 
                child: Text('BACK'))
            ],
          ),
        ),
      ),
    );
  }
}



