// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';

import 'package:conference/Screens/btm_bar.dart';
import 'package:conference/helpers/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<SplashScreen> {
  splashScreenTimer() {
    return Timer(const Duration(seconds: 5), () {
      // 4 seconds later, after the splash screen, user will be redirected to home screen
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
      } else // user is not logged in
      {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AuthScreen()));
      }
    });
  }

  String _timeOfDay() {
    var now = DateTime.now();
    if (now.hour < 12) {
      return 'Good Morning';
    } else if (now.hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
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
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(
                  'assets/images/photo4.jpg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ))),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Uganda Canada Convention - Ottawa 2023',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              FirebaseAuth.instance.currentUser != null
                  ? "${_timeOfDay()}, ${FirebaseAuth.instance.currentUser!.displayName} :)"
                  : "${_timeOfDay()} :)",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          const Text('Powered by Afrosoft IT Technologies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 2.0,
          ),
          Image.asset(
            'assets/images/afro.jpeg',
            height: 50,
            width: 100,
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      )),
    );
  }
}
