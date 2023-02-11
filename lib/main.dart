
import 'package:conference/Screens/btm_bar.dart';
import 'package:conference/Screens/home_screen.dart';
import 'package:conference/Screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Association App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        HomeScreen.routName: (context) => const HomeScreen(),
        BottomBarScreen.routeName:(context) => const BottomBarScreen()
        //SplashScreen.routName: (context) => const SplashScreen(),
      },
    );
  }
}

