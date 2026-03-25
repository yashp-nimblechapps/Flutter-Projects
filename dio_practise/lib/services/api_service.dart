import 'package:dio/dio.dart';
import 'package:dio_practise/models/create_user_request.dart';
import 'package:dio_practise/models/dummy_response_model.dart';
import 'package:dio_practise/models/patch_user_request.dart';
import 'package:dio_practise/models/update_user_request.dart';

class ApiService {
   Dio dio = Dio();

  //get
  Future<DummyUsersResponse> getData () async {
    try{
      var response = await dio.get('https://dummyjson.com/users');
      return DummyUsersResponse.fromJson(response.data); //Json Map
      //Take this JSON map and convert it into a Dart object I can use safely

    } catch (e) {
      throw Exception('Failed to fetch data');
    }   
  }

  //post
  Future<CreateUserResponse> createUser(CreateUserRequest request) async {
    try{
      var response = await dio.post('https://dummyjson.com/users/add', 
        data: request.toJson()
      );
      print(response.data);
      return CreateUserResponse.fromJson(response.data);
    }
    catch(e){
      throw Exception('Failed to create user');
    }
  }

  //put
  Future<User> updateUser(int id, UpdateUserRequest request) async {
    try{
      var response = await dio.put('https://dummyjson.com/users/$id',
       data: request.toJson()
      );
      print(response.data);

      return User.fromJson(response.data);
    }
    catch(e){
      throw Exception('Failed to update user');
    }
  }

  //patch
  Future<User> patchUser(int id, PatchUserRequest request) async {
    try{
      var response = await dio.patch('https://dummyjson.com/users/$id',
        data: request.toJson()
      );
     print(response.data);

      return User.fromJson(response.data);
    }
    catch(e){
      throw Exception('Failed to update user');
    }
  }

  //delete
  Future<bool> deleteUser(int id) async {
    try{
      await dio.delete('https://dummyjson.com/users/$id');
      return true;
    }
    catch(e){
      throw Exception('Failed to update user');
    }
  }
}

