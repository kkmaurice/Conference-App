// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables
// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:conference/Widgets/write_message_screen.dart';
import 'package:conference/helpers/style.dart';
import 'package:conference/models/message.dart';
import 'package:conference/providers/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UccCommunityChat extends StatefulWidget {
  const UccCommunityChat({super.key});

  static const routeName = '/ucc-community-chat';

  @override
  State<UccCommunityChat> createState() => _UccCommunityChatState();
}

class _UccCommunityChatState extends State<UccCommunityChat> {
  @override
  Widget build(BuildContext context) {
    final message = context.watch<MessageProvider>().messages;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: context.read<MessageProvider>().fetchMessage(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: message.length,
                itemBuilder: (context, index) {
                  return messageCard(
                    message: message,
                    index: index,
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
              ));
            } else {
              return const Center(child: Text('No Message'));
            }
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.edit_note, size: 35),
            onPressed: () {
              Navigator.pushNamed(context, WriteMessage.routeName);
            },
            label: const Text('Write Message', style: TextStyle(fontSize: 20))),
      ),
    );
  }
}

class messageCard extends StatelessWidget {
  messageCard({
    Key? key,
    required this.message,
    required this.index,
  }) : super(key: key);
  final index;
  final List<Message> message;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: cardColor,
        child: Column(
          children: [
            ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/photo4.jpg'),
                ),
                title: Text(
                  message[index].name,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Posted on: ${DateFormat('dd MMMM, yyyy - hh:mm aa').format(message[index].time.toDate())}',
                  style: const TextStyle(fontSize: 15, color: Colors.white54),
                  // trailing: Text(message[index].location),
                )),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 10),
                child: Text(
                  message[index].location,
                  style: const TextStyle(fontSize: 15, color: Colors.white54),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 10),
              child: Text(
                message[index].message,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 15, color: Colors.white70),
              ),
            ),
          ],
        ));
  }
}
