import 'package:employee_insights/widgets/Tasks_widgets/feedback_component.dart';
import 'package:employee_insights/widgets/Tasks_widgets/task_details.dart';
import 'package:employee_insights/widgets/Tasks_widgets/todos_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SingleTaskView extends StatefulWidget {
  const SingleTaskView({super.key});

  @override
  State<SingleTaskView> createState() => _SingleTaskViewState();
}

class _SingleTaskViewState extends State<SingleTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFEF1ED),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 50, bottom: 10),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TaskID:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("00JHGQO",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date Assigned:",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 10,
                          ),
                          Text("dd/mm/yyyy",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              )),
                        ],
                      )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Title:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "CREATE UI COMPONENTS",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ])),
            const TaskDetails(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task Description:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Gap(10),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                        "The process typically begins with planning and sketching the layout and appearance of the components, taking into consideration factors like user experience, aesthetics, and usability."),
                  )
                ],
              ),
            ),
            const Gap(10),
            Container(
                height: 250,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To do's:",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TodosItem(),
                    TodosItem(),
                    TodosItem(),
                    TodosItem(),
                    TodosItem(),
                  ],
                ))),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.red),
                          onPressed: () {},
                          child: const Text(
                            "Dispute",
                            style: TextStyle(fontSize: 10),
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF008000),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Mark as done",
                            style: TextStyle(fontSize: 10),
                          )))
                ],
              ),
            ),
            const FeedBackComponent(),
          ]),
        ));
  }
}
