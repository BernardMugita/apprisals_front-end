import 'package:flutter/material.dart';

class PayslipsCard extends StatefulWidget {
  const PayslipsCard({super.key});

  @override
  State<PayslipsCard> createState() => _PayslipsCardState();
}

class _PayslipsCardState extends State<PayslipsCard> {
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
              image: AssetImage('assets/images/payslips.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Semi-Transparent Overlay
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(175, 17, 126, 0),
            borderRadius: BorderRadius.circular(15),
          ), // Change the color and opacity as needed
        ),
        const Positioned(
          top: 30,
          left: 50,
          child: Column(
            children: [
              Text(
                "Payslips",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                child: Icon(
                  Icons.payment_outlined,
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
