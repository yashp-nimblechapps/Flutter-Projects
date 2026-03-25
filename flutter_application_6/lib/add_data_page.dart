import 'package:flutter/material.dart';
import 'package:flutter_application_6/list_map_provider.dart';
import 'package:provider/provider.dart';

class AddDataPage extends StatelessWidget{
  const AddDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            context.read<ListMapProvider>().addData({
            "name" : "Contact Name",
            "mobNo" : "1234567890",           
          });
          }, 
          icon: Icon(Icons.add)
        ),
      ),
    );
  }
}