import 'package:flutter/material.dart';

import 'package:flutter_flashlight/flutter_flashlight.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                  child: Text('Turn on'),
                  onPressed: () {
                    Flashlight.lightOn();
                  }),
              ElevatedButton(
                  child: Text('Turn off'),
                  onPressed: () {
                    Flashlight.lightOff();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
