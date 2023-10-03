import 'package:flutter/material.dart';

class TaskComponent extends StatefulWidget {
  const TaskComponent({super.key});

  @override
  State<TaskComponent> createState() => _TaskComponentState();
}

class _TaskComponentState extends State<TaskComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      margin: const EdgeInsets.only(bottom: 1, left: 10, right: 10, top: 1),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.task_alt_rounded, color: Colors.grey[600]),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "TaskID",
                    style: TextStyle(color: Colors.grey[600], fontSize: 10),
                  )
                ],
              ),
              const Text(
                "Closed",
                style: TextStyle(color: Colors.green, fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Create UI Components",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                  child: Text("Description: lorem ipsum and alot more...",
                      style: TextStyle(fontSize: 10, color: Colors.grey[600]))),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Assigned to",
                    style: TextStyle(color: Colors.grey, fontSize: 11),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Due date",
                    style: TextStyle(color: Colors.grey, fontSize: 11),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "dd/mm/yy",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              SizedBox(
                child: GestureDetector(
                  child: const Text(
                    "View details",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.deepOrange,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed,
                        decorationThickness: 2),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/singletask');
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
