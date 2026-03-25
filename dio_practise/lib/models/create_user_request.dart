class CreateUserRequest {
  String firstName;
  String email;

  CreateUserRequest({required this.firstName, required this.email,});

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'email': email,
    };
  }
}
/*{
  "firstName": "ABC",
  "email": "abc.com"
}*/

class CreateUserResponse {
  int? id;
  String? firstName;
  String? email;

  CreateUserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    email = json['email'];
  }
}