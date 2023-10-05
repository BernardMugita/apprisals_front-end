import 'package:employee_insights/widgets/App_widgets/top_decoration.dart';
import 'package:employee_insights/widgets/Tasks_widgets/task_component.dart';
import 'package:employee_insights/widgets/Tasks_widgets/tasks_banner.dart';
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
        backgroundColor: const Color(0xFFFEF1ED),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                // const SizedBox(
                //   height: 40,
                // ),
                const TopDecoration(),
                const TasksBanner(),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1,
                                color:
                                    const Color.fromARGB(255, 255, 192, 109))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[100],
                                radius: 20,
                                child: const Icon(
                                  Icons.search_rounded,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search"),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepOrange,
                                      shape: const CircleBorder()),
                                  child: const Icon(Icons.arrow_circle_right))
                            ]),
                      )),
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
