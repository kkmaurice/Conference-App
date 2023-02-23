import 'package:conference/helpers/style.dart';
import 'package:flutter/material.dart';

class GalleryDetailsScreen extends StatelessWidget {
  const GalleryDetailsScreen({super.key});
  static const routeName = '/gallery-details';

  @override
  Widget build(BuildContext context) {
    final src = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: cardColor,
      appBar: AppBar(
        //title: const Text('Gallery Details'),
        automaticallyImplyLeading: true,
        backgroundColor: cardColor,
      ),
      body: Center(child: Image.network(src)),
    );
  }
}
