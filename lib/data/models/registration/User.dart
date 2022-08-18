class User {
  late String userId;
  late String firstName;
  late String lastName;
  late String email;
  late String imageUrl;
  late dynamic address;
  late String role;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
    required this.address,
    required this.role,
  });

  User.fromJson(dynamic json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['imageUrl'] = imageUrl;
    map['address'] = address;
    map['role'] = role;
    return map;
  }
}
