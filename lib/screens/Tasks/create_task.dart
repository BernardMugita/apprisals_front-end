import 'package:flutter/material.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({super.key});

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  int? selectedValue;

  DateTime? selectedDate = DateTime.now();
  DateTime firstDate = DateTime(DateTime.now().year - 1);
  DateTime lastDate = DateTime(DateTime.now().year + 1);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 14),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Container(
            height: 450,
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 1,
              //     blurRadius: 5,
              //   )]
            ),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.deepOrange,
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(10),
                  //     topRight: Radius.circular(10))
                ),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        "Create New Task",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  const TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 10, right: 10, top: 0, bottom: 0),
                        labelStyle: TextStyle(fontSize: 12),
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(),
                        labelText: 'Task Name',
                        hintText: 'Enter task name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 10, right: 10, top: 0, bottom: 0),
                        labelStyle: TextStyle(fontSize: 12),
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(),
                        labelText: 'Task Description',
                        hintText: 'Enter task description'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Task Type:",
                        style: TextStyle(fontSize: 12),
                      ),
                      DropdownButton(
                        hint: const Text(
                          '- - - select - - -',
                          style: TextStyle(fontSize: 12),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              "Individual task",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(
                              "Group task",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Assign to:",
                        style: TextStyle(fontSize: 12),
                      ),
                      DropdownButton(
                        hint: const Text(
                          '- - - select employee- - -',
                          style: TextStyle(fontSize: 12),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              "Chama Joshua",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(
                              "Chris Hurashio",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Due Date:",
                        style: TextStyle(fontSize: 12),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(10)),
                        onPressed: () =>
                            _selectDate(context), // Open date picker
                        child: Text(
                          "${selectedDate?.toLocal()}"
                              .split(' ')[0], // Display selected date
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.all(10)),
                      onPressed: () {},
                      child: const Text('Create Task',
                          style: TextStyle(fontSize: 12)))
                ]),
              )
            ]),
          ),
        ));
  }
}
