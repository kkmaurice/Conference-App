import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference/models/message.dart';
import 'package:uuid/uuid.dart';

class MessageService {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('messages');

  static Future<void> addMesssage(Message message) async {
    final id = const Uuid().v4();
    await FirebaseFirestore.instance
        .collection('messages')
        .doc(id)
        .set(message.toMap(), SetOptions(merge: true));
  }

  Future getMessage() async {
    final snapshot = await _ref.get();
    return snapshot.docs
        .map((doc) => Message.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
