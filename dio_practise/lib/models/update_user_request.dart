class UpdateUserRequest {
  String firstName;
  String email;

   UpdateUserRequest({required this.firstName, required this.email});

   Map<String, dynamic> toJson() {
    return {
      "firstName" : firstName,
      "email" : email
    };
   }
}