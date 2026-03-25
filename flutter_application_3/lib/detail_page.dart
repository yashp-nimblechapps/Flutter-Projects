import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{

  final Map<String, dynamic> item;

  const DetailPage({super.key, required this.item});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text(item['name']),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: item['image'], 
                child: Image.network(
                  item['image'],
                  width: double.infinity,       
                  fit: BoxFit.contain
                ),
                ),
                Padding(padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['name'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    
                    SizedBox(height: 10,),
          
                    Text(item['price'], style: TextStyle(fontSize: 22)),
                    
                    SizedBox(height: 10,),
          
                    Text(item['info'], style: TextStyle(fontSize: 18)),
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