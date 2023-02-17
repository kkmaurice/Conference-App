// ignore_for_file: sized_box_for_whitespace

import 'package:conference/helpers/style.dart';
import 'package:conference/models/speakers.dart';
import 'package:flutter/material.dart';

import '../../Widgets/speaker_details_screen.dart';
import '../../helpers/consts.dart';

class SpeakersScreen extends StatelessWidget {
  const SpeakersScreen({super.key});
  static const routeName = 'speakers_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      appBar: AppBar(
        title: const Text('Key Speakers'),
        backgroundColor: cardColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: speakers.length,
            itemBuilder: (context, index) {
              return SpeakerWidget(index: index);
            }
         
          ),
      )
    );
  }
}


class SpeakerWidget extends StatelessWidget {
   SpeakerWidget({
    super.key,
    required this.index,
  });
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            SpeakerDetailsScreen.routeName,
            arguments: index,
          );
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  speakers[index].image,
                  //height: 250,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                speakers[index].name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
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
                child: RichText(
                  text: TextSpan(
                    text: '${speakers[index].description.substring(0, 150)}... ',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 30, 2, 2),
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Read More',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ],
                  ),
                  ),
              )
            ],
          )
        ),
      ),
    );
  }
}