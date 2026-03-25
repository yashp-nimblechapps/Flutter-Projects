import 'package:flutter/material.dart';
import 'package:mvvm_architecture/app_store/app_store.dart';
import 'package:mvvm_architecture/model/repository/repsository.dart';
import 'package:mvvm_architecture/routes/name_routes.dart';
import 'package:mvvm_architecture/utils/common_toast.dart';

class LoginProvider with ChangeNotifier {
  final _appRepository = AppRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> userLogin(dynamic data, BuildContext context) async {
    setLoading(true);
    _appRepository.userLogin(data).then((value) {

      if(value['accessToken'] == null) {
        commonToast("Something went wrong");
      } else {
        Navigator.pushNamed(context, RouteName.homeScreen);
      }

      print(value['accessToken']);

      AppStore().setUserToken(value['accessToken']);
      setLoading(false);

    }).onError((error, stackTrace){
      commonToast("Something went wrong");
      print(error);
      setLoading(false);
      
    });
  }
}