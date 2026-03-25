import 'package:flutter/material.dart';
import 'package:flutter_application_6/counter_provider.dart';
import 'package:flutter_application_6/list_map_provider.dart';
import 'package:flutter_application_6/list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ListMapProvider()),
          ChangeNotifierProvider(create: (context) => CounterProvider()),
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
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ListPage(),
      
      /*
      ChangeNotifierProvider(
        create: (_) => ListMapProvider(),
        child: ChangeNotifierProvider(
          create: (context) => CounterProvider(),
          child: ListPage(),
      */
    
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    print("Build function called");

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (ctx, _, __){
            print("Consumer build function called");
            return Text(
              //'${Provider.of<CounterProvider>(ctx,).getCount()}',
              //watch instead listen: true
              '${ctx.watch<CounterProvider>().getCount()}',
               style: TextStyle(fontSize: 25)
             );
          }
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              //Provider.of<CounterProvider>(context, listen: false).incrementCount();
              //read instead listen: false
              context.read<CounterProvider>().incrementCount(2);
            },
            child: Icon(Icons.add)
          ),
           FloatingActionButton(
            onPressed: () {
              //Provider.of<CounterProvider>(context, listen: false).decrementCount();
              //read instead listen: false
              context.read<CounterProvider>().decrementCount();
            },
            child: Icon(Icons.remove)
          ),

        ],
      )
      
    );
  }
}
