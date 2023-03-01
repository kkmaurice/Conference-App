import 'package:flutter/material.dart';

import '../helpers/consts.dart';
import '../helpers/style.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      //color: cardColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: cardColor,
                  ),
                  child: const Center(
                    child: Text('Message from our Founder',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(speakers[0].image),
                        fit: BoxFit.fitHeight),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  speakers[0].name,
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
                    speakers[0].title,
                    style: const TextStyle(
                        fontSize: 17,
                        letterSpacing: 0.2,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 130, 80, 80)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: RichText(
                    text: TextSpan(
                      text: '${speakers[0].description}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 30, 2, 2),
                      ),
                      children: const <TextSpan>[
                        // TextSpan(
                        //   text: 'Read More',
                        //   style: TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.normal,
                        //       color: Colors.blue,
                        //       fontStyle: FontStyle.italic),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
