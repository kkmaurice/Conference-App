import 'package:cached_network_image/cached_network_image.dart';
import 'package:conference/helpers/projects.dart';
import 'package:flutter/material.dart';

import '../helpers/style.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({super.key});
  static const routName = '/project-details';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      //backgroundColor: cardColor,
      appBar: AppBar(
        title: const Text('Project Details'),
        elevation: 0,
        backgroundColor: cardColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: projects[index].image,
              //height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            // Image.network(
            //   projects[index].image,
            //   //height: 250,
            //   width: double.infinity,
            // ),
            const SizedBox(
              height: 5,
            ),
            //
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: Text(
                projects[index].name,
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
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                projects[index].description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 30, 2, 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
