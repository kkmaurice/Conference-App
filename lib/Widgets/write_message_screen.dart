// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference/Screens/innerScreens/chat_main_page.dart';
import 'package:conference/helpers/style.dart';
import 'package:conference/models/message.dart';
import 'package:conference/providers/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'ucc_community_chart.dart';

class WriteMessage extends StatefulWidget {
  const WriteMessage({super.key});
  static const routeName = '/writeMessage';

  @override
  State<WriteMessage> createState() => _WriteMessageState();
}

class _WriteMessageState extends State<WriteMessage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write Message'),
        centerTitle: true,
        backgroundColor: cardColor,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          const SizedBox(height: 20),
          const Text(
            'Write Something to UCC Community',
            style: TextStyle(
                fontSize: 20,
                //fontFamily: "SF Pro Display",
                color: Colors.black),
          ),
          const SizedBox(height: 20),
          // textfield for title
          TextField(
            controller: _titleController,
            cursorColor: Colors.grey,
            style: const TextStyle(fontSize: 20, fontFamily: "SF Pro Display"),
            onChanged: (value) {
              _titleController.text = value;
              _titleController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _titleController.text.length));
            },
            decoration: const InputDecoration(
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              focusColor: Colors.grey,
              hintText: "Enter Your Name",
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              labelText: 'Name',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _locationController,
            cursorColor: Colors.grey,
            style: const TextStyle(fontSize: 20, fontFamily: "SF Pro Display"),
            onChanged: (value) {
              _locationController.text = value;
              _locationController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _locationController.text.length));
            },
            decoration: const InputDecoration(
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              focusColor: Colors.grey,
              hintText: "Enter Your Location",
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              labelText: 'Location',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
              controller: _messageController,
              cursorColor: Colors.grey,
              style:
                  const TextStyle(fontSize: 20, fontFamily: "SF Pro Display"),
              onChanged: (value) {
                _messageController.text = value;
                _messageController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _messageController.text.length));
              },
              decoration: const InputDecoration(
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                focusColor: Colors.grey,
                hintText: "Enter Your Message",
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                // write text in the textfield from the front
                labelText: 'Message',
              ),
              maxLines: 5),
          const SizedBox(height: 20),
          // button to submit the message
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cardColor,
                  ),
                  margin: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await context.read<MessageProvider>().addMessage(Message(
                          message: _messageController.text,
                          location: _locationController.text,
                          name: _titleController.text,
                          time: Timestamp.now(),
                          uid: const Uuid().v4()));
                      _locationController.clear();
                      _messageController.clear();
                      _titleController.clear();
                      await EasyLoading.showSuccess('Message Sent');
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.of(context).pushNamed(ChatMainPage.routeName);
                    },
                    child: const Text('Submit', style: TextStyle(fontSize: 20)),
                  ),
                )
        ]),
      )),
    );
  }
}
