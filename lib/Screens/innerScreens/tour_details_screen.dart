// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conference/Screens/btm_bar.dart';
import 'package:conference/helpers/style.dart';
import 'package:conference/models/tour_guide.dart';
import 'package:conference/providers/tour_guide_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TourDetailsScreen extends StatelessWidget {
  const TourDetailsScreen({super.key});
  static const routName = '/tourDetailsScreen';

  @override
  Widget build(BuildContext context) {
    final guides = context.watch<TourGuideProvider>();
    return Scaffold(
      body: FutureBuilder(
        future: guides.fetchTourGuides(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: guides.tourGuides.length,
              itemBuilder: (context, index) {
                return cardGuideWidget(
                  guides: guides,
                  index: index,
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text('No Tour Guides'),
            );
          }
        },
      ),
    );
  }
}

class cardGuideWidget extends StatelessWidget {
  const cardGuideWidget({
    Key? key,
    required this.guides,
    required this.index,
  }) : super(key: key);

  final TourGuideProvider guides;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CardFb2(guides: guides.tourGuides[index]);
  }
}

class CardFb2 extends StatelessWidget {
  //final Function() onPressed;
  final TourGuide guides;

  const CardFb2(
      {required this.guides,

      //required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 7, right: 7, top: 4, bottom: 8),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.20,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(12.5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(10, 20),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.05)),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 55,
                        height: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                              guides.phoneNumber.startsWith('+1')
                                  ? 'assets/gallery/canada.png'
                                  : guides.phoneNumber.startsWith('+256')
                                      ? 'assets/images/ugflag.png'
                                      : 'assets/images/photo3.png',
                              height: 30,
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //Divider(),
                      Container(
                        width: 70,
                        child: Text(
                            guides.phoneNumber.startsWith('+1')
                                ? 'Canada'
                                : guides.phoneNumber.startsWith('+256')
                                    ? 'Uganda'
                                    : 'Other',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  // const VerticalDivider(
                  //   color: Colors.white,
                  //   thickness: 2,
                  //   width: 10,
                  // ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                  'assets/images/account_profile.jpeg'),
                            ),
                            //Image.network(, height: 59, fit: BoxFit.cover),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('${guides.firstName} ${guides.lastName}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.email,
                              color: Colors.white60,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              guides.email,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.white,
                thickness: 1,
                //height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        //To remove the keyboard when button is pressed
                        FocusManager.instance.primaryFocus?.unfocus();

                        var whatsappUrl = Uri.parse(
                            "whatsapp://send?phone=${guides.phoneNumber}");
                        try {
                          launchUrl(whatsappUrl);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Unable to open whatsapp"),
                            ),
                          );
                        }
                      },
                      child: Column(
                        children: const [
                          Icon(
                            Icons.chat,
                            color: Colors.white60,
                            size: 20,
                          ),
                          Text('Chat',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                //fontStyle: FontStyle.italic,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final Uri launchUri = Uri(
                          scheme: 'mailto',
                          path: guides.email,
                        );
                        await launchUrl(launchUri);
                      },
                      child: Column(
                        children: const [
                          Icon(
                            Icons.email,
                            color: Colors.white60,
                            size: 20,
                          ),
                          Text('Email',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                //fontStyle: FontStyle.italic,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final Uri launchUri = Uri(
                          scheme: 'tel',
                          path: guides.phoneNumber,
                          //path: guides.phoneNumber.replaceAll('+', ''),
                        );
                        await launchUrl(launchUri);
                      },
                      child: Column(
                        children: const [
                          Icon(
                            Icons.phone,
                            color: Colors.white60,
                            size: 20,
                          ),
                          Text('Call',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                //fontStyle: FontStyle.italic,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
