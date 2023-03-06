// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String message;
  String location;
  String name;
  Timestamp time;
  String uid;
  Message({
    required this.message,
    required this.location,
    required this.name,
    required this.time,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'location': location,
      'name': name,
      'time': time,
      'uid': uid,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      message: map['message'] as String,
      location: map['location'] as String,
      name: map['name'] as String,
      time: map['time'] as Timestamp,
      uid: map['uid'] as String,
    );
  }

  @override
  String toString() {
    return 'Message(message: $message, location: $location, name: $name, time: $time, uid: $uid)';
  }
}
