// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  String _selectedMoodEmoji = '😊';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: 790,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF642AFC), Color(0xFF2B0C5E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'How Do You Feel Today?',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.yellow
                          .withOpacity(0.15), // Outer transparent circle
                    ),
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.yellow
                          .withOpacity(0.2), // Middle transparent circle
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: const Color.fromARGB(255, 255, 141, 59).withOpacity(0.8), // Inner yellow circle
                      
                        child: Text(
                          _selectedMoodEmoji,
                          style: const TextStyle(fontSize: 82),
                        ),
                      
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _moodIcon('😢', Colors.red, Colors.red.shade100),
                    _moodIcon('😞', Colors.blue, Colors.blue.shade100),
                    _moodIcon('😐', Colors.purple, Colors.purple.shade100),
                    _moodIcon('😊', Colors.green, Colors.green.shade100),
                    _moodIcon('😁', Colors.yellow, Colors.yellow.shade100),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 120),
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Note Mood',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _moodIcon(String emoji, Color color, Color backgroundColor) {
    final bool isSelected = _selectedMoodEmoji == emoji;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMoodEmoji = isSelected ? '' : emoji;
        });
      },
      child: CircleAvatar(
        radius: isSelected ? 40 : 24, // Larger size when selected
        backgroundColor: isSelected ? Colors.deepPurple : Colors.transparent,
        child: Text(
          emoji,
          style: TextStyle(
            fontSize: isSelected ? 50 : 24, // Larger emoji size when selected
            color: color,
          ),
        ),
      ),
    );
  }
}
