import 'package:flutter/material.dart';
import 'package:flutter_application_3/detail_page.dart';
import 'package:flutter_application_3/seconddetail.dart';
import 'package:flutter_application_3/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomeState();
}

class MyHomeState extends State<MyHomePage> {
  int selectedTab = 0;

  var allItems = [                
    {"name": "Product Name", "price": "999", "info": "Other info", "image": "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=600"},
    {"name": "Product Name", "price": "999", "info": "Other info", "image": "https://www.bigfootdigital.co.uk/wp-content/uploads/2020/07/image-optimisation-scaled.jpg"},
    {"name": "Product Name", "price": "999", "info": "Other info", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDMVQwrZ8vNKR524Sc48IssLPFFGUjqPporw&s"},
    {"name": "Product Name", "price": "999", "info": "Other info", "image": "https://img.freepik.com/free-photo/view-new-york-downtown-usa-rockefeller-center-facade-made-empire-style_1268-19567.jpg?semt=ais_hybrid&w=740&q=80"},
    {"name": "Product Name", "price": "999", "info": "Other info", "image": "https://tinypng.com/static/images/boat.png"},
    {"name": "Product Name", "price": "999", "info": "Other info", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1fWaoLfFtT-_KF5jPJ4sehcBZYjrh-fbkXw&s"},
    {"name": "Product Name", "price": "999", "info": "Other info", "image": "https://www.carpro.com/hs-fs/hubfs/2023-Chevrolet-Corvette-Z06-credit-chevrolet.jpeg?width=1020&name=2023-Chevrolet-Corvette-Z06-credit-chevrolet.jpeg"},
    {"name": "Product Name", "price": "999", "info": "Other info", "image": "https://i.pinimg.com/564x/b5/d3/c3/b5d3c31d61cc4e62d0f22f7472b95a05.jpg"},  
  ];

  var boards = [
    {"title": "Going out-out", "count": "23 items", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDMVQwrZ8vNKR524Sc48IssLPFFGUjqPporw&s"},
    {"title": "Going out-out", "count": "23 items", "image": "https://www.carpro.com/hs-fs/hubfs/2023-Chevrolet-Corvette-Z06-credit-chevrolet.jpeg?width=1020&name=2023-Chevrolet-Corvette-Z06-credit-chevrolet.jpeg"},
    {"title": "Going out-out", "count": "23 items", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1fWaoLfFtT-_KF5jPJ4sehcBZYjrh-fbkXw&s"},
    {"title": "Going out-out", "count": "23 items", "image": "https://tinypng.com/static/images/boat.png"},
    {"title": "Going out-out", "count": "23 items", "image": "https://img.freepik.com/free-photo/view-new-york-downtown-usa-rockefeller-center-facade-made-empire-style_1268-19567.jpg?semt=ais_hybrid&w=740&q=80"},
    {"title": "Going out-out", "count": "23 items", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDMVQwrZ8vNKR524Sc48IssLPFFGUjqPporw&s"},
    {"title": "Going out-out", "count": "23 items", "image": "https://www.bigfootdigital.co.uk/wp-content/uploads/2020/07/image-optimisation-scaled.jpg"},
    {"title": "Going out-out", "count": "23 items", "image": "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=600"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Wish List', style: TextStyle(fontSize: 25, fontWeight:  FontWeight.bold),))),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedTab = 0;
                    });
                  },
                  child: Text('All Items',style: TextStyle(
                      fontSize: 18,
                      fontWeight: selectedTab == 0 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedTab = 1;
                    });
                  },
                  child: Text('Board',style: TextStyle(
                      fontSize: 18,
                      fontWeight: selectedTab == 1 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(child: selectedTab == 0 ? allItemsList() : boardList()),
          ],
        ),
      ),
    );
  }
  

  Widget allItemsList() {
    return ListView.builder(
      itemCount: allItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: InkWell(
             onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(item: allItems[index]),
                  ),);
            },
            child:Row(
              children: [
                Hero(
                  tag: allItems[index]['image']!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      allItems[index]['image']!,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allItems[index]['name']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(allItems[index]['price']!),
                    Text(allItems[index]['info']!),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Move to Bag'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget boardList() {
    return ListView.builder(
      itemCount: boards.length,
      itemBuilder: (context, index) {    
        return Padding(
          padding: const EdgeInsets.all(12),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondDetailPage(item: boards[index]),
              ),);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),                  
                  child: Image.network(
                    boards[index]['image']!,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  boards[index]['title']!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(boards[index]['count']!),
              ],
            ),
          ),
        );
      },
    );
  }
}
