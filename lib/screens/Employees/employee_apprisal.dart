import 'dart:convert';

import 'package:employee_insights/services/get_tasks_api.dart';
import 'package:employee_insights/services/storage.dart';
import 'package:employee_insights/widgets/Employee_widgets/task_rating.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmployeeApprisal extends StatefulWidget {
  final Map<String, dynamic> employeeEvaluation;
  const EmployeeApprisal({Key? key, required this.employeeEvaluation})
      : super(key: key);

  @override
  State<EmployeeApprisal> createState() => _EmployeeApprisalState();
}

class _EmployeeApprisalState extends State<EmployeeApprisal> {
  List<Map<String, dynamic>> taskData = [];

  bool isLoading = true;
  bool isDataLoaded = false;
  String fetchText = 'Fetching tasks...';

  String userId = '';

  StorageAccess storage = StorageAccess();
  GetTasksAPI getTasksAPI = GetTasksAPI();

  void updateTaskList(Map<String, dynamic> updatedTask) {
    setState(() {
      // Find the index of the updated task
      final index =
          taskData.indexWhere((task) => task['id'] == updatedTask['id']);

      if (index != -1) {
        // Replace the old task with the updated task
        taskData[index] = updatedTask;
      }
    });
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final userToken = await storage.readSecureData('token');
    final Map<String, dynamic> dataMap = jsonDecode(userToken!);

    userId = dataMap['id'];

    final String token = dataMap['token'];

    try {
      setState(() {
        isLoading = true;
      });
      final tasks = await getTasksAPI.getTasks(token, updateTaskList);

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          isLoading = false;
          taskData = taskData = tasks
              .where((task) =>
                  task['assigned_to']['first_name'] ==
                  widget.employeeEvaluation['first_name'])
              .toList();
        });
      });

      return tasks;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final employeeEvaluation = widget.employeeEvaluation;
    return Scaffold(
        backgroundColor: const Color(0xFFFEF1ED),
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 300,
              margin:
                  const EdgeInsets.only(left: 0, right: 0, top: 40, bottom: 0),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 146, 146, 0),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => {Navigator.pop(context)},
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const Gap(10),
                  const Divider(
                    color: Colors.white,
                  ),
                  const Gap(20),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person_2_outlined,
                      color: Color.fromARGB(255, 146, 146, 0),
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    employeeEvaluation['id'].toString() != userId
                        ? employeeEvaluation['first_name'] +
                            " " +
                            employeeEvaluation['last_name']
                        : "My Appraisal",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    employeeEvaluation['job_role'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.email_outlined,
                          color: Colors.white, size: 20),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(employeeEvaluation['email'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin:
                  const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 1),
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 3))
                  ]),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tasks',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.task_rounded,
                        size: 20,
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey[300]),
                  ),
                  SizedBox(
                      height: 218,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            // loading state
                            isLoading
                                ? Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 30),
                                    child: const Text(
                                      'Fetching tasks...',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                      ),
                                    ))
                                : Column(
                                    children: [
                                      for (var task in taskData)
                                        TaskRating(
                                          taskRating: task,
                                        ),
                                    ],
                                  ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin:
                  const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 1),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 3))
                  ]),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Feedback',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.feedback_rounded,
                        size: 20,
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey[300]),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Philip Ochieng',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Create UI Components',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        'view feedback',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
