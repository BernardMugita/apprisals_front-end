import 'package:flutter/material.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.person_2_rounded,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Assigned to:",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Employee name",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.calendar_month_rounded,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Due date:",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "dd/mm/yyyy",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.timer_rounded,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Time remaining:",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "--hrs",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.view_timeline,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Status:",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "assigned",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.category_rounded,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Type:",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Group task",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }
}
