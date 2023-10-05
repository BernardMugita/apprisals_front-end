import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FeedBackComponent extends StatefulWidget {
  const FeedBackComponent({super.key});

  @override
  State<FeedBackComponent> createState() => _FeedBackComponentState();
}

class _FeedBackComponentState extends State<FeedBackComponent> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xFF008000)),
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
            contentPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            backgroundColor: const Color(0xFFFEF1ED),
            title: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    )),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Feedback & Ratings",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Icon(Icons.feedback_rounded, color: Colors.white)
                  ],
                )),
            content: Container(
              height: 350,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const TextField(
                      decoration:
                          InputDecoration(hintText: "Enter your feedback"),
                    ),
                    const Gap(20),
                    const Text(
                      "Rate this task",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Gap(10),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text("Accuracy"),
                            const Spacer(),
                            Row(children: [
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_outline,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_outline,
                                color: Colors.deepOrange[200],
                              ),
                            ])
                          ],
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            const Text("Punctuality"),
                            const Spacer(),
                            Row(children: [
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_outline,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_outline,
                                color: Colors.deepOrange[200],
                              ),
                            ])
                          ],
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            const Text("Communication"),
                            const Spacer(),
                            Row(children: [
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_outline,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_outline,
                                color: Colors.deepOrange[200],
                              ),
                            ])
                          ],
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            const Text("Format"),
                            const Spacer(),
                            Row(children: [
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_outline,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_outline,
                                color: Colors.deepOrange[200],
                              ),
                            ])
                          ],
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            const Text("Delivery"),
                            const Spacer(),
                            Row(children: [
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_outline,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_outline,
                                color: Colors.deepOrange[200],
                              ),
                            ])
                          ],
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            const Text("Correctness"),
                            const Spacer(),
                            Row(children: [
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_outline,
                                color: Colors.deepOrange[200],
                              ),
                              Icon(
                                Icons.star_outline,
                                color: Colors.deepOrange[200],
                              ),
                            ])
                          ],
                        ),
                        const Gap(10),
                      ],
                    )
                  ])),
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              foregroundColor: Colors.deepOrange,
                              maximumSize: const Size(150, 50)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Close"))),
                  const Gap(5),
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF008000),
                              foregroundColor: Colors.white,
                              maximumSize: const Size(150, 50)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Submit")))
                ],
              )
            ],
          );
        });
  }
}
