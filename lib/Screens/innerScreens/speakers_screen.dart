import 'package:flutter/material.dart';

class SpeakersScreen extends StatelessWidget {
  const SpeakersScreen({super.key});
  static const routeName = 'speakers_screen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Speakers Screen')
      )
    );
  }
}