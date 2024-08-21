import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: _filledCircleWithPercentage(70),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enjoy your day, Ann',
                              style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Today's plan",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.favorite, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _dateCircle('12', 'Mon', false),
                    _dateCircle('13', 'Tue', false),
                    _dateCircle('14', 'Wed', true),
                    _dateCircle('15', 'Thu', false),
                    _dateCircle('16', 'Fri', false),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      _buildCard(
                        'Breathing \nExercise',
                        '2 min',
                        'assets/images/breathing.png', // Replace with your image path
                      ),
                      _buildCard(
                        'Yoga Class',
                        '15 min',
                        'assets/images/yoga.jpg', // Replace with your image path
                      ),
                      _buildCard(
                        'Guided \nMeditation',
                        '30 min',
                        'assets/images/meditation.jpeg', // Replace with your image path
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dateCircle(String day, String weekDay, bool isSelected) {
    return Stack(
      children: [
        Container(
          width: 60,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white38, width: 2),
            color: isSelected ? const Color(0xFF7F3DFF) : Colors.transparent,
          ),
        ),
        Positioned(
          top: 15,
          left: 20,
          child: Text(
            day,
            style: GoogleFonts.poppins(
              color: isSelected ? Colors.white : Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: Text(
            weekDay,
            style: GoogleFonts.poppins(
              color: isSelected ? Colors.white : Colors.white70,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(String title, String time, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF26265F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 35),
              Text(
                time,
                style: GoogleFonts.poppins(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(width: 50),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              width: 130,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

/// A widget that displays a filled circle with a percentage.
///
/// [percentage] is the percentage to be displayed.
Widget _filledCircleWithPercentage(double percentage) {
  return CircularPercentIndicator(
    radius: 35.0, // Adjust the size
    lineWidth: 8.0, // Adjust the thickness of the circle
    percent: percentage / 100, // Convert percentage to a value between 0 and 1
    center: Text(
      "${percentage.round()}%",
      style: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    circularStrokeCap: CircularStrokeCap.round, // Rounded ends
    backgroundColor: Colors.purple[900]!, // Background color of the circle
    progressColor: Colors.purpleAccent, // Foreground color of the circle
  );
}
