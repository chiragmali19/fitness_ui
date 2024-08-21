import 'package:fitness_ui/home_page.dart';
import 'package:fitness_ui/mood_tracker_screen.dart';
import 'package:flutter/material.dart';

class Bottomnvigationbar extends StatefulWidget {
  const Bottomnvigationbar({super.key});

  @override
  State<Bottomnvigationbar> createState() => _BottomnvigationbarState();
}

class _BottomnvigationbarState extends State<Bottomnvigationbar> {
  int indexValue = 0;

  final screens = [
    HomePage(),
    MoodTrackerScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: indexValue,
          onTap: (val) {
            setState(() {
              indexValue = val;
            });
          }, // Selected the Therapy tab by default
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              label: 'Today',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Therapy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
      body: screens[indexValue],
    );
  }
}
