class DummyUsersResponse {
  List<User>? users;
  int? total;
  int? skip;
  int? limit;

  DummyUsersResponse({this.users, this.total, this.skip, this.limit});

  DummyUsersResponse.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <User>[];
      json['users'].forEach((v) {
        users!.add(User.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? image;

  User({this.id, this.firstName, this.lastName, this.email, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    image = json['image'];
  }
}


//json['users'] → list from API
//Create empty Dart list
//Loop each user JSON
//Convert each one into User object
//Add to list