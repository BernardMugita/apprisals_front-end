import 'dart:convert';

import 'package:employee_insights/screens/Tasks/edit_task.dart';
import 'package:employee_insights/services/storage.dart';
import 'package:employee_insights/services/task_actions_api.dart';
import 'package:employee_insights/widgets/Tasks_widgets/attachment_component.dart';
import 'package:employee_insights/widgets/Tasks_widgets/feedback_component.dart';
import 'package:employee_insights/widgets/Tasks_widgets/task_details.dart';
import 'package:employee_insights/widgets/Tasks_widgets/todos_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SingleTaskView extends StatefulWidget {
  final Map<String, dynamic> taskDetails;
  const SingleTaskView({Key? key, required this.taskDetails}) : super(key: key);

  @override
  State<SingleTaskView> createState() => _SingleTaskViewState();
}

class _SingleTaskViewState extends State<SingleTaskView> {
  StorageAccess storage = StorageAccess();
  TaskActionsAPI actions = TaskActionsAPI();
  String taskId = '';

  Future<String> markAsDone() async {
    final userToken = await storage.readSecureData('token');
    final Map<String, dynamic> dataMap = jsonDecode(userToken!);

    final String token = dataMap['token'];

    await actions.markTaskAsDone(token, taskId);
    return '';
  }

  Future<String> markAsDisputed() async {
    final userToken = await storage.readSecureData('token');
    final Map<String, dynamic> dataMap = jsonDecode(userToken!);

    final String token = dataMap['token'];

    await actions.markTaskasDisputed(token, taskId);
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.taskDetails;
    taskId = task['id'];

    return Scaffold(
        backgroundColor: const Color(0xFFFEF1ED),
        body: SingleChildScrollView(
          child: Column(children: [
            const Gap(20),
            Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 50, bottom: 10),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.deepOrange[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      const Icon(Icons.reorder, color: Colors.white, size: 16),
                    ],
                  ),
                  const Gap(20),
                  const Divider(color: Colors.white),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditTask(taskId: taskId)));
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.deepOrangeAccent,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TaskID:",
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("00JHGQO",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      const Gap(5),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date Assigned:",
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 10,
                          ),
                          Text("dd/mm/yyyy",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                  const Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Title:",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 200,
                        child: Text(
                          task['title'],
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ])),
            TaskDetails(taskDetails: task),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Task Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.deepOrangeAccent),
                        ),
                        Icon(
                          Icons.bookmark_sharp,
                          color: Colors.deepOrangeAccent,
                          size: 20,
                        )
                      ]),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const Gap(10),
                  SizedBox(
                    width: double.infinity,
                    child: Text(task['description'],
                        // increase line height
                        style: const TextStyle(height: 1.5)),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Container(
                height: 260,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sub-tasks",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 200,
                      child: SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TodosItem(),
                          TodosItem(),
                          TodosItem(),
                          TodosItem(),
                          TodosItem(),
                        ],
                      )),
                    )
                  ],
                )),
            const Gap(10),
            Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Column(children: [
                const Row(
                  children: [
                    Icon(Icons.attachment_outlined),
                    Gap(5),
                    Text(
                      "Attachments",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
                Divider(
                  color: Colors.deepOrangeAccent[200],
                ),
                const Gap(10),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AttachmentComponent(),
                      AttachmentComponent(),
                      AttachmentComponent(),
                      AttachmentComponent(),
                      AttachmentComponent(),
                    ],
                  ),
                ),
              ]),
            ),
            const Gap(20),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.red),
                          onPressed: () {
                            markAsDisputed();
                          },
                          child: const Text(
                            "Dispute",
                            style: TextStyle(fontSize: 14),
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF008000),
                          ),
                          onPressed: () {
                            markAsDone();
                          },
                          child: const Text(
                            "Mark as done",
                            style: TextStyle(fontSize: 14),
                          )))
                ],
              ),
            ),
            const FeedBackComponent(),
          ]),
        ));
  }
}
