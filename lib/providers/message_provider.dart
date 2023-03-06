import 'package:flutter/material.dart';

import '../Services/message_service.dart';
import '../models/message.dart';

class MessageProvider with ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages {
    return [..._messages];
  }

  Future<void> addMessage(Message message) async {
    await MessageService.addMesssage(message);
    notifyListeners();
  }

  Future<List<Message>> fetchMessage() async {
    var msg = await MessageService().getMessage();
    //print(msg);
    if (msg is List<Message>) {
      _messages = msg;
    }
    notifyListeners();
    return _messages;
  }

  void removeMessage(Message message) {
    _messages.remove(message);
    notifyListeners();
  }

  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }
}
