import 'package:flutter/material.dart';
import 'package:multi_api_app/view/moviescreen.dart';
import 'package:multi_api_app/view/newsscreen.dart';
import 'package:multi_api_app/view/timezonescreen.dart';
import 'package:multi_api_app/view/weather/weatherscreen.dart';


//homescreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              _buildCard(
                context,
                title: "Weather",
                screen:  WeatherScreen(),
                icon: Icons.wb_sunny,
                iconColor: Colors.orangeAccent,
              ),
              _buildCard(
                context,
                title: "Movies",
                screen: const MovieScreen(),
                icon: Icons.movie,
                iconColor: Colors.redAccent,
              ),
              _buildCard(
                context,
                title: "News",
                screen: const NewsScreen(),
                icon: Icons.article,
                iconColor: Colors.greenAccent,
              ),
              _buildCard(
                context,
                title: "TimeZone",
                screen: const TimeZoneScreen(),
                icon: Icons.access_time,
                iconColor: Colors.purpleAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, {required String title, required Widget screen, required IconData icon, required Color iconColor}) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(icon, color: iconColor, size: 30),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}
