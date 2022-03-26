import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timetable/styledtext.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), ()=>{
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route)=>false)
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00968c),
      body: Center(
        child: StyledText(
            text: "Time Table",
            oblique: true,
            size: 50,
            color: false,
          ),
      )
    );
  }
}
