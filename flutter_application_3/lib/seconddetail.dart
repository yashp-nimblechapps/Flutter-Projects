import 'package:flutter/material.dart';

class SecondDetailPage extends StatelessWidget {

  final Map<String, dynamic> item;

  const SecondDetailPage({super.key, required this.item});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['title']),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            item['image'],
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Text(item['title'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          Text(item['count'], style: TextStyle(fontSize: 20,))
        ],
      )
    );
  }
}