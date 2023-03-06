import 'package:conference/Auth/auth_screen.dart';
import 'package:conference/Screens/btm_bar.dart';
import 'package:conference/Screens/home_screen.dart';
import 'package:conference/Screens/innerScreens/ask_us.dart';
import 'package:conference/Screens/innerScreens/contacts_screen.dart';
import 'package:conference/Screens/innerScreens/gallery.dart';
import 'package:conference/Screens/innerScreens/partners_screen.dart';
import 'package:conference/Screens/innerScreens/pdf_ucc.dart';
import 'package:conference/Screens/innerScreens/speakers_screen.dart';
import 'package:conference/Screens/innerScreens/sponsors_screen.dart';
import 'package:conference/Screens/innerScreens/tour_guide_registration.dart';
import 'package:conference/Screens/splash_screen.dart';
import 'package:conference/Widgets/blog_details_screen.dart';
import 'package:conference/Widgets/events_details.dart';
import 'package:conference/Widgets/projects_details.dart';
import 'package:conference/Widgets/speaker_details_screen.dart';
import 'package:conference/Widgets/write_message_screen.dart';
import 'package:conference/helpers/consts.dart';
import 'package:conference/providers/message_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'Screens/innerScreens/chat_main_page.dart';
import 'Screens/innerScreens/tour_details_screen.dart';
import 'Widgets/gallery_details.dart';
import 'Widgets/ucc_community_chart.dart';
import 'firebase_options.dart';
import 'providers/tour_guide_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TourGuideProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MessageProvider(),
        ),
      ],
      //create: (context) => TourGuideProvider(),
      child: MaterialApp(
        title: 'UCC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        builder: EasyLoading.init(),
        routes: {
          HomeScreen.routName: (context) => const HomeScreen(),
          BottomBarScreen.routeName: (context) => const BottomBarScreen(),
          SponsorsScreen.routeName: (context) => SponsorsScreen(),
          SpeakersScreen.routeName: (context) => const SpeakersScreen(),
          PartnersScreen.routeName: (context) => const PartnersScreen(),
          ContactsScreen.routeName: (context) => const ContactsScreen(),
          AuthScreen.routeName: (context) => const AuthScreen(),
          PdfUcc.routeName: (context) => const PdfUcc(),
          SpeakerDetailsScreen.routeName: (context) =>
              const SpeakerDetailsScreen(),
          EventsDetails.routName: (context) => const EventsDetails(),
          BlogDetailsScreen.routName: (context) => const BlogDetailsScreen(),
          ProjectDetailsScreen.routName: (context) =>
              const ProjectDetailsScreen(),
          GalleryScreen.routeName: (context) => const GalleryScreen(),
          GalleryDetailsScreen.routeName: (context) => GalleryDetailsScreen(),
          TourGuideRegistration.routeName: (context) =>
              const TourGuideRegistration(),
          TourDetailsScreen.routName: (context) => const TourDetailsScreen(),
          ChatMainPage.routeName: (context) => const ChatMainPage(),
          WriteMessage.routeName: (context) => const WriteMessage(),
          UccCommunityChat.routeName: (context) => const UccCommunityChat(),
          AskUs.routeName: (context) => const AskUs(),
        },
      ),
    );
  }
}
