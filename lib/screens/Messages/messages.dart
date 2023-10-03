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
        body: Column(children: [
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
                      Icons.message_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Messages',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
                          child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, '/single_message'),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.deepOrange,
                                    child: Icon(Icons.person_2_outlined,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Philip Ochieng',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                          child: Text(
                                              "Some text message summary...",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[600])))
                                    ],
                                  ),
                                  const Spacer(),
                                  Text('12:00',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))
                                ],
                              )),
                        ),
                      ],
                    ),
                  )))
        ]));
  }
}
