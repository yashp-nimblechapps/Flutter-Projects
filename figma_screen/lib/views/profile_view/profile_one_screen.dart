import 'package:flutter/material.dart';

class ProfileOneScreen extends StatelessWidget {
  const ProfileOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileHeader(context),

            SizedBox(height: 10),
            Center(
              child: Text(
                'John Doe',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            Center(child: Text('Designer', style: TextStyle(fontSize: 15))),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 35),
                  ), //width, height
                  child: Text('ADD FRIEND',style: TextStyle(color: Colors.black),
                  ),
                ),

                SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(120, 35),
                  ),
                  child: Text('FOLLOW', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'ABOUT',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This is a John Doe Profile Page, This is a John Doe Profile Page, This is a John Doe Profile Page',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),

                  SizedBox(height: 30),
                  Text('PHOTOS',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey,),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 360, child: showGridView()),

                  SizedBox(height: 30),
                  Text(
                    'VIDEOS',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey,),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Text('VIDEOS', style: TextStyle(fontSize: 20)),
                    ),
                  ),

                  SizedBox(height: 30),
                  Text(
                    'POST',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey,),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 360, child: showGridView()),

                  SizedBox(height: 30),
                  Text(
                    'FRIENDS',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey,),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Text('FRIENDS', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showGridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(3),
      itemCount: 9,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Container(color: Colors.grey.shade400);
      },
    );
  }

  Widget profileHeader(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 180, width: double.infinity, color: Colors.grey.shade300,
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,), 
                      onPressed: () => Navigator.pop(context)
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 105, child: CircleAvatar(radius: 70, backgroundColor: Colors.grey.shade600,),
          ),
        ],
      ),
    );
  }
}
