import 'dart:core';

import 'package:mvvm_architecture/model/models/user_list.dart';
import 'package:mvvm_architecture/model/services/network_services.dart';

class AppRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  String baseUrl = "https://dummyjson.com";

  Future<dynamic> userLogin(dynamic data) async {
    var response = await _apiServices.postApi( "$baseUrl/auth/login", data);
  
    try{
      return response;
    } catch (e) {
      print(e.toString());
    }
    
  }

  Future<UserList?> userList() async {
    var response = await _apiServices.getApi("$baseUrl/users");

    try{
      return UserList.fromJson(response);
    } catch (e) {
      print(e.toString());
    }
    return null;
    
  }
}