import 'package:conference/Screens/innerScreens/tour_details_screen.dart';
import 'package:flutter/material.dart';

import '../../Widgets/ucc_community_chart.dart';
import '../../helpers/style.dart';
import '../btm_bar.dart';

class ChatMainPage extends StatefulWidget {
  const ChatMainPage({super.key});
  static const routeName = 'chat_main_page';

  @override
  State<ChatMainPage> createState() => _ChatMainPageState();
}

class _ChatMainPageState extends State<ChatMainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              backgroundColor: primaryColor,
              automaticallyImplyLeading: false,
              title: const Text(
                'Chat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(BottomBarScreen.routeName);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              flexibleSpace: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    color: cardColor,
                  )),
              centerTitle: true,
              elevation: 0.0,
              bottom: const TabBar(
                indicatorColor: Colors.white,
                indicatorPadding: EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                indicatorWeight: 7.0,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.person,
                      size: 27,
                    ),
                    text: 'Chat With Guides',
                  ),
                  Tab(
                    icon: Icon(Icons.people, size: 27),
                    text: 'UCC Community',
                  ),
                ],
              ),
            ),
            body: const TabBarView(children: [
              //const Pdf(),
              TourDetailsScreen(),
              //const GalleryScreen(),
              UccCommunityChat()
            ]),
          ),
        ));
  }
}
