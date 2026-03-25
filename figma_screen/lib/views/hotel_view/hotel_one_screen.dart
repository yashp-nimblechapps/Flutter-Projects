import 'package:figma_screen/views/hotel_view/hotel_detail_screen.dart';
import 'package:flutter/material.dart';

class HotelOneScreen extends StatefulWidget {
  const HotelOneScreen({super.key});

  @override
  State<HotelOneScreen> createState() => _HotelOneScreenState();
}

class _HotelOneScreenState extends State<HotelOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text('Hey, Joe Doe'),
                Text(
                  'Hungry today?',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 45,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300,
                        boxShadow: [
                          BoxShadow(color: Colors.black87, blurRadius: 1),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.search),
                          SizedBox(width: 15),
                          Text('Search ...'),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade300,
                        boxShadow: [
                          BoxShadow(color: Colors.black87, blurRadius: 1),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.filter_list),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                SizedBox(
                  height: 75,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade400,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.fastfood_rounded),
                              Text('Food', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Open restaurants',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),

                topPart(),
                topPart(),
                topPart(),
                topPart(),
                topPart(),
                topPart(),
                topPart(),
                topPart(),
                topPart(),
                topPart(),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topPart() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HotelDetailScreen()),
              );
            },
            child: Column(
              children: [

                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://media.istockphoto.com/id/529664572/photo/fruit-background.jpg?s=612x612&w=0&k=20&c=K7V0rVCGj8tvluXDqxJgu0AdMKF8axP0A15P-8Ksh3I=',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black.withValues(alpha: 0.65),
                          ),
                          child: Center(
                            child: Text(
                              '20 - 30 min',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black.withValues(alpha: 0.65),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.star, color: Colors.white),
                              Text('4.80', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 12),         
                SizedBox(height: 100, child: bottomPart()),
              ],
            ),
          ),
          
        ],
      ),
    );
  }

  Widget bottomPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "John Doe's vegan place",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Icon(Icons.fire_truck_outlined),
            SizedBox(width: 10),
            Text('Free delivery'),
          ],
        ),
        SizedBox(height: 5),

        Row(
          children: [
            Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade300,
              ),
              child: Center(child: Text('vegan')),
            ),
            SizedBox(width: 10),
            Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade300,
              ),
              child: Center(child: Text('breakfast')),
            ),
            SizedBox(width: 10),
            Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade300,
              ),
              child: Center(child: Text('lunch')),
            ),
            SizedBox(width: 10),
            Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade300,
              ),
              child: Center(child: Text('healthy')),
            ),
          ],
        ),
      ],
    );
  }
}
