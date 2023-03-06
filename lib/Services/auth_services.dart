// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:conference/models/user_info_model.dart' as user;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../helpers/consts.dart';

class AuthServices {
  //final UserInfo _userInfo = UserInfo(_data)
  final String userId = const Uuid().v4();
  // sign in with email & password
  Future createNewUser(String email, String password, user.UserInfo info,
      BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => value.user!.updateDisplayName(info.firstName));
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(info.toMap(), SetOptions(merge: true));
    } on FirebaseException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
    // save user info to shared preferences/local storage
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("email", email);
    await sharedPreferences!.setString("password", password);
    //await sharedPreferences!.setString("userId", info.userId);
    await sharedPreferences!.setString("photoUrl", info.photoUrl);
    await sharedPreferences!.setString("firstName", info.firstName);
    await sharedPreferences!.setString("lastName", info.lastName);
    await sharedPreferences!.setString("phoneNumber", info.phoneNumber);
  }

  // sign in with email & password
  Future signInUser(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
              // actions: [
              //   TextButton(
              //       onPressed: () => Navigator.pop(context),
              //       child: const Text('Ok'))
              // ],
            );
          });
    }
  }

  // password reset
  Future passwordReset(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('password reset sent! check your email'),
            );
          });
    } on FirebaseException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  // sign out
  Future signUserOut(BuildContext context) async {
    try {
      return await FirebaseAuth.instance.signOut();
    } on FirebaseException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }
}
