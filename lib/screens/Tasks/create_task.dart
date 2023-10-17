import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:dotted_border/dotted_border.dart';

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
      backgroundColor: const Color(0xFFFEF1ED),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEF1ED),
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 14),
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
              "Create task",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Gap(10),
            const TextField(
              decoration: InputDecoration(hintText: "Task name"),
            ),
            const Gap(10),
            const TextField(
              decoration: InputDecoration(hintText: 'Enter task description'),
              maxLines: null,
            ),
            const Gap(10),
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
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              "To do",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(
                              "Done",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Assign to:",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      DropdownButton(
                        hint: const Text(
                          '- - - select employee- - -',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              "Chama Joshua",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text(
                              "Chris Hurashio",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
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
                        onPressed: () {},
                        child: const Text('Create Task',
                            style: TextStyle(fontSize: 12))))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
