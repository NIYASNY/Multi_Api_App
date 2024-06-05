// import 'package:flutter/material.dart';
// import 'package:multi_api_app/view/moviescreen.dart';
// import 'package:multi_api_app/view/newsscreen.dart';
// import 'package:multi_api_app/view/timezonescreen.dart';
// import 'package:multi_api_app/view/weatherscreen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mutli API App"),
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             title: const Text("Weather"),
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const WeatherScreen()));
//             },
//           ),
//           ListTile(
//             title: const Text("Movies"),
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const MovieScreen()));
//             },
//           ),
//           ListTile(
//             title: const Text("News"),
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const NewsScreen()));
//             },
//           ),
//           ListTile(
//             title: const Text("TimeZone"),
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const TimeZoneScreen()));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }



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
        title: const Text("Multi API App"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.cyanAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListTile(
                  tileColor: Colors.white.withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const Center(child: Text("Weather")),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WeatherScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListTile(
                  tileColor: Colors.white.withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const Center(child: Text("Movies")),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MovieScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListTile(
                  tileColor: Colors.white.withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const Center(child: Text("News")),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewsScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListTile(
                  tileColor: Colors.white.withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const Center(child: Text("TimeZone")),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TimeZoneScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

