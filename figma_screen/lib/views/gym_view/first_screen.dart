import 'package:figma_screen/views/profile_view/profile_screen.dart';
import 'package:flutter/material.dart';


class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  final List<IconData> icons = [
    Icons.home, Icons.person, Icons.settings, Icons.favorite, Icons.camera_alt,
    Icons.map, Icons.message, Icons.music_note, Icons.phone, Icons.shopping_cart,
  ];

  final List<Map<String, String>> items = [
    {'title': '8 am - 9 am', 'subtitle': 'Running session with Cindy'},
    {'title': '8 am - 9 am', 'subtitle': 'Running session with Cindy'},
    {'title': '8 am - 9 am', 'subtitle': 'Running session with Cindy'},
    {'title': '8 am - 9 am', 'subtitle': 'Running session with Cindy'},
    {'title': '8 am - 9 am', 'subtitle': 'Running session with Cindy'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 16, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Daily', style: TextStyle(fontSize: 23)),
              Text('Workout',style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
        padding: EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.directional(start: 15),
                child: Text('Categories', style: TextStyle(fontSize: 18)),
              ),
          
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: icons.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 2, spreadRadius: 1,)
                          ]                 
                        ),                     
                        padding: EdgeInsets.all(20),
                        child: Icon(icons[index], color: Colors.black),               
                      ),
                    );
                  },
                ),
              ),
          
              SizedBox(height: 10),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 160,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 36, left: 40.0),
                        child: Text(
                          'Running session',
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 40),
                        child: Container(
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.play_arrow),
                              SizedBox(width: 10),
                              Text('30 min'),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text('Join groups', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 10),
          
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 235,
                            height: 150,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index]['title']!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                items[index]['subtitle']!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
