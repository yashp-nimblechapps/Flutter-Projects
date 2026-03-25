import 'package:flutter/material.dart';
import 'package:flutter_application_5/data/local/db_helper.dart';
import 'package:flutter_application_5/db_provider.dart';
import 'package:flutter_application_5/home_page.dart';
import 'package:flutter_application_5/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DBProvider(dbHelper: DBHelper.getInstance),),
      ChangeNotifierProvider(create: (context) => ThemeProvider(),)
    ],
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: context.watch<ThemeProvider>().getThemeValue() ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(       
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}



