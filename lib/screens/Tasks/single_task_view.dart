import 'package:employee_insights/widgets/Tasks_widgets/attachment_component.dart';
import 'package:employee_insights/widgets/Tasks_widgets/feedback_component.dart';
import 'package:employee_insights/widgets/Tasks_widgets/task_details.dart';
import 'package:employee_insights/widgets/Tasks_widgets/todos_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SingleTaskView extends StatefulWidget {
  final Map<String, dynamic> createdTask;
  const SingleTaskView({Key? key, required this.createdTask}) : super(key: key);

  @override
  State<SingleTaskView> createState() => _SingleTaskViewState();
}

class _SingleTaskViewState extends State<SingleTaskView> {
  @override
  Widget build(BuildContext context) {
    print(widget.createdTask);
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
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("00JHGQO",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date Assigned:",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 10,
                          ),
                          Text("dd/mm/yyyy",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
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
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "CREATE UI COMPONENTS",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
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
                  Row(
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
                  Divider(
                    color: Colors.grey,
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
                          onPressed: () {},
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
                          onPressed: () {},
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
