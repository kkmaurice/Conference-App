import 'package:conference/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class AskUs extends StatelessWidget {
  const AskUs({super.key});
  static const routeName = 'ask_us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: cardColor,
          title: Text(
            'Ask Us',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hello, Welcome',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'For quick reply, contact Us on the following platforms',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: cardColor,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () async {
                          //To remove the keyboard when button is pressed
                          FocusManager.instance.primaryFocus?.unfocus();

                          var phoneNumber = '+14169461921';
                          var whatsappUrl =
                              Uri.parse("whatsapp://send?phone=${phoneNumber}");
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
                              Icons.call,
                              color: Colors.white60,
                              size: 20,
                            ),
                            Text('WhatsApp',
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
                          var email = 'ugcanadianconvention@gmail.com';
                          final Uri launchUri = Uri(
                            scheme: 'mailto',
                            path: email,
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
                          var phone = '+14169461921';
                          final Uri launchUri = Uri(
                            scheme: 'tel',
                            path: phone,
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
              ),
            ),
          ],
        ));
  }
}
