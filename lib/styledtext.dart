import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  final double size;
  final bool color;
  final bool oblique;
  const StyledText({Key? key, required this.text, required this.size, required this.color, required this.oblique}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color ? const Color(0xff00968c) : const Color(0xffffffff),
        fontFamily: oblique ? "Oblique" : "White"
      ),
    );
  }
}

class StatefulText extends StatefulWidget {
  final String text;
  final double size;
  final bool color;
  final bool oblique;
  const StatefulText({Key? key, required this.text, required this.size, required this.color, required this.oblique}) : super(key: key);

  @override
  State<StatefulText> createState() => _StatefulTextState();
}

class _StatefulTextState extends State<StatefulText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          fontSize: widget.size,
          color: widget.color ? const Color(0xff00968c) : const Color(0xffffffff),
          fontFamily: widget.oblique ? "Oblique" : "White"
      ),
    );
  }
}


