import 'package:flutter/material.dart';

class PayslipsCard extends StatefulWidget {
  const PayslipsCard({super.key});

  @override
  State<PayslipsCard> createState() => _PayslipsCardState();
}

class _PayslipsCardState extends State<PayslipsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, '/payslips')},
      child: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: 120,
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
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: const Color.fromARGB(175, 17, 126, 0),
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
                      Icons.payment_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Payslips",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
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
