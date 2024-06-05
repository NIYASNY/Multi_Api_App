import 'package:flutter/material.dart';
import 'package:multi_api_app/view/homescreen.dart';


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.teal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CircleAvatar(
                    //   radius: 40,
                    //   backgroundColor: Colors.pink,
                    //   backgroundImage: NetworkImage(
                    //       // ignore: unnecessary_string_interpolations
                    //       // '${FirebaseAuth.instance.currentUser!.photoURL!}'), // Use NetworkImage to fetch the image
                    // ),
                    // const SizedBox(height: 5),
                    // Text(
                    //   '${FirebaseAuth.instance.currentUser!.displayName}',
                    //   style: const TextStyle(
                    //     fontSize: 20,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    const SizedBox(height: 5),
                    // Text(
                    //   '${FirebaseAuth.instance.currentUser!.email}',
                    //   style: const TextStyle(
                    //     fontSize: 15,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () async {
                  // await FirebaseServices().signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  // Get.off( HomePage());
                },
                icon: Icon(Icons.logout),
              ),
              // title: "Logout".text.make(),
            )
          ],
        ),
      ),
    );
  }
}
