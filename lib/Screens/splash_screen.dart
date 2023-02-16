// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';

import 'package:conference/Screens/btm_bar.dart';
import 'package:conference/helpers/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Auth/auth_screen.dart';
import 'home_screen.dart';




class SplashScreen extends StatefulWidget {
  const  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<SplashScreen> {

  splashScreenTimer() {
    return Timer(const Duration(seconds: 4), () {
      // 4 seconds later, after the splash screen, user will be redirected to home screen
       //Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthScreen()));
      if(FirebaseAuth.instance.currentUser != null)
      {
        Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
      }
      else // user is not logged in
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthScreen()));
      }
    });
  }

  @override
  void initState() //called automatically when user comes here to this screen
  {
    splashScreenTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(child: Image.asset('assets/images/logo2.png',height: 200,width: 200 ,fit: BoxFit.cover,))),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Unity In Diversity And Moral',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          )
        ),
    );
  }
}