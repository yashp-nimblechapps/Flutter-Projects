import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/4.%20FutureProvider/Second%20Example/apiService.dart';
import 'package:riverpod_practise/4.%20FutureProvider/Second%20Example/userRepository.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final userRepositoryProvider = Provider<UserRepository>((ref) =>
  UserRepository(ref.read(apiServiceProvider)));

final userProvider = FutureProvider<List< dynamic>>((ref) async {
  final repo = ref.read(userRepositoryProvider);
  return repo.fetchUsers();
});

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Example of Future Provider'),),
      body: Consumer(
        builder: (context,ref,_) {
          final userAysnc = ref.watch(userProvider);

          return userAysnc.when(
            data: (users) {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Text(users[index]['name']);
                },
              );
            },
            error: (Object error, StackTrace stackTrace) {
              return Center(child: Text("Error: $error"));
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }   
      ),
    );
  }
}