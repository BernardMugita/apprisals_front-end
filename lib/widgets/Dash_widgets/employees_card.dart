import 'package:flutter/material.dart';

class EmployeeCard extends StatefulWidget {
  const EmployeeCard({super.key});

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, '/employees')},
      child: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: 120,
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
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: const Color.fromARGB(181, 118, 145, 0),
              borderRadius: BorderRadius.circular(15),
            ), // Change the color and opacity as needed
          ),
          Container(
            color: Colors.transparent,
            height: 120,
            width: double.infinity,
            child: const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Icon(
                      Icons.people_alt_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Employees",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
