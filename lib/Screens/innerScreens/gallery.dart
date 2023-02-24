import 'package:conference/helpers/gallery_helper.dart';
import 'package:conference/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../Widgets/gallery_details.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});
  static const routeName = '/gallery';

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cardColor,
        appBar: AppBar(
          title: const Text('Gallery'),
          centerTitle: true,
          backgroundColor: cardColor,
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 10 / 12,
          ),
          children: imageList
              .map(
                (e) => GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(GalleryDetailsScreen.routeName, arguments: e),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      e,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
        ));
  }
}
