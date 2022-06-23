import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<DarkMode>(
      create: (_) => DarkMode(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  TextEditingController u_cont = TextEditingController();
  TextEditingController p_cont = TextEditingController();
  void previouslyLoggedIn(BuildContext context) async {
    final oldData = await SharedPreferences.getInstance();
    String? pwd = await oldData.getString('pwd');
    print(pwd);
  }

  Widget build(BuildContext context) {
    previouslyLoggedIn(context);
    return MaterialApp(
      //Specifies what theme to use when the device is in Dark Mode
      theme: Provider.of<DarkMode>(context).darkMode ? ThemeData.dark() : null,

      home: Scaffold(
        appBar: AppBar(
          title: const Text(
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
            const Text(
              "InstaClone",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),

            /// CHALLENGE 2: Change the look of the text fields and the labels
            /// to match the following image:
            /// https://drive.google.com/file/d/12ilag-VqlyngTnUKoCn9nHHKz1u-X_vk/view?usp=sharing
            ///
            /// You can use widgets like Padding and also customize properties of the below widgets
            const Text("Username"),
            TextFormField(
              controller: u_cont,
              onFieldSubmitted: (String? uid) {
                u_cont.text = uid ?? "";
              },
              cursorColor: Colors.blue,
            ),
            const Text("Password"),
            TextFormField(
              controller: p_cont,
              onFieldSubmitted: (String? pwd) {
                p_cont.text = pwd ?? "";
              },
              cursorColor: Colors.green,
            ),
            ElevatedButton(
              onPressed: () async {
                print("login pressed");
                print(u_cont.text);
                print(p_cont.text);
                final prevLogin = await SharedPreferences.getInstance();
                await prevLogin.setString('uid', u_cont.text);
                await prevLogin.setString('pwd', p_cont.text);
                var x = await prevLogin.getString('pwd');
                print(x);
              },
              child: const Text("LOGIN"),
            ),
            Consumer(
              builder: (context, DarkMode dark, child) => ElevatedButton(
                onPressed: () {
                  dark.darkMode = !dark.darkMode;
                },
                child: const Text("Dark Mode"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
