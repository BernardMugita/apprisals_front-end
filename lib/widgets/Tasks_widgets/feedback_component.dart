import 'package:flutter/material.dart';

class FeedBackComponent extends StatefulWidget {
  const FeedBackComponent({super.key});

  @override
  State<FeedBackComponent> createState() => _FeedBackComponentState();
}

class _FeedBackComponentState extends State<FeedBackComponent> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _showDialog();
        },
        child: const Text("Feedback"));
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Feedback"),
            content: const TextField(
              decoration: InputDecoration(hintText: "Enter your feedback"),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"))
            ],
          );
        });
  }
}
