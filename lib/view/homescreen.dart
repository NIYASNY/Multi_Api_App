import 'package:flutter/material.dart';
import 'package:multi_api_app/view/moviescreen.dart';
import 'package:multi_api_app/view/newsscreen.dart';
import 'package:multi_api_app/view/timezonescreen.dart';
import 'package:multi_api_app/view/weatherscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mutli API App"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Weather"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WeatherScreen()));
            },
          ),
          ListTile(
            title: const Text("Movies"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MovieScreen()));
            },
          ),
          ListTile(
            title: const Text("News"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewsScreen()));
            },
          ),
          ListTile(
            title: const Text("TimeZone"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TimeZoneScreen()));
            },
          ),
        ],
      ),
    );
  }
}
