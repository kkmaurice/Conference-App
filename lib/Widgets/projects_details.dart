import 'package:conference/helpers/projects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
            Image.network(
              projects[index].image,
              //height: 250,
              width: double.infinity,
            ),
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
