import 'package:conference/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnersScreen extends StatefulWidget {
   const PartnersScreen({super.key});
  static const routeName = 'partners_screen';

  @override
  State<PartnersScreen> createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  List<Map<String, dynamic>> partners = [
    {
      'name': 'NSSF',
      'image': 'assets/partners/nssf.jpeg',
      'url': 'https://www.nssfug.org/',
    },
    {
      'name': 'UCC',
      'image': 'assets/partners/ucc.jpeg',
      'url': 'https://www.ucc.co.ug/',
    },
    {
      'name': 'Google',
      'image': 'assets/partners/googl.jpg',
      'url': 'https://www.google.com/',
    },
    {
      'name': 'Microsoft',
      'image': 'assets/partners/microsoft.jpg',
      'url': 'https://www.microsoft.com/',
    },
    {
      'name': 'Apple',
      'image': 'assets/partners/apple.jpg',
      'url': 'https://www.apple.com/',
    },
    {
      'name': 'Facebook',
      'image': 'assets/partners/facebook.jpg',
      'url': 'https://www.facebook.com/',
    },
    {
      'name': 'LinkedIn',
      'image': 'assets/partners/linkedin.jpg',
      'url': 'https://www.linkedin.com/',
    },
    {
      'name': 'Amazon',
      'image': 'assets/partners/amazon.jpg',
      'url': 'https://www.amazon.com/',
    },
    {
      'name': 'Netflix',
      'image': 'assets/partners/netflix.jpg',
      'url': 'https://www.netflix.com/',
    },
    {
      'name': 'Spotify',
      'image': 'assets/partners/spotify.jpg',
      'url': 'https://www.spotify.com/',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      appBar: AppBar(
        title: const Text('Our Partners'),
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
          itemCount: partners.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: Text(partners[index]['name']),
                      content: Image.asset(partners[index]['image']),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(), 
                          child: const Text('Close')
                        ),
                        TextButton(
                          onPressed: () async {
                            var url = partners[index]['url'];
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                          }, 
                          child:  Text('Visit ${partners[index]['name']}')
                        ),
                      ],
                    )
                  );
                },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      partners[index]['image'],
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      partners[index]['name'],
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
      )
    );
  }
}