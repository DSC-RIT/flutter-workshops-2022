import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => DarkMode(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkMode>(
      builder: (context, counter, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor:
              counter.darkMode ? Colors.black : Colors.white,
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  Widget build(BuildContext context) {
    var counter = Provider.of<DarkMode>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Consumer<DarkMode>(
          builder: (context, counter, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: TextStyle(
                    color: counter.darkMode ? Colors.white : Colors.grey),
              ),
              Text(
                '${counter.counter}',
                style: TextStyle(
                    fontSize: 30,
                    color: counter.darkMode ? Colors.white : Colors.grey),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
          counter.setDark();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
