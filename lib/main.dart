import 'package:animator/animator.dart';
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
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            child: Animator<double>(
              duration: Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: 0, end: 15),
              cycles: 0,
              builder: (context, animatorState, child) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[400],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red[600].withOpacity(0.5),
                      offset: Offset(0, 5),
                      blurRadius: 40,
                    ),
                  ],
                ),
                margin: EdgeInsets.all(animatorState.value),
                child: Center(
                  child: Container(
                    child: Wrap(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Tap to Turn',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'ON',
                              style: TextStyle(fontSize: 35),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
