import 'package:flutter/material.dart';

class ProfileTwoScreen extends StatelessWidget {
  const ProfileTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            profileHeader(context),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('John Doe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Designer', style: TextStyle(fontSize: 12))
                    ],
                  ),
                  ElevatedButton(onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, minimumSize: Size(90, 30),             
                    ),
                    child: Text('FOLLOW', style: TextStyle(color: Colors.white))
                  )               
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Column(  
                crossAxisAlignment: CrossAxisAlignment.start,       
                children: [
                  Text('ABOUT', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey)),
                  SizedBox(height: 10),
                  Text('This is a John Doe Profile Page, This is a John Doe Profile Page, This is a John Doe Profile Page,'
                  ' This is a John Doe Profile Page, This is a John Doe Profile Page, This is a John Doe Profile Page'
                  ' This is a John Doe Profile Page, This is a John Doe Profile Page, This is a John Doe Profile Page',
                    style: TextStyle(fontSize: 13)
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, top: 20),
              child: Column(  
                crossAxisAlignment: CrossAxisAlignment.start,       
                children: [
                  Text('FRIENDS', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey)),

                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 30, backgroundColor: Colors.grey.shade400,
                            ),
                          ),
                        );
                      }
                    ),
                  )            
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(  
                crossAxisAlignment: CrossAxisAlignment.start,       
                children: [
                  Text('PHOTOS', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey)),
                  SizedBox(height: 12),
                  SizedBox(height: 360, child: showGridView())              
                ],
              ),
            ),         
          ],
        ),
      )
    );
  }

  Widget showGridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 9,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8
      ), 
      itemBuilder: (context, index) {
        return Container(color: Colors.grey.shade400);
      }
    );
  }

  Widget profileHeader(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () => Navigator.pop(context)
          ),
          SizedBox(height: 5),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
      
              Container(
                height: 60, width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Icon(Icons.account_circle_outlined, size: 40),
              ),       
      
              Column(
                children: [
                  Text('FOLLOWER', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey)),
                  Text('2.3K', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black),)
                ],
              ),
      
              Column(
                children: [
                  Text('FOLLOWING', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey)),
                  Text('898', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black),)
                ],
              ),
      
              Column(
                children: [
                  Text('FRIENDS', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey)),
                  Text('200', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black),)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}