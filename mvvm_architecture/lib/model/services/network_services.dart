import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm_architecture/model/services/app_exception.dart';

abstract class BaseApiServices {

  Future<dynamic> postApi(String url, dynamic data);

  Future<dynamic> getApi(String url);
}

class NetworkApiServices extends BaseApiServices {

  Map<String, String> get _headers => {
    "Content-Type": "application/json",
  };  
  
  dynamic apiResponse(http.Response response) {

  switch (response.statusCode) {
    case 200:
    case 201:
      return jsonDecode(response.body);

    case 400:
      throw FetchDataException(message: "Bad Request");

    case 401:
      throw UnAuthorizedException(message: "Unauthorized");

    default:
      throw FetchDataException(message: "Error: ${response.statusCode}",);
  }
}

  @override
  Future<dynamic> postApi(String url, data) async {
    dynamic responseJson;

    try {
      http.Response response = await http.post(
        Uri.parse(url), headers: _headers, body: jsonEncode(data));

      responseJson = apiResponse(response);

    } catch (e) {
      print(e.toString());
    }
    return responseJson;
  }

  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;

    try{
      http.Response response = await http.get(
        Uri.parse(url), headers: _headers
      );

      responseJson = apiResponse(response);
      
    } catch (e) {
      print(e.toString());
    }
    return responseJson;
  }
}