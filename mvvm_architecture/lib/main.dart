import 'package:flutter/material.dart';
import 'package:mvvm_architecture/routes/name_routes.dart';
import 'package:mvvm_architecture/routes/routes.dart';
import 'package:mvvm_architecture/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: primaryColor),
      ),
      //home: SplashScreen(),

      initialRoute: RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
