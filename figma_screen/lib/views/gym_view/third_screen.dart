import 'package:figma_screen/views/hotel_view/hotel_one_screen.dart';
import 'package:figma_screen/views/profile_view/profile_screen.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 16, top: 15),
          child: Text('Challenges', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: Container(
                height: 40, width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Icon(Icons.account_circle_outlined, size: 28),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          
                          // Outer circle
                          Transform.rotate(
                            angle: 4.0,
                            child: SizedBox(
                              width: 270, height: 270,
                              child: CircularProgressIndicator(
                                value: 0.9, strokeWidth: 8,
                                valueColor: AlwaysStoppedAnimation(Colors.black),
                              ),
                            ),
                          ),
          
                          Transform.rotate(
                            angle: 2.57,
                            child: SizedBox(
                              width: 200, height: 200,
                              child: CircularProgressIndicator(
                                value: 0.9, strokeWidth: 5,
                                valueColor: AlwaysStoppedAnimation(Colors.black),
                              ),                
                            ),
                          ),
          
                          Transform.rotate(
                            angle: 2.20,
                            child: SizedBox(
                              width: 150, height: 150,
                              child: CircularProgressIndicator(
                                value: 0.9, strokeWidth: 3,
                                valueColor: AlwaysStoppedAnimation(Colors.black),
                              ),
                            ),
                          ),
          
                          InkWell(
                            onTap: () { 
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HotelOneScreen()));
                            },
                            child: Container(
                              height: 100,width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                                boxShadow: [
                                  BoxShadow(color: Colors.black26, blurRadius: 8, spreadRadius: 2)
                                ]
                              ),
                              child: Center(
                                child: Text('HotelScreen', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                              ),
                            ),
                          ),
                        ],
                      ),
                    
                    ),
                  ),
                      
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 16),
                  child: Text('Group tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
          
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey.shade300,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
          
                                SizedBox(
                                  height: 40,
                                  child: Stack(
                                    children: [
                                      Positioned(left: 5, child: CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI='))),
                                      Positioned(left: 25, child: CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI='))),
                                      Positioned(left: 45, child: CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI='))),
                                      Positioned(left: 65, child: CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI='))),
                                    ],
                                  ),
                                ),
          
                                Text('Boxing in central park gym', textAlign: TextAlign.center),
          
                                SizedBox(height: 3),
          
                                Container(
                                  height: 35, width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Detail', style: TextStyle(color: Colors.white)),
                                      SizedBox(width: 5),
                                      Icon(Icons.arrow_right_outlined, color: Colors.white,)
                                    ],
                                  ),
                                )                         
                               ]
                            ),
                          ),                      
                        ),
                      );
                    }
                  ),
                )
              ],
            
          ),
        ),
      ),
   
    );
  }
}