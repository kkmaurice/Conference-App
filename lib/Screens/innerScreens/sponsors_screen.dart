import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/style.dart';

class SponsorsScreen extends StatelessWidget {
  SponsorsScreen({super.key});
  static const routeName = 'sponsors_screen';

  List<Map<String, dynamic>> sponsors = [
    {
      'name': 'UCC',
      'image': 'assets/partners/ucc.jpeg',
      'url': 'https://ucc.com/',
    },
    {
      'name': 'NSSF',
      'image': 'assets/partners/nssf.jpeg',
      'url': 'https://www.nssfug.org/',
    },
    {
      'name': 'bbs',
      'image': 'assets/images/bbs.png',
      'url': 'https://afrosoftug.com/',
    },
    {
      'name': 'Afrosoft',
      'image': 'assets/images/afro.jpeg',
      'url': 'https://afrosoftug.com/',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cardColor,
        appBar: AppBar(
          title: const Text('Our Sponsors'),
          centerTitle: true,
          backgroundColor: cardColor,
          elevation: 0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              //childAspectRatio: 1.5,
              childAspectRatio: 1.2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: sponsors.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(sponsors[index]['name']),
                            content: Image.asset(sponsors[index]['image']),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Close')),
                              TextButton(
                                  onPressed: () async {
                                    var url = sponsors[index]['url'];
                                    if (await canLaunchUrl(Uri.parse(url))) {
                                      await launchUrl(Uri.parse(url));
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: const Text('Visit')),
                            ],
                          ));
                },
                child: Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        sponsors[index]['image'],
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        sponsors[index]['name'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
