import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TourGuide {
  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String password;
  String photoUrl;
  String location;
  TourGuide({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.photoUrl,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'photoUrl': photoUrl,
      'location': location,
    };
  }

  factory TourGuide.fromMap(Map<String, dynamic> map) {
    return TourGuide(
      id: map['id'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      password: map['password'] as String,
      photoUrl: map['photoUrl'] as String,
      location: map['location'] as String,
    );
  }

  @override
  String toString() {
    return 'TourGuide(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, password: $password, photoUrl: $photoUrl, location: $location)';
  }
}
