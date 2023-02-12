// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:conference/models/user_info_model.dart' as user;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AuthServices{
  //final UserInfo _userInfo = UserInfo(_data)
  final String userId = const Uuid().v4();
  // sign in with email & password
  Future createNewUser(String email, String password, user.UserInfo info, BuildContext context) async {
    try {
     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) => value.user!.updateDisplayName(info.firstName));
     FirebaseFirestore.instance.collection('users').doc(userId).set(info.toMap(), SetOptions(merge: true));
    } on FirebaseException catch(e){
      showDialog(context: context, 
      builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  // sign in with email & password
  Future signInUser(BuildContext context, String email, String password) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e) {
       return showDialog(
        context: context, 
        builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });  
    }
  }
  
  // password reset
  Future passwordReset(BuildContext context, String email) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showDialog(context: context, 
      builder: (context){
        return const AlertDialog(
          content: Text('password reset sent! check your email'),
        );
      });
    } on FirebaseException catch(e){
      showDialog(context: context, 
      builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  // sign out
  Future signOut(BuildContext context) async {
    try {
      return await FirebaseAuth.instance.signOut();
    } on FirebaseException catch(e){
      showDialog(context: context, 
      builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }
}