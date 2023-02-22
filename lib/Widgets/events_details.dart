import 'package:conference/helpers/events_helper.dart';
import 'package:flutter/material.dart';

import '../helpers/style.dart';

class EventsDetails extends StatelessWidget {
  const EventsDetails({super.key});
  static const routName = 'events_details';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      //backgroundColor: cardColor,
      appBar: AppBar(
        title: const Text('Event Detail'),
        elevation: 0,
        backgroundColor: cardColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              eventItems[index].image,
              //height: 250,
              width: double.infinity,
            ),
            const SizedBox(
              height: 5,
            ),
            //
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: Text(
                eventItems[index].title,
                style: const TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.place,
                    color: Colors.blue.shade800,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    eventItems[index].location,
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    'Time:',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    eventItems[index].time,
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    'Fee:',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    eventItems[index].fee,
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                eventItems[index].description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 30, 2, 2),
                ),
              ),
            ),
            Column(
              children: eventItems[index]
                  .images
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(e),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
