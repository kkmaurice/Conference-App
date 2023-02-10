import 'dart:convert';

class UserInfo {
  String userId;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String password;
  UserInfo({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });


  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      userId: map['userId'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) => UserInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, password: $password';
  }
}
