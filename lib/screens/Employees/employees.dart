import 'package:employee_insights/widgets/App_widgets/top_decoration_yellow.dart';
import 'package:employee_insights/widgets/Employee_widgets/employee_banner.dart';
import 'package:employee_insights/widgets/Employee_widgets/employee_component.dart';
import 'package:flutter/material.dart';

class EmployeesList extends StatefulWidget {
  const EmployeesList({super.key});

  @override
  State<EmployeesList> createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFEF1ED),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TopDecorationYellow(),
          EmployeeBanner(),
          EmployeeComponent(),
          EmployeeComponent(),
          EmployeeComponent()
        ],
      )),
    );
  }
}
