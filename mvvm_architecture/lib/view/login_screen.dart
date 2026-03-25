import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/app_colors.dart';
import 'package:mvvm_architecture/utils/common_toast.dart';
import 'package:mvvm_architecture/view_model/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final Map args;
  const LoginScreen({super.key, required this.args});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  //String name = "";
  //void initState() {
  //  if(widget.args.containsKey('name')) {
  //   name = widget.args['name'];
  // }
  // super.initState();
  //}

  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Text(widget.args['title'], style: TextStyle(color: whiteColor),),
        
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: username,
              decoration: InputDecoration(
                hintText: 'Enter Username'
              ),
            ),
        
            SizedBox(height: 10,),
        
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter Password'
              ),
            ),
        
            SizedBox(height: 20,),
        
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  if(username.text.isEmpty) {
                    commonToast("Please enter Username");

                  } else if (password.text.isEmpty) {
                    commonToast("Please enter Password");

                  } else {

                    Map data = {
                      "username": username.text.toString(),
                      "password": password.text.toString()
                    };
                    loginProvider.userLogin(data, context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: whiteColor
                ),
                child: loginProvider.isLoading
                ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: whiteColor,)) 
                : const Text('Login')
              ),
            )
          ],
        ),
      )    
    );
  }
}