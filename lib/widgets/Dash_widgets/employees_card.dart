import 'package:flutter/material.dart';

class EmployeeCard extends StatefulWidget {
  const EmployeeCard({super.key});

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('assets/images/employees.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Semi-Transparent Overlay
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(181, 118, 145, 0),
            borderRadius: BorderRadius.circular(15),
          ), // Change the color and opacity as needed
        ),
        const Positioned(
          top: 30,
          left: 40,
          child: Column(
            children: [
              Text(
                "Employees",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                child: Icon(
                  Icons.people_alt_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
