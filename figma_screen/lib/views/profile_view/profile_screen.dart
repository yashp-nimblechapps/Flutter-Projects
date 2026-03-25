import 'package:figma_screen/views/profile_view/profile_one_screen.dart';
import 'package:figma_screen/views/profile_view/profile_two_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;

  final List items = ['PHOTOS', 'VIDEOS', 'POSTS', 'FRIENDS'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined), 
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
            IconButton(
                icon: Icon(Icons.looks_one_outlined, size: 28), 
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileOneScreen())),
              ),
            
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.looks_two_outlined, size: 28), 
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileTwoScreen())),
            ),
          ),
          
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 25),
            CircleAvatar(radius: 60, backgroundColor: Colors.grey.shade300),
            SizedBox(height: 10),
            Text('John Doe', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            Text('Designer', style: TextStyle(fontSize: 15)),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(items.length, (index) {
                return TextButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  }, 
                  child: Column(
                    children: [
                      Text(items[index], 
                        style: TextStyle(color: selectedIndex == index ? Colors.black : Colors.grey),
                      ),
                      SizedBox(height: 5),

                      if (selectedIndex == index) 
                        Container(
                          width: 6, height: 6,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,

                          ),
                        )
                    ],
                  )
                );

              })
            ),

            SizedBox(height: 10),

            Expanded(
              child: selectedIndex == 0 || selectedIndex == 2
                ? showGridView()
                : Center(child: Text(items[selectedIndex], style: TextStyle(fontSize: 20)))
            )
          ],
        ),
      ),
    );
  }

  Widget showGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(20),
      itemCount: 9,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8
      ), 
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey.shade400,        
        );
      }
    );
  }
}