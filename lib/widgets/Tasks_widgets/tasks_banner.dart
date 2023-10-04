import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TasksBanner extends StatefulWidget {
  const TasksBanner({super.key});

  @override
  State<TasksBanner> createState() => _TasksBannerState();
}

class _TasksBannerState extends State<TasksBanner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          margin:
              const EdgeInsets.only(left: 10, top: 10, bottom: 0, right: 10),
          width: double.infinity,
          height: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0), topRight: Radius.circular(0)),
            image: DecorationImage(
              image: AssetImage('assets/images/tasks.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Semi-Transparent Overlay
        Container(
          margin:
              const EdgeInsets.only(left: 10, top: 10, bottom: 0, right: 10),
          width: double.infinity,
          height: 150,
          decoration: const BoxDecoration(
              color: Color.fromARGB(195, 126, 69, 0),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(
                      0))), // Change the color and opacity as needed
        ),
        const Positioned(
          top: 30,
          left: 40,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.task_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                Gap(10),
                Text(
                  "Tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Gap(40),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tasks",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        "View tasks assigned to you; search using keywords below to locate a specific task.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        )
      ],
    );
  }
}
