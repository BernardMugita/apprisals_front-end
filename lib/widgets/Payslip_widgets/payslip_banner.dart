import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PayslipBanner extends StatefulWidget {
  const PayslipBanner({super.key});

  @override
  State<PayslipBanner> createState() => _PayslipBannerState();
}

class _PayslipBannerState extends State<PayslipBanner> {
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
              image: AssetImage('assets/images/payslips.jpeg'),
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
              color: Color.fromARGB(175, 17, 126, 0),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(
                      0))), // Change the color and opacity as needed
        ),
        const Positioned(
          top: 30,
          left: 40,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.credit_card_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                Gap(10),
                Text(
                  "Payslips",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Gap(40),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Payslips",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        "View your payslips; toggle the switch to view your payslips for a desired period",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        )
      ],
    );
  }
}
