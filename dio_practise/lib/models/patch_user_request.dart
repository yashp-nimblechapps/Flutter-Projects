class PatchUserRequest {
  String? firstName;
  String? email;

   PatchUserRequest({this.firstName, this.email});

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (firstName != null) data['firstName'] = firstName;
    if (email != null) data['email'] = email;

    return data;
   }
}