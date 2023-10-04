import 'package:flutter/material.dart';

class TopDecorationAlternate extends StatelessWidget {
  const TopDecorationAlternate({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 100,
            color: Colors.green,
          ),
          Container(
            width: 100,
            color: Colors.greenAccent,
          ),
          Container(
            width: 100,
            color: Colors.lightGreen,
          ),
          Container(
            width: 100,
            color: Colors.lightGreenAccent,
          ),
          Container(
            width: 100,
            color: Colors.yellow,
          ),
          Container(
            width: 100,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
