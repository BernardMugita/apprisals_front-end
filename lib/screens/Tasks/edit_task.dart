import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:employee_insights/services/create_task_api.dart';
import 'package:employee_insights/services/edit_task_api.dart';
import 'package:employee_insights/services/get_employees_api.dart';
import 'package:employee_insights/services/get_tasks_api.dart';
import 'package:employee_insights/services/storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditTask extends StatefulWidget {
  final String taskId;
  const EditTask({Key? key, required this.taskId}) : super(key: key);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  int? selectedValue;
  Map<String, dynamic>? selectedEmployee;

  DateTime? selectedDate = DateTime.now();
  DateTime firstDate = DateTime(DateTime.now().year - 1);
  DateTime lastDate = DateTime(DateTime.now().year + 1);
  StorageAccess storage = StorageAccess();
  GetEmployeesAPI getEmployeesRequest = GetEmployeesAPI();
  CreateTaskAPI createTaskAPI = CreateTaskAPI();
  EditTaskAPI editTaskAPI = EditTaskAPI();
  List<Map<String, dynamic>> employeeData = [];
  GetTasksAPI tasks = GetTasksAPI();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _taskTypeController = TextEditingController();

  Map<String, dynamic> taskDetails = {};
  String taskId = '';

  // Date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate!,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // Fetch Task Details
  Future<Map<String, dynamic>> getTaskById() async {
    final userToken = await storage.readSecureData('token');
    final Map<String, dynamic> dataMap = jsonDecode(userToken!);

    final String token = dataMap['token'];

    final task = await tasks.getTask(token, taskId);

    setState(() {
      taskDetails = task;
      _titleController.text = task['title'];
      _descriptionController.text = task['description'];
      _statusController.text = task['status'];
      _taskTypeController.text = task['task_type'];
      selectedEmployee = task['assigned_to'];
      selectedDate = DateTime.parse(task['due_date']);
    });

    return {};
  }

  // get all employees
  Future<void> getEmployees() async {
    final userToken = await storage.readSecureData('token');
    if (userToken != null && !userToken.contains("User does not exist")) {
      final Map<String, dynamic> dataMap = jsonDecode(userToken);
      final String token = dataMap['token'];
      final employees = await getEmployeesRequest.getEmployees(token);
      setState(() {
        employeeData = employees;
      });
    }
  }

  // edit Task
  Future<String> editTask() async {
    final userToken = await storage.readSecureData('token');
    final Map<String, dynamic> dataMap = jsonDecode(userToken!);

    final String token = dataMap['token'];

    await editTaskAPI.editTask(
        token,
        _titleController.text,
        _descriptionController.text,
        _statusController.text,
        selectedEmployee!['id'].toString(),
        dataMap['id'].toString(),
        _taskTypeController.text,
        'Awaiting Feedback',
        '0',
        selectedDate.toString().split(' ')[0],
        context);

    return '';
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getTaskById();
      getEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    taskId = widget.taskId;

    return Scaffold(
      backgroundColor: const Color(0xFFFEF1ED),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEF1ED),
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 16),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
        child: Container(
          color: Colors.transparent,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Edit task",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Gap(10),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: "Task name"),
            ),
            const Gap(10),
            TextField(
              controller: _descriptionController,
              decoration:
                  const InputDecoration(hintText: 'Enter task description'),
              maxLines: null,
            ),
            const Gap(10),
            Container(
              color: Colors.transparent,
              width: double.infinity, // Set a fixed width to constrain the row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Task Type:",
                    style: TextStyle(fontSize: 14),
                  ),
                  const Spacer(),
                  // Wrap the DropdownButton with an Expanded widget to constrain its width
                  Expanded(
                    child: DropdownButton<String>(
                      hint: const Text(
                        '- - - select - - -',
                        style: TextStyle(fontSize: 12),
                      ),
                      value: _taskTypeController.text.isNotEmpty
                          ? _taskTypeController.text
                          : 'individual',
                      items: const [
                        DropdownMenuItem<String>(
                          value: "individual",
                          child: Text(
                            "Individual task",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "group",
                          child: Text(
                            "Group task",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _taskTypeController.text = value!;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            const Gap(10),
            const Text(
              "Task details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Gap(10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Status:",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      DropdownButton(
                        hint: const Text(
                          '- - - select - - -',
                          style: TextStyle(fontSize: 12),
                        ),
                        value: _statusController.text.isNotEmpty
                            ? _statusController.text
                            : 'in_progress',
                        items: const [
                          DropdownMenuItem(
                            value: "in_progress",
                            child: Text(
                              "In progress",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "pending",
                            child: Text(
                              "Pending",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Done",
                            child: Text(
                              "Done",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _statusController.text = value!;
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Assign to:",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      DropdownButton(
                        hint: Text(
                          selectedEmployee != null
                              ? '${selectedEmployee!['first_name']} ${selectedEmployee!['last_name']}'
                              : '- - - select - - -',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        ),
                        value: selectedEmployee, // Change the type here
                        items: employeeData.map((employee) {
                          return DropdownMenuItem(
                            value:
                                employee, // Change this to the whole employee map
                            child: Text(
                              '${employee['first_name']} ${employee['last_name']}',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedEmployee =
                                value; // Change this to the whole employee map
                          });
                        },
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Due Date:",
                        style: TextStyle(fontSize: 14),
                      ),
                      const Gap(10),
                      Row(children: [
                        Expanded(
                            child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 10,
                              backgroundColor: const Color(0xFFFEF1ED),
                              padding: const EdgeInsets.all(10)),
                          onPressed: () =>
                              _selectDate(context), // Open date picker
                          child: Row(children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.deepOrange,
                            ),
                            const Gap(10),
                            Text(
                              "${selectedDate?.toLocal()}"
                                  .split(' ')[0], // Display selected date
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black),
                            )
                          ]),
                        ))
                      ]),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(20),
            const Text(
              "Attachments",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Gap(10),
            DottedBorder(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              strokeWidth: 2,
              radius: const Radius.circular(15),
              color: const Color.fromARGB(255, 162, 162, 162),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.upload_rounded,
                    color: Colors.deepOrange,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Click here to add attachments",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )),
            ),
            const Gap(20),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.deepOrange,
                            padding: const EdgeInsets.all(10)),
                        onPressed: () {
                          editTask();
                        },
                        child: const Text('Save Changes',
                            style: TextStyle(fontSize: 12))))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
