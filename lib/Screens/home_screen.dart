// ignore_for_file: avoid_unnecessary_containers

import 'package:card_swiper/card_swiper.dart';
import 'package:conference/Screens/innerScreens/speakers_screen.dart';
import 'package:conference/Screens/innerScreens/sponsors_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:conference/helpers/consts.dart';
import 'package:conference/helpers/style.dart';
import 'package:url_launcher/url_launcher.dart';

import 'innerScreens/contacts_screen.dart';
import 'innerScreens/partners_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    fluttertoast();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          events[index],
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: events.length,
                      autoplay: true,
                      pagination: const SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                              color: Colors.white, activeColor: Colors.red)),
                      //control: SwiperControl(),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration:  BoxDecoration(
                       color: Colors.black.withOpacity(0.2),
                    )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Eradicating Poverty\nIn The Northern Region',
                            style: TextStyle(
                                fontSize: 27,
                                color: Colors.white,
                                letterSpacing: 3),
                          ),
                          Text(
                            'Saturday, 24, 2023\nSerena Hotel\nKampala, Uganda',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                letterSpacing: 3),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: const BoxDecoration(
                  color: cardColor,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/logo2.png',
                      height: 100,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            const Text(
                              'Theme:',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 2,
                                  fontStyle: FontStyle.italic),
                            ),
                            Container(
                              child: const Text(
                                'Developing a Knowledge and Innovation Eco-System for Sustainable Development.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      //Navigator.of(context).pushNamed('/speakers');
                    },
                    child: ContainerWidget(activityName: 'Speakers', icon: Icons.people,)),
                  ContainerWidget(activityName: 'Sponsors', icon: Icons.emoji_people,),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerWidget(activityName: 'Partners', icon: Icons.public,),
                  ContainerWidget(activityName: 'Contacts', icon: Icons.contact_phone,),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const HotelContainerWidget()
            ],
          ),
        ),
      ),
    );
  }
  void fluttertoast(){
    Fluttertoast.showToast(
        msg: 'Hi ${FirebaseAuth.instance.currentUser!.email} welcome to the 2023 Conference',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

class HotelContainerWidget extends StatelessWidget {
  const HotelContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: 
        [
          Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 0.98,
          decoration: const BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              image: AssetImage('assets/images/hotel.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 0.98,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Serena Hotel',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: const Text(
                  'The Serena Hotel Kampala is a 5-star hotel located in Kampala, Uganda. It is the largest hotel in Uganda and the largest hotel in East Africa.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                // url launcher
                onTap: () async {
                  const url = 'https://www.serenahotels.com/kampala/location-contact';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: const Center(
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
            ],
          
          ),
        ),
      ],
    );
  }
}



class ContainerWidget extends StatelessWidget {
  String activityName;
  IconData icon;
  ContainerWidget({
    Key? key,
    required this.activityName,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (activityName == 'Speakers') {
          Navigator.of(context).pushNamed(SpeakersScreen.routeName);
        } else if (activityName == 'Sponsors') {
          Navigator.of(context).pushNamed(SponsorsScreen.routeName);
        } else if (activityName == 'Partners') {
          Navigator.of(context).pushNamed(PartnersScreen.routeName);
        } else if (activityName == 'Contacts') {
          Navigator.of(context).pushNamed(ContactsScreen.routeName);
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.47,
        alignment: Alignment.center,
        decoration:  BoxDecoration(
          color: Color.fromRGBO(4, 175, 198, 1).withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 27),
            const SizedBox(
              width: 10,
            ),
            Text(activityName, style: const TextStyle(color: Colors.white, fontSize: 20),),
          ],
        )
      ),
    );
  }
}
