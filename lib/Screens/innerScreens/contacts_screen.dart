import 'package:conference/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});
  static const routeName = 'contacts_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: cardColor,
          appBar: AppBar(
            title: const Text('Contacts'),
            backgroundColor: cardColor,
            elevation: 0,
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    const url =
                        'ttps://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.ugandacanadaconvention.com%2F&t=Home&quote&ext=1677122169&hash=AeaKr0nQXuCLatkTRVM';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Card(
                    elevation: 5,
                    // circular shape
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      child: Image.asset(
                        'assets/images/faceboook.png',
                        //height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    const url =
                        'https://twitter.com/intent/tweet?text=Home%20https%3A%2F%2Fwww.ugandacanadaconvention.com%2F&related=AddToAny,micropat';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Card(
                    elevation: 5,
                    // circular shape
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      child: Image.asset(
                        'assets/images/twitter.png',
                        //height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://www.youtube.com/@ottawatourism';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Card(
                    elevation: 5,
                    // circular shape
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      child: Image.asset(
                        'assets/images/youtub.png',
                        //height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://www.ugandacanadaconvention.com/';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Card(
                    elevation: 5,
                    // circular shape
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      child: Image.asset(
                        'assets/partners/googl.jpg',
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
