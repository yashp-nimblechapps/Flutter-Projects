import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: const TextTheme(
          displaySmall: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),
          displayMedium: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var emailText = TextEditingController();
  var passText = TextEditingController();

  var birthDate = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //var arrNames = ['Aaa','Bbb', 'Ccc', 'Ddd', 'Eee', 'Fff'];
  
    return Scaffold(
      appBar: AppBar(
        title: Text("",),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(50),
          width: 320,
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.start,
            children: [

              Text("Input Form", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),

              Container(height: 20,),
              TextField(
                //enabled: false,  .......to disable field
                //keyboardType: TextInputType.phone,   .....to change keyboard

                controller: emailText,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.amber, width: 2)
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.blue)
                  ),

                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.grey)
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.amber, width: 2)
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.blue)
                  ),

                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.grey)
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

                TextField(
                  controller: birthDate,
                  //readOnly: true, 
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2027),
                    );

                    if (selectedDate != null) {
                      birthDate.text =
                          "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.amber, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: Icon(Icons.calendar_today),
                    labelText: "Birthdate"
                  ),
                ),


              Container(height: 20,),

              SizedBox(
                height: 50,
                width: 320,
                  child: ElevatedButton( onPressed: () {
                      String uEmail = emailText.text.toString();
                      String uPass = passText.text.toString();
                      String ubirth = birthDate.text.toString();

                      print("Email: $uEmail, Password: $uPass, Birthdate: $ubirth", );
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ), 
                    child: Text('LOGIN', style: TextStyle(fontSize: 15),),          
                )
                
              ),

              Container(height: 20,),

              Text("Or sign up with social account", style: TextStyle(fontSize: 15,)),
              
              Container(height: 30,),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,

                    ),
                    child: Text("GOOGLE"),
                  ),
                  Container(width:90,),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white
                    ),
                    child: Text("FACEBOOK"),
                  ),
                ],
              ),

            ],
          
          
        )
      )
      )
    );
  }
}
