import 'package:flutter/material.dart';
import 'package:timetable/splashpage.dart';
import 'package:timetable/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TimeTable",
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) => Splash(),
        '/main' : (BuildContext context) => MainPage()
      },
    );
  }
}
