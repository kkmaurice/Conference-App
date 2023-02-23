// ignore_for_file: avoid_unnecessary_containers

import 'package:animator/animator.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:conference/Screens/innerScreens/speakers_screen.dart';
import 'package:conference/Screens/innerScreens/sponsors_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:conference/helpers/consts.dart';
import 'package:conference/helpers/style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'innerScreens/contacts_screen.dart';
import 'innerScreens/partners_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //late YoutubePlayerController _ytbPlayerController;

  // String? videoId =
  //     YoutubePlayer.convertUrlToId("https://youtu.be/-w6w3Fw3zxc");

  final YoutubePlayerController _ytbPlayerController = YoutubePlayerController(
    initialVideoId:
        YoutubePlayer.convertUrlToId("https://youtu.be/-w6w3Fw3zxc")!,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  void initState() {
    super.initState();
    fluttertoast();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _ytbPlayerController;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cardColor,
        appBar: AppBar(
          backgroundColor: cardColor,
          elevation: 0,
          title: const Text(
            'UCC 2023',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          leading: Row(
            children: const [
              SizedBox(
                width: 2,
              ),
              Expanded(
                child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/canada.png')),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/ugflag.png')),
              ),
            ],
          ),
          actions: [],
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 220,
              //pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      color: cardColor,
                      height: MediaQuery.of(context).size.height * 0.30,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              events[index],
                              fit: BoxFit.values[2],
                            ),
                          );
                          // return Image.asset(
                          //   events[index],
                          //   fit: BoxFit.fill,
                          // );
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
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: const BoxDecoration(
                  color: cardColor,
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/photo4.jpg'),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 7, right: 7),
                        child: Column(
                          children: const [
                            Text(
                              'Uganda Canada Convention - Ottawa 2023 Edition',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 2,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerWidget(
                    activityName: 'Speakers',
                    icon: Icons.people,
                  ),
                  ContainerWidget(
                    activityName: 'Sponsors',
                    icon: Icons.emoji_people,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerWidget(
                    activityName: 'Partners',
                    icon: Icons.public,
                  ),
                  ContainerWidget(
                    activityName: 'Contacts',
                    icon: Icons.contact_phone,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: _ytbPlayerController != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: YoutubePlayer(
                            controller: _ytbPlayerController,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.blueAccent,
                            progressColors: const ProgressBarColors(
                              playedColor: Colors.blueAccent,
                              handleColor: Colors.blueAccent,
                            ),
                            onReady: () {
                              //_ytbPlayerController.addListener(listener);
                            },
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/images/photo1.png')),
              const HotelContainerWidget(),
              const SizedBox(
                height: 2,
              ),
            ]))
          ],
        ),
      ),
    );
  }

  void fluttertoast() {
    Fluttertoast.showToast(
        msg:
            'Welcome ${FirebaseAuth.instance.currentUser!.email} to the 2023 Conference',
        toastLength: Toast.LENGTH_SHORT,
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
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width,
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
            height: MediaQuery.of(context).size.height * 0.30,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 0.98,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'The Westin Ottawa',
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
                  "With a stay at The Westin Ottawa, you’ll be centrally located in Ottawa, steps from Shaw Centre and within a 10-minute walk of University of Ottawa. This 4-star hotel is 0.4 mi (0.6 km) from By ward Market Square and 0.4 mi (0.7 km) from Parliament Hill.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                // url launcher
                onTap: () async {
                  const url =
                      'https://www.marriott.com/event-reservations/reservation-link.mi?id=1646317918687&key=GRP&app=resvlink';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
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
        curve: Curves.fastLinearToSlowEaseIn,
        tween: Tween<double>(begin: 0.8, end: 1.0),
        builder: (context, animatorState, child) => Transform.scale(
          scale: animatorState.value,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.47,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 18, 187, 193),
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
                  Text(
                    activityName,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              )),
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
