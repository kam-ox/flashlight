import 'package:flutter/material.dart';

import 'package:animator/animator.dart';
import 'package:flutter_flashlight/flutter_flashlight.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isOn = false;

  // bool _hasFlashlight = false;
  // initFlashlight() async {
  //   bool hasFlash = await Flashlight.hasFlashlight;
  //   print("Device has flash ? $hasFlash");
  //   setState(() {
  //     _hasFlashlight = hasFlash;
  //   });
  // }

  void controlTorch() {
    if (isOn) {
      Flashlight.lightOn();
      setState(() {
        isOn = !isOn;
      });
      Fluttertoast.showToast(
          msg: "You Turned Flashlight ON",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_LEFT,
          timeInSecForIosWeb: 1,
          textColor: Colors.black,
          fontSize: 14.0);
    } else if (!isOn) {
      Flashlight.lightOff();
      setState(() {
        isOn = !isOn;
      });
      Fluttertoast.showToast(
          msg: "You Turned Flashlight OFF",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_LEFT,
          timeInSecForIosWeb: 1,
          textColor: Colors.black,
          fontSize: 14.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Flashlight',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Teko',
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            child: Animator<double>(
              duration: Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: 0, end: 15),
              cycles: 0,
              builder: (context, animatorState, child) => GestureDetector(
                onTap: () => controlTorch(),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isOn ? Colors.green[400] : Colors.red[400],
                    boxShadow: [
                      BoxShadow(
                        color: isOn
                            ? Colors.green[600].withOpacity(0.5)
                            : Colors.red[600].withOpacity(0.5),
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
                                'Tap To Turn',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                isOn ? 'ON' : 'OFF',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: isOn ? Colors.white : Colors.black,
                                ),
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
      ),
    );
  }
}
