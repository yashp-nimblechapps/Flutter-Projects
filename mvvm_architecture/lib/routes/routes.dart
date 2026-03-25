import 'package:flutter/material.dart';
import 'package:mvvm_architecture/routes/name_routes.dart';
import 'package:mvvm_architecture/view/home_screen.dart';
import 'package:mvvm_architecture/view/login_screen.dart';
import 'package:mvvm_architecture/view/splash_screen.dart';
import 'package:mvvm_architecture/view_model/login_provider.dart';
import 'package:provider/provider.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name) {

      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case RouteName.loginScreen:
        final args = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => 
          ChangeNotifierProvider(
            create: (BuildContext context) => LoginProvider(),
            child: LoginScreen(args: args))
          );

      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(body: Center(child: Text('Something went wrong')));
        }
      );
    }
  }
}