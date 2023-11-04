import 'package:flutter/material.dart';

class EmployeeComponent extends StatefulWidget {
  final Map<String, dynamic> employee;
  const EmployeeComponent({Key? key, required this.employee}) : super(key: key);

  @override
  State<EmployeeComponent> createState() => _EmployeeComponentState();
}

class _EmployeeComponentState extends State<EmployeeComponent> {
  @override
  Widget build(BuildContext context) {
    final employeeDetails = widget.employee;
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 1),
          decoration: const BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 146, 146, 0),
                child:
                    Icon(Icons.person_2_outlined, color: Colors.yellowAccent),
                // backgroundImage: AssetImage(''),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employeeDetails['first_name'] +
                        " " +
                        employeeDetails['last_name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    employeeDetails['job_role'],
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          )),
      onTap: () {
        Navigator.pushNamed(context, '/employee_apprisal');
      },
    );
  }
}
