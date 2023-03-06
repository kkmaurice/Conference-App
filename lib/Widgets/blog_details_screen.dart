import 'package:cached_network_image/cached_network_image.dart';
import 'package:conference/helpers/blog_helper.dart';
import 'package:flutter/material.dart';

import '../helpers/style.dart';

class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({super.key});

  static const routName = '/blog-details';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      //backgroundColor: cardColor,
      appBar: AppBar(
        title: const Text('Blog Detail'),
        elevation: 0,
        backgroundColor: cardColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: blogs[index].image,
              //height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            // Image.network(
            //       blogs[index].image,
            //       //height: 250,
            //       width: double.infinity,
            //     ),
            const SizedBox(
              height: 5,
            ),
            //
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: Text(
                blogs[index].title,
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
                  left: 10, right: 10, bottom: 10, top: 5),
              child: Row(
                children: [
                  Text(
                    blogs[index].date,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 98, 15, 9)),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    '| by ${blogs[index].author}',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                blogs[index].description,
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
