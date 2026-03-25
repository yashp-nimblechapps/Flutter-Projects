import 'package:flutter/material.dart';
import 'package:flutter_application_6/add_data_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_6/list_map_provider.dart';

class ListPage extends StatelessWidget{
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Consumer<ListMapProvider>(
        builder: (ctx, provider, __) {
          var allData = provider.getData();
          return provider.getData().isNotEmpty ? ListView.builder(
           itemCount: allData.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text('${allData[index]['name']}'),
                subtitle: Text('${allData[index]['mobNo']}'), 
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(onPressed: () {
                        context.read<ListMapProvider>().updateData({
                          "name" : "Updated Name",
                          "mobNo" : "9876543210",  
                        }, index);
                      }, icon: Icon(Icons.edit)),
                      
                      IconButton(onPressed: () {
                        context.read<ListMapProvider>().deletData(index);
                      }, icon: Icon(Icons.delete, color: Colors.red,)),
                    ],
                  ),
                ),          
              );
          }) : Center(child: Text('No Contacts'),);
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddDataPage() ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
  
}