import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecentTasks extends StatefulWidget {
  const RecentTasks({super.key});

  @override
  State<RecentTasks> createState() => _RecentTasksState();
}

class _RecentTasksState extends State<RecentTasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Gap(15),
              Text(
                "Ongoing Tasks",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ],
          ),
          const Gap(10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.deepOrange[200],
                borderRadius: BorderRadius.circular(15)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(188, 76, 175, 79),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "In progress",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )
                ],
              ),
              const Gap(10),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Create UI Components",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Progress",
                    style: TextStyle(color: Colors.white),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Container(
                        height: 3,
                        width: 120,
                        color: Colors.black,
                      ),
                      Container(
                        height: 3,
                        width: 120,
                        color: Colors.grey[300],
                      ),
                      const Gap(10),
                      const Text(
                        "50%",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              const Gap(20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepOrangeAccent,
                        child: Icon(
                          Icons.person_2_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.comment,
                            color: Colors.white,
                          ),
                          SizedBox(
                            child: Text("5",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.attach_file_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            child: Text("3",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.hourglass_top_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            child: Text("7 days",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
