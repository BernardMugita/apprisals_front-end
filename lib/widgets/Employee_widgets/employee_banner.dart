import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmployeeBanner extends StatefulWidget {
  const EmployeeBanner({super.key});

  @override
  State<EmployeeBanner> createState() => _EmployeeBannerState();
}

class _EmployeeBannerState extends State<EmployeeBanner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          margin:
              const EdgeInsets.only(left: 10, top: 10, bottom: 0, right: 10),
          width: double.infinity,
          height: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0), topRight: Radius.circular(0)),
            image: DecorationImage(
              image: AssetImage('assets/images/employees.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Semi-Transparent Overlay
        Container(
          margin:
              const EdgeInsets.only(left: 10, top: 10, bottom: 0, right: 10),
          width: double.infinity,
          height: 150,
          decoration: const BoxDecoration(
              color: Color.fromARGB(181, 118, 145, 0),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(
                      0))), // Change the color and opacity as needed
        ),
        const Positioned(
          top: 30,
          left: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.people_outline_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  Gap(10),
                  Text(
                    "Employees",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Gap(50),
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
        )
      ],
    );
  }
}
