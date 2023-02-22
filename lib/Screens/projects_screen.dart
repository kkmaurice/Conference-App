import 'package:conference/Widgets/projects_details.dart';
import 'package:conference/helpers/projects.dart';
import 'package:flutter/material.dart';

import '../helpers/style.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cardColor,
        appBar: AppBar(
          title: const Text('Projects'),
          backgroundColor: cardColor,
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return EventsWidget(index: index);
              }),
        ));
  }
}

class EventsWidget extends StatelessWidget {
  EventsWidget({
    super.key,
    required this.index,
  });
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProjectDetailsScreen.routName,
            arguments: index,
          );
        },
        child: Card(
            elevation: 5,
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    projects[index].image,
                    //height: 250,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    projects[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: RichText(
                    text: TextSpan(
                      text:
                          '${projects[index].description.substring(0, 150)}... ',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white70,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Read More',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.blue,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
