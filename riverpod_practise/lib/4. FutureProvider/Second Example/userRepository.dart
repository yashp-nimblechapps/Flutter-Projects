import 'package:riverpod_practise/4.%20FutureProvider/Second%20Example/apiService.dart';

class UserRepository {
  late final ApiService apiService;
  
  UserRepository(this.apiService);

  Future<List<dynamic>> fetchUsers() async {
    return await apiService.getUsers();
  }
}