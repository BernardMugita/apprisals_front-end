import 'package:flutter/material.dart';

class EmployeeComponent extends StatefulWidget {
  const EmployeeComponent({super.key});

  @override
  State<EmployeeComponent> createState() => _EmployeeComponentState();
}

class _EmployeeComponentState extends State<EmployeeComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 1),
          decoration: const BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.deepOrange,
                child: Icon(Icons.person_2_outlined, color: Colors.white),
                // backgroundImage: AssetImage(''),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Employee Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Employee Position',
                    style: TextStyle(
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
