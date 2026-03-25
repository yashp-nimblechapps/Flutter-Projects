import 'package:dio_practise/models/create_user_request.dart';
import 'package:dio_practise/models/dummy_response_model.dart';
import 'package:dio_practise/models/patch_user_request.dart';
import 'package:dio_practise/models/update_user_request.dart';
import 'package:dio_practise/services/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  DummyUsersResponse dummyUsersResponse = DummyUsersResponse();
  ApiService apiService = ApiService();
  
  @override
  void initState(){
    super.initState();
    getData2();
  }

  Future<void> getData2() async {
    try{
      final data = await apiService.getData();
      setState(() {
        dummyUsersResponse = data;
      });
    }
    catch(e){
      print(e);
    }
  }

void createUser() async {
  try{
    final request = CreateUserRequest(
      firstName: 'ABC', 
      email: 'abc.com'
    );
    final response = await apiService.createUser(request);

    print('User created with id: ${response.id}');
    print('User created with id: ${response.firstName}');
    print('User created with id: ${response.email}');
  }
  catch(e){
    print(e);
  }
}

void updateUser() async {
  try{
    final request = UpdateUserRequest(
      firstName: 'updated name',
      email: 'updated.com'
    );
    final user = await apiService.updateUser(1, request);

    print('User updated');
    print('User updated with id: ${user.id}');
    print('User updated with id: ${user.firstName}');
    print('User created with id: ${user.email}');
  }
  catch(e){
    print(e);
  }
}

void patchUser() async {
  try{
    final request = PatchUserRequest(
      email: 'patch.com'
    );
    final user = await apiService.patchUser(1, request);

    print('User updated');
    print('User updated with id: ${user.id}');
    print('User updated : ${user.firstName}');
    print('User created : ${user.email}');
  }
  catch(e){
    print(e);
  }
}

void deleteUser(int id) async {
  try{
    final result = await apiService.deleteUser(id);

    if(result){
      print('User deleted successfully');
      print('User deleted: $id');
    }
  }
  catch(e){
    print(e);
  }
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('API'),
      ),
      body: dummyUsersResponse.users == null
      ? Center(child:  Text('no data'))
      : ListView.builder(
        itemCount: dummyUsersResponse.users!.length,
        itemBuilder: (context, index){

          final user = dummyUsersResponse.users![index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.image ?? '') ,
            ),
            title: Text('${user.firstName}, ${user.lastName}'),
            subtitle: Text(user.email ?? ''),
            trailing: IconButton(
              onPressed: () {
                deleteUser(user.id!);

            }, icon: Icon(Icons.delete, color: Colors.red,)),
          );
        },
      ),

     // floatingActionButton: FloatingActionButton(
       // onPressed: deleteUser(), 
      //  child: Icon(Icons.add),
    
    );
  }
}