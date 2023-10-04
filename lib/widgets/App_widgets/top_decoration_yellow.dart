import 'package:flutter/material.dart';

class TopDecorationYellow extends StatelessWidget {
  const TopDecorationYellow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 100,
            color: Colors.yellow,
          ),
          Container(
            width: 100,
            color: Colors.yellowAccent,
          ),
          Container(
            width: 100,
            color: Colors.lime,
          ),
          Container(
            width: 100,
            color: Colors.limeAccent,
          ),
          Container(
            width: 100,
            color: Colors.green,
          ),
          Container(
            width: 100,
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
