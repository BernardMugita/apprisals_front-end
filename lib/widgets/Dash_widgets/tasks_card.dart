import 'package:flutter/material.dart';

class TasksCard extends StatefulWidget {
  const TasksCard({super.key});

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('assets/images/tasks.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Semi-Transparent Overlay
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(195, 126, 69, 0),
            borderRadius: BorderRadius.circular(15),
          ), // Change the color and opacity as needed
        ),
        const Positioned(
          top: 30,
          left: 55,
          child: Column(
            children: [
              Text(
                "Tasks",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                child: Icon(
                  Icons.task_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
