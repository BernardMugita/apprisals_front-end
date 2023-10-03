import 'package:flutter/material.dart';

class TopDecoration extends StatelessWidget {
  const TopDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 100,
            color: Colors.orange,
          ),
          Container(
            width: 100,
            color: Colors.orangeAccent,
          ),
          Container(
            width: 100,
            color: Colors.deepOrangeAccent,
          ),
          Container(
            width: 100,
            color: Colors.deepOrange,
          ),
          Container(
            width: 100,
            color: Colors.orange,
          ),
          Container(
            width: 100,
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}
