import 'package:dio/dio.dart';

class ApiService {
  ApiService();  
  final Dio dio = Dio(
    BaseOptions(
      headers: {
        "Accept": "application/json",
      },
    ),
  );

  Future<List<dynamic>> getUsers() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/users');
    return response.data;
  } 
}