// ignore_for_file: avoid_unnecessary_containers

import 'package:animator/animator.dart';
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
            expandedHeight: 220,
            //pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
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
                      duration: int.parse('1000'),
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
            ),
            ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
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
                  ContainerWidget(activityName: 'Speakers', icon: Icons.people,),
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
              //LogoApp(),
              const HotelContainerWidget(),
              const SizedBox(
                height: 2,
              ),
              ]
            )
            )
          ],
        ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Stack(
        //         children: [
        //           SizedBox(
        //             height: MediaQuery.of(context).size.height * 0.30,
        //             child: Swiper(
        //               itemBuilder: (BuildContext context, int index) {
        //                 return Image.asset(
        //                   events[index],
        //                   fit: BoxFit.fill,
        //                 );
        //               },
        //               itemCount: events.length,
        //               autoplay: true,
        //               pagination: const SwiperPagination(
        //                   alignment: Alignment.bottomCenter,
        //                   builder: DotSwiperPaginationBuilder(
        //                       color: Colors.white, activeColor: Colors.red)),
        //               //control: SwiperControl(),
        //             ),
        //           ),
        //           Container(
        //             height: MediaQuery.of(context).size.height * 0.30,
        //             decoration:  BoxDecoration(
        //                color: Colors.black.withOpacity(0.2),
        //             )),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 20, top: 30),
        //             child: SizedBox(
        //               height: MediaQuery.of(context).size.height * 0.25,
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: const [
        //                   Text(
        //                     'Eradicating Poverty\nIn The Northern Region',
        //                     style: TextStyle(
        //                         fontSize: 27,
        //                         color: Colors.white,
        //                         letterSpacing: 3),
        //                   ),
        //                   Text(
        //                     'Saturday, 24, 2023\nSerena Hotel\nKampala, Uganda',
        //                     style: TextStyle(
        //                         fontSize: 15,
        //                         color: Colors.white,
        //                         letterSpacing: 3),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //       Container(
        //         height: MediaQuery.of(context).size.height * 0.15,
        //         decoration: const BoxDecoration(
        //           color: cardColor,
        //         ),
        //         child: Row(
        //           children: [
        //             Image.asset(
        //               'assets/images/logo2.png',
        //               height: 100,
        //             ),
        //             Expanded(
        //               child: Padding(
        //                 padding: const EdgeInsets.only(top: 15),
        //                 child: Column(
        //                   children: [
        //                     const Text(
        //                       'Theme:',
        //                       style: TextStyle(
        //                           fontSize: 20,
        //                           color: Colors.white,
        //                           fontWeight: FontWeight.w800,
        //                           letterSpacing: 2,
        //                           fontStyle: FontStyle.italic),
        //                     ),
        //                     Container(
        //                       child: const Text(
        //                         'Developing a Knowledge and Innovation Eco-System for Sustainable Development.',
        //                         textAlign: TextAlign.center,
        //                         style: TextStyle(
        //                           fontSize: 16,
        //                           color: Colors.white,
        //                           fontWeight: FontWeight.w300,
        //                           letterSpacing: 2,
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 8,
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           ContainerWidget(activityName: 'Speakers', icon: Icons.people,),
        //           ContainerWidget(activityName: 'Sponsors', icon: Icons.emoji_people,),
        //         ],
        //       ),
        //       const SizedBox(
        //         height: 12,
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           ContainerWidget(activityName: 'Partners', icon: Icons.public,),
        //           ContainerWidget(activityName: 'Contacts', icon: Icons.contact_phone,),
        //         ],
        //       ),
        //       const SizedBox(
        //         height: 12,
        //       ),
        //       //LogoApp(),
        //       const HotelContainerWidget()
        //     ],
        //   ),
        // ),
      ),
    );
  }
  void fluttertoast(){
    Fluttertoast.showToast(
        msg: 'Welcome ${FirebaseAuth.instance.currentUser!.email} to the 2023 Conference',
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
      child: Animator<double>(
        duration: const Duration(milliseconds: 1500),
        cycles: 0,
        curve: Curves.easeInOut,
        tween: Tween<double>(begin: 0.8, end: 1.0),
        builder: (context, animatorState, child) => Transform.scale(
          scale: animatorState.value,
          child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.47,
        alignment: Alignment.center,
        decoration:  BoxDecoration(
          color: Color.fromARGB(255, 2, 52, 52),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(0, 3), // changes position of shadow
              blurStyle: BlurStyle.normal,
            ),
          ],
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
        ),
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);

  // Make the Tweens static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}

// class LogoApp extends StatefulWidget {
//   const LogoApp({super.key});

//   @override
//   State<LogoApp> createState() => _LogoAppState();
// }

// class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller =
//         AnimationController(duration: const Duration(seconds: 2), vsync: this);
//     animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           controller.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           controller.forward();
//         }
//       });
//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) => AnimatedLogo(animation: animation);

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
