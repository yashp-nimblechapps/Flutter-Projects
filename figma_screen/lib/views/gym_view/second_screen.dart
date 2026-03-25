import 'package:figma_screen/views/profile_view/profile_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

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
              Text('My goals', style: TextStyle(fontSize: 23,  fontWeight: FontWeight.bold)),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text('June 2021',style: TextStyle(fontSize: 15)),
                  SizedBox(width: 10),
                  Icon(Icons.keyboard_arrow_down_outlined),            
                ],
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white10,
                        child: Text(numbers[index]),
                      ),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Card(
                          color: Colors.grey.shade100,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade300,
                              ),
                              title: Text('Goals #${index+1}'),
                              subtitle: Row(
                                children: [
                                  SizedBox(
                                    width: 65,
                                    child: LinearProgressIndicator(
                                      value:  0.5, minHeight: 5, borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text('50% completed', style: TextStyle(fontSize: 10)),
                                ],
                              ),
                              trailing: Icon(Icons.more_vert),
                            ),
                          ),
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
    );
  }
}
