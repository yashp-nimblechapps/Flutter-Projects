import 'package:flutter/material.dart';
import 'package:mvvm_architecture/model/models/user_list.dart';
import 'package:mvvm_architecture/model/repository/repsository.dart';
import 'package:mvvm_architecture/model/services/api_response.dart';
import 'package:mvvm_architecture/utils/common_toast.dart';


//ViewModel for HomeScreen

class UserListProvider with ChangeNotifier {

    final _appRepository = AppRepository();

    ApiResponse<UserList> userList = ApiResponse.loading();

    void setUserList(ApiResponse<UserList> response) {
        userList = response;
        notifyListeners();
    }

    Future<void> fetchUserList() async {
      setUserList(ApiResponse.loading());

      try{
        final value = await _appRepository.userList();
        setUserList(ApiResponse.complete(value));

      } catch (error) {
        commonToast("Something went wrong");
        setUserList(ApiResponse.error(error.toString()));
      }

    /*
      _appRepository.userList().then((value) {
        setUserList(ApiResponse.complete(value));

      }).onError((error, stackTrace) {
          commonToast("Something went wrong");
          setUserList(ApiResponse.error(error.toString()));
          print(error);
      });
    */

    }
}