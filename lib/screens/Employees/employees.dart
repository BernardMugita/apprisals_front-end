import 'package:employee_insights/widgets/employee_component.dart';
import 'package:employee_insights/widgets/top_decoration.dart';
import 'package:flutter/material.dart';

class EmployeesList extends StatefulWidget {
  const EmployeesList({super.key});

  @override
  State<EmployeesList> createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
          child: Column(
        children: [
          const TopDecoration(),
          Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 2),
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              // border radius for only top right and left
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(5),
              //   topRight: Radius.circular(5),
              // ),
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Employees",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.people_outline_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                              'Here you can see all your employees at a glance, click the bubble to see employee performance.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              )),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const EmployeeComponent(),
          const EmployeeComponent(),
          const EmployeeComponent()
        ],
      )),
    );
  }
}
