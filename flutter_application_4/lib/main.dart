import 'package:flutter/material.dart';
import 'package:flutter_application_4/detail_page.dart';
import 'package:flutter_application_4/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(  
        colorScheme: .fromSeed(seedColor: Colors.blue),
      ),
      home: SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  var emailText = TextEditingController();
  var passText = TextEditingController();
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text('Login Page')),
      ),
      body: Container(
          margin: EdgeInsets.all(50),
          width: 320,
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [

              Icon(Icons.account_circle, size: 100, color: Colors.blue,),

              Container(height: 20,),
              TextField(
                //enabled: false,  .......to disable field
                //keyboardType: TextInputType.phone,   .....to change keyboard
                controller: emailText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.amber, width: 2)
                  ),
                  hintText: "Enter Email",
                  //prefixText: "Enter Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              Container(height: 20,),

              TextField(
                controller: passText,
                obscureText: true,
                obscuringCharacter: '*',   
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.amber, width: 2)
                  ),     
                hintText: "Enter Password",
                //prefixText: "Enter Password",
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye,),
                    onPressed: () {},
                  )
                ),               
              ),
              Container(height: 20,),
              SizedBox(
                height: 50,
                width: 320,
                  child: ElevatedButton( 
                    onPressed: () async {

                      var sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setBool(SplashPageState.KEYLOGIN, true);

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailPage() ));
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ), 
                    child: Text('LOGIN', style: TextStyle(fontSize: 15),),          
                )           
              ),         
            ],            
        )
      )     
    );
  }
}
