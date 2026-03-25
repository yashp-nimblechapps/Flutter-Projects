import 'package:figma_screen/views/profile_view/profile_screen.dart';
import 'package:flutter/material.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {

  final List days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 16, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mon, Jun 24th, 2021', style: TextStyle(fontSize: 13)),
              Text('Daily activity', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
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
        padding: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(6),
                      child: Container(
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(days[index], style: TextStyle(fontWeight: FontWeight.w400)),
                            Text('${20+index}', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
          
              SizedBox(height: 20),
          
              Text('Jogging', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          
              SizedBox(height: 10),
          
              Container(
                height: 120, width: 400,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_sharp, color: Colors.white,),
                        Text('7.50', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Km', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.timer_outlined, color: Colors.white,),
                        Text('1.2', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Hours', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.run_circle_outlined, color: Colors.white,),
                        Text('5.20', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Speed', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: 30),
          
              Text('Health status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
          
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade300
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.favorite_outline_sharp, size: 28),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text('100 ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  Text('bpm', style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: CustomPaint(
                                  painter: SmoothLinePainter(),
                                ),                            
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                
                    SizedBox(width: 17),
               
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey.shade300
                              ),
                              child: Center(
                                child: ListTile(
                                  title: Text('12000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                  subtitle: Text('Steps', style: TextStyle(fontSize: 12)),
                                  trailing: Icon(Icons.bar_chart, size: 50,),
                                ),
                              ),
                            ),
                          ),
                          
                          SizedBox(height: 17),
                                    
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey.shade300
                              ),
                              child: Center(
                                child: ListTile(
                                  title: Text('520', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                  subtitle: Text('Calories', style: TextStyle(fontSize: 12)),
                                  trailing: Transform.rotate(
                                    angle: 1.80,
                                    child: SizedBox(
                                      height: 48, width: 48,
                                      child: CircularProgressIndicator(
                                        value: 0.9, strokeWidth: 2, backgroundColor: Colors.white, color: Colors.black
                                      ),
                                    ),
                                  )
                                ),
                              ),
                             ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )                     
            ],                      
          ),
        ),
      ),
    );
  }
}

class SmoothLinePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 2
    .. style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(0, size.height * 0.7);

    path.quadraticBezierTo(size.width * 0.15, size.height * 0.6, size.width * 0.3, size.height * 0.65);
    path.quadraticBezierTo(size.width * 0.45, size.height * 0.7, size.width * 0.6, size.height * 0.55);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.45, size.width * 0.9, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.95, size.height * 0.60, size.width * 1.1, size.height * 0.1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

