import 'package:figma_screen/views/profile_view/profile_screen.dart';
import 'package:flutter/material.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 16, top: 15),
          child: Text(
            'Workouts',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                color: Colors.grey.shade300,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text('Workout name #1',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,),),
                  ),
                  SizedBox(width: 50),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 460,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),                     
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [

                            Positioned.fill(
                              child: Image.network(
                                'https://images.pexels.com/photos/260352/pexels-photo-260352.jpeg?cs=srgb&dl=pexels-pixabay-260352.jpg&fm=jpg',
                                fit: BoxFit.cover,                             
                              )                
                            ),
                        
                            Positioned(
                              bottom: 0, left: 0, right: 0,
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.65),
                                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),                               
                                ),
                                                     
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 10),
                                    Text( 'Upper body work out',
                                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800, color: Colors.white),
                                    ),
                                    Text('15 min',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.white),
                                    ),                              
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
