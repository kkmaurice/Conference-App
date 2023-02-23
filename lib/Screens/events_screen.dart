// ignore_for_file: sized_box_for_whitespace

import 'package:conference/Widgets/events_details.dart';
import 'package:conference/helpers/consts.dart';
import 'package:conference/helpers/events_helper.dart';
import 'package:flutter/material.dart';
import '../helpers/style.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cardColor,
        appBar: AppBar(
          title: const Text('Events'),
          backgroundColor: cardColor,
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: eventItems.length,
              itemBuilder: (context, index) {
                return EventsWidget(index: index);
              }),
        ));
  }
}

class EventsWidget extends StatelessWidget {
  EventsWidget({
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
            EventsDetails.routName,
            arguments: index,
          );
        },
        child: Card(
            elevation: 5,
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    eventItems[index].image,
                    //height: 250,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    eventItems[index].title,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    eventItems[index].date,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 179, 39, 29)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 5),
                  child: Row(
                    children: [
                      Text(
                        'Fee:',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        eventItems[index].fee,
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.place,
                        color: Colors.blue.shade800,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        eventItems[index].location,
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade500),
                      )
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 10),
                      child: Text(
                        'view details',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue.shade600,
                            fontStyle: FontStyle.italic),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
