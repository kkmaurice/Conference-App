import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/consts.dart';
import '../helpers/style.dart';

class SpeakerDetailsScreen extends StatelessWidget {
  const SpeakerDetailsScreen({super.key});
  static const routeName = 'speaker_details_screen';
   
   //final int index;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      //backgroundColor: cardColor,
      appBar: AppBar(
        title: Text(speakers[index].name),
        elevation: 0,
        backgroundColor: cardColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                  speakers[index].image,
                  height: 250,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        speakers[index].name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                   
                          onPressed: () async {
                    var url = speakers[index];
                    if (await canLaunchUrl(Uri.parse(speakers[index].facebook))) {
                      await launchUrl(Uri.parse(speakers[index].facebook));
                    } else {
                      throw 'Could not launch $url';
                    }},
                          icon: const Icon(Icons.facebook_sharp,color: Colors.blue,size: 40,)),
                        // icon: const Icon(Icons.facebook_sharp,color: Colors.blue,size: 40,)),
                      //IconButton(onPressed: (){}, icon: const Icon(Icons.twitter,color: Colors.blue,size: 40,))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    speakers[index].title,
                    style: const TextStyle(
                      fontSize: 17,
                      letterSpacing: 0.2,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 130, 80, 80)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Text(
                       speakers[index].description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 30, 2, 2),
                      ),
                      
                    ),
                    ),
                
            // Image.network(
            //   speakers[index].image,
            //   height: 200,
            //   width: MediaQuery.of(context).size.width,
            // ),
            // const SizedBox(height: 10),
            // Text(speakers[index].name),
            
            // const SizedBox(height: 10),
            // Text(speakers[index].description),
          ],
        ),
      ),);
  }
}