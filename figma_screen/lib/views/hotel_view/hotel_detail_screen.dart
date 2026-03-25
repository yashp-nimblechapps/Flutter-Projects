import 'package:flutter/material.dart';

class HotelDetailScreen extends StatelessWidget {
  const HotelDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            headerPart(context),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("John Doe's vegan palce",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(width: 10),
                      Text('4.80 (50 reviews)'), 
                      SizedBox(width: 20),
                      Icon(Icons.fire_truck_outlined),
                      SizedBox(width: 10),
                      Text('Free delivery'),
                    ],
                  ),
                  SizedBox(height: 15),

                  Container(
                    height: 50, width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey.shade400
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pin_invoke),
                        SizedBox(width: 10),
                        Text('20% off entire menu'), 
                      ]
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.info_outline, size: 15),
                      SizedBox(width: 10),
                      Text('Restaurant info', style: TextStyle(fontSize: 12),), 
                    ]
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 2),
                  SizedBox(height: 10),

                  Text("Signiture Dishes",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  containerPart(),
                  containerPart(),
                  containerPart(),
                  containerPart(),
                  containerPart(),
                  containerPart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerPart(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: NetworkImage(
              'https://media.istockphoto.com/id/529664572/photo/fruit-background.jpg?s=612x612&w=0&k=20&c=K7V0rVCGj8tvluXDqxJgu0AdMKF8axP0A15P-8Ksh3I=',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 45, bottom: 25, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(radius: 22, backgroundColor: Colors.white, 
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_outlined), 
                      onPressed: () => Navigator.pop(context)
                    ),
                  ),
                  CircleAvatar(radius: 22, backgroundColor: Colors.white, 
                    child: IconButton(icon: Icon(Icons.check_box_outline_blank_outlined), onPressed: () {}),
                  ),   
                ],
              ),
              SizedBox(height: 1),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 40, width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withValues(alpha: 0.65),
                  ),
                  child: Center(child: Text('20 - 30 min', style: TextStyle(color: Colors.white),)),
                ),
              ),

            ],
          ),
          
        ),
      )
    );
  }
  
  Widget containerPart() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.3),
          borderRadius: BorderRadius.circular(2),                                     
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Avo Toast with coffee', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    Text('This is Avo Toast with coffee, This is Avo Toast with coffee, This is Avo Toast with coffee' , style: TextStyle(fontSize: 13)),
                    Text('\$22', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),                     
                  ],
                ),
              ),    
              SizedBox(width: 12),                  
              Icon(Icons.lunch_dining_outlined, size: 60)
            ],
          ),
        ),
      ),
    );
  }
}
