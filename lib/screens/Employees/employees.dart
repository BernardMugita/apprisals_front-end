import 'dart:convert';

import 'package:employee_insights/services/get_employees_api.dart';
import 'package:employee_insights/services/storage.dart';
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
  StorageAccess storage = StorageAccess();
  GetEmployeesAPI getEmployeesRequest = GetEmployeesAPI();
  List<Map<String, dynamic>> employeeData = [];

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF1ED),
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 146, 146, 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/register_employee');
          },
          child: const Text(
            "Register Employee",
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const TopDecorationYellow(),
          const EmployeeBanner(),
          // map employeeData onto EmployeeComponent
          for (var employee in employeeData)
            EmployeeComponent(
              employee: employee,
            ),
        ],
      )),
    );
  }
}
