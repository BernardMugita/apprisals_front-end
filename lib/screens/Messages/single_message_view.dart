import 'package:flutter/material.dart';

class SingleMessageView extends StatefulWidget {
  const SingleMessageView({super.key});

  @override
  State<SingleMessageView> createState() => _SingleMessageViewState();
}

class _SingleMessageViewState extends State<SingleMessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 2),
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Philip Ochieng',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        )),
        Container(
          padding: const EdgeInsets.only(right: 10),
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Type a message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.deepOrange,
                child: IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
