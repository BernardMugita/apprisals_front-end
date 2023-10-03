import 'package:employee_insights/widgets/task_component.dart';
import 'package:employee_insights/widgets/top_decoration.dart';
import 'package:flutter/material.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
            child: Column(
          children: [
            // const SizedBox(
            //   height: 40,
            // ),
            const TopDecoration(),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.task_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                      Text(
                        "Tasks",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.search_outlined,
                        size: 16,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              shape: const CircleBorder()),
                          onPressed: () {
                            Navigator.pushNamed(context, '/createtask');
                          },
                          child: const Icon(
                            Icons.add,
                            size: 16,
                          ))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(color: Colors.grey[700], fontSize: 10),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(color: Colors.grey[700], fontSize: 10),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const SingleChildScrollView(
              child: Column(
                children: [
                  TaskComponent(),
                  TaskComponent(),
                  TaskComponent(),
                  TaskComponent(),
                  TaskComponent(),
                  TaskComponent(),
                ],
              ),
            ),
          ],
        )));
  }
}
