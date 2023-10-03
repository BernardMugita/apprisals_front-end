import 'package:employee_insights/widgets/top_decoration.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const TopDecoration(),
          Container(
            padding: const EdgeInsets.all(15),
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 2),
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ],
                ),
                Row(
                  children: [
                    Text('Messages',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.message,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        // border bottom only
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromARGB(255, 235, 235, 235),
                                width: 1))),
                    child: const Row(children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.deepOrange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Philip Ochieng',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                    ]),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
