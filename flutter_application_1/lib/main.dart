
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateTime? selectedDate;
  TimeOfDay?selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MY APP")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              child: Text("Select Date"),
              onPressed: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2030),
                );

                if (date != null) {
                  setState(() {
                    selectedDate = date;
                  });
                }
              },
            ),
            Container(height: 10,),
            Text(
              "Selected Date: ${selectedDate?.day}-${selectedDate?.month}-${selectedDate?.year}",
              style: TextStyle(fontSize: 18),
            ),
            Container(height: 30,),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.input,
                );

                if (pickedTime != null) {
                  setState(() {
                    selectedTime = pickedTime;
                  });

                }
            },
            child: Text("Select Time"),
            ),
                        Text(
              "Selected Time: ${selectedTime?.hour}:${selectedTime?.minute}",
              style: TextStyle(fontSize: 18),
            ),

          ],
        ),
      ),
    );
  }
}
