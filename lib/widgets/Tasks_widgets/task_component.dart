import 'package:employee_insights/services/storage.dart';
import 'package:employee_insights/services/task_actions_api.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:employee_insights/screens/Tasks/single_task_view.dart';

class TaskComponent extends StatefulWidget {
  final Function(Map<String, dynamic>) onTaskEdited;
  final Map<String, dynamic> tasks;
  const TaskComponent(
      {Key? key, required this.tasks, required this.onTaskEdited})
      : super(key: key);

  @override
  State<TaskComponent> createState() => _TaskComponentState();
}

class _TaskComponentState extends State<TaskComponent> {
  TaskActionsAPI actions = TaskActionsAPI();
  StorageAccess storage = StorageAccess();

  Future<String> deleteTask() async {
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final taskDetails = widget.tasks;
    final Map<String, dynamic> assignedUser = taskDetails['assigned_to'];
    final editedTask = widget.onTaskEdited;

    return GestureDetector(
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SingleTaskView(
                            taskDetails: taskDetails,
                            onTaskEdited: editedTask,
                          )))
            },
        child: Container(
            margin: const EdgeInsets.only(bottom: 1, left: 0, right: 0, top: 1),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 100,
                width: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.deepOrange,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 10, // Blur radius
                        offset: const Offset(
                            0, 3), // Offset from the top-left corner
                      ),
                    ]),
              ),
              const Gap(3),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        SizedBox(
                          width: 250,
                          child: Text(taskDetails['title'],
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent)),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            deleteTask();
                          },
                          child: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                        )
                      ]),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.deepOrange[200],
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Assigned to",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const Spacer(),
                          Text(
                              "${assignedUser['first_name']} ${assignedUser['last_name']}",
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 14))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.deepOrange[200],
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Due date",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const Spacer(),
                          Text(taskDetails['due_date'],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.hourglass_bottom_rounded,
                            color: Colors.deepOrange[200],
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Status",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const Spacer(),
                          Text(
                              taskDetails['status']
                                  .toString()
                                  .replaceAll('_', ' '),
                              style: TextStyle(
                                  color: taskDetails['status'] == 'Disputed'
                                      ? Colors.red
                                      : taskDetails['status'] == 'Done'
                                          ? Colors.green
                                          : taskDetails['status'] ==
                                                  'in_progress'
                                              ? Colors.orange
                                              : null))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ])));
  }
}
