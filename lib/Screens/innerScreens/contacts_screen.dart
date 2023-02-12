import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});
  static const routeName = 'contacts_screen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Contacts Screen')
      )
    );
  }
}