import 'package:flutter/material.dart';
import 'package:mvvm_architecture/app_store/app_store.dart';
import 'package:mvvm_architecture/model/services/api_response.dart';
import 'package:mvvm_architecture/routes/name_routes.dart';
import 'package:mvvm_architecture/utils/app_colors.dart';
import 'package:mvvm_architecture/view_model/user_list_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  UserListProvider userListProvider = UserListProvider();

  @override
  void initState() {
    userListProvider.fetchUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        title: Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {
              AppStore().removeToken();
              Navigator.pushReplacementNamed(context, RouteName.loginScreen,
                arguments: {"title" : "Login"}
              );
            }, 
            icon: Icon(Icons.logout, color: whiteColor,)
          )
        ],
      ),

      body: ChangeNotifierProvider(
        create: (BuildContext context) => userListProvider,

        child: Consumer<UserListProvider>(builder: (context, value, _) {

          switch(value.userList.status) {

            case Status.loading:
              return Center(child: CircularProgressIndicator(color: primaryColor,));

            case Status.error:  
              return Center(child: Text(value.userList.message.toString()),);

            case Status.complete:
              final usersList = value.userList.data;

              if (usersList == null || usersList.users == null || usersList.users!.isEmpty) {
                return Center(child: Text("No users found"));
              }

            final users = usersList.users;

              return ListView.builder(
                itemCount: users!.length,
                itemBuilder: (context, index) {
                  final data = users[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: primaryColor,
                        foregroundColor: whiteColor,
                        child: Text(data.id.toString()),
                      ),
                      title: Text(data.firstName.toString()),
                      subtitle: Text(data.email.toString()),
                    ),
                  );
                });

            default:  
          }
          return SizedBox();
      }),),
    );
  }
}