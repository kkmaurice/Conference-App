import 'package:conference/Auth/auth_screen.dart';
import 'package:conference/Screens/btm_bar.dart';
import 'package:conference/Screens/home_screen.dart';
import 'package:conference/Screens/innerScreens/contacts_screen.dart';
import 'package:conference/Screens/innerScreens/partners_screen.dart';
import 'package:conference/Screens/innerScreens/speakers_screen.dart';
import 'package:conference/Screens/innerScreens/sponsors_screen.dart';
import 'package:conference/Screens/splash_screen.dart';
import 'package:conference/Widgets/blog_details_screen.dart';
import 'package:conference/Widgets/events_details.dart';
import 'package:conference/Widgets/projects_details.dart';
import 'package:conference/Widgets/speaker_details_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
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
        BottomBarScreen.routeName: (context) => const BottomBarScreen(),
        SponsorsScreen.routeName: (context) => SponsorsScreen(),
        SpeakersScreen.routeName: (context) => const SpeakersScreen(),
        PartnersScreen.routeName: (context) => const PartnersScreen(),
        ContactsScreen.routeName: (context) => const ContactsScreen(),
        AuthScreen.routeName: (context) => const AuthScreen(),
        SpeakerDetailsScreen.routeName: (context) =>
            const SpeakerDetailsScreen(),
        EventsDetails.routName: (context) => const EventsDetails(),
        BlogDetailsScreen.routName: (context) => const BlogDetailsScreen(),
        ProjectDetailsScreen.routName: (context) =>
            const ProjectDetailsScreen(),
        //SplashScreen.routName: (context) => const SplashScreen(),
      },
    );
  }
}
