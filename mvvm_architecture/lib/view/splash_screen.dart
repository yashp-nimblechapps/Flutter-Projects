import 'package:flutter/material.dart';
import 'package:mvvm_architecture/app_store/app_store.dart';
import 'package:mvvm_architecture/routes/name_routes.dart';
import 'package:mvvm_architecture/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String token = "";

  void _getToken() {
    AppStore().getUserToken().then((value) {
      setState(() {
        token = value;
        //print("userToken: $token");
      });
    });
  }

  @override
  void initState() {
    _getToken();

    Future.delayed(Duration(seconds: 2), () {
      if(token == "") {
        Navigator.pushReplacementNamed(context, RouteName.loginScreen,
          arguments: {'title' : 'Login'}
        );
      } else {
        Navigator.pushNamed(context, RouteName.homeScreen);
      }  
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset('assets/splash_screen_image.jpg'),
        ),
      ),
    );
  }
}