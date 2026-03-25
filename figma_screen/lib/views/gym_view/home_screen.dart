import 'package:figma_screen/views/gym_view/fifth_screen.dart';
import 'package:figma_screen/views/gym_view/first_screen.dart';
import 'package:figma_screen/views/gym_view/fourth_screen.dart';
import 'package:figma_screen/views/gym_view/second_screen.dart';
import 'package:figma_screen/views/gym_view/third_screen.dart';
import 'package:flutter/material.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    FirstScreen(),  //0
    SecondScreen(),  //1
    ThirdScreen(),  //2
    FourthScreen(),  //3
    FifthScreen(),  //4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],

      // Circular FAB (FloatingActionButton)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70, width: 70,
        child: FloatingActionButton(
          onPressed: () => setState(() => selectedIndex = 2),
          shape: CircleBorder(),
          backgroundColor: Colors.grey.shade200,
          elevation: 6,
          child: Icon(Icons.add, color: Colors.black),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: Icon(Icons.access_time), onPressed: () => setState(() => selectedIndex = 0)),
              IconButton(icon: Icon(Icons.cast), onPressed: () => setState(() => selectedIndex = 1)),
              SizedBox(width: 40),
              IconButton(icon: Icon(Icons.menu), onPressed: () => setState(() => selectedIndex = 3)),
              IconButton(icon: Icon(Icons.person), onPressed: () => setState(() => selectedIndex = 4))
            ],
          ),
        ),
      ),
    );
  }
}




