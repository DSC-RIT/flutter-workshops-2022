/// This file contains the screen that was showcased at the end of Day 1.
///
/// It renders a simple Scaffold with a few Text fields and a button.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Specifies what theme to use when the device is in Dark Mode
      darkTheme: ThemeData.dark(),

      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login Screen",
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// CHALLENGE 1: Replace the text below with an Instagram Logo
            /// https://www.pngkey.com/png/full/828-8286178_mackeys-work-needs-no-elaborate-presentation-or-distracting.png
            ///
            /// Search for how to use Image in Flutter
            Text(
              "InstaClone",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),

            /// CHALLENGE 2: Change the look of the text fields and the labels
            /// to match the following image:
            /// https://drive.google.com/file/d/12ilag-VqlyngTnUKoCn9nHHKz1u-X_vk/view?usp=sharing
            ///
            /// You can use widgets like Padding and also customize properties of the below widgets
            Text("Username"),
            TextFormField(
              cursorColor: Colors.blue,
            ),
            Text("Password"),
            TextFormField(
              cursorColor: Colors.green,
            ),
            ElevatedButton(
              onPressed: () {
                print("login pressed");
              },
              child: Text("LOGIN"),
            )
          ],
        ),
      ),
    );
  }
}
