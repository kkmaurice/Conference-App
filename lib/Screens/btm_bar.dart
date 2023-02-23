// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers
import 'package:conference/Screens/Blog_screen.dart';
import 'package:conference/Screens/projects_screen.dart';
import 'package:conference/Screens/events_screen.dart';
import 'package:conference/Screens/more_screen.dart';
import 'package:conference/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'home_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  static const routeName = '/bottom-bar';

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Home Screen'},
    {'page': const EventsScreen(), 'title': 'Events Screen'},
    {'page': const ProjectsScreen(), 'title': 'Projects Screen'},
    {'page': const BlogScreen(), 'title': 'Chat Screen'},
    {'page': const MoreScreen(), 'title': 'More Screen'},
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPage,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          backgroundColor: cardColor,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(IconlyBold.activity), label: 'Events'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shelves), label: 'Projects'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Blog'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More')
          ]),
    );
  }
}
