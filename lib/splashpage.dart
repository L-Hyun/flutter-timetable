import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timetable/styledtext.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
