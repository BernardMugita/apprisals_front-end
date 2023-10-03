import 'package:employee_insights/widgets/top_decoration.dart';
import 'package:flutter/material.dart';

class PayslipsList extends StatefulWidget {
  const PayslipsList({super.key});

  @override
  State<PayslipsList> createState() => _PayslipsListState();
}

class _PayslipsListState extends State<PayslipsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              maximumSize: const Size(160, 40)),
          onPressed: () {
            Navigator.pushNamed(context, '/single_slip');
          },
          child: const Text("Prepare Payslip"),
        ),
        body: Column(
          children: [
            const TopDecoration(),
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 2),
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: const Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payslips",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.credit_card_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
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
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 2),
              decoration: const BoxDecoration(color: Colors.white),
              child: const Row(
                children: [
                  Text("Jan 2023 - Dec 2023"),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.chevron_left_rounded),
                      Icon(Icons.chevron_right_rounded)
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(1),
              width: double.infinity,
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 2),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/single_slip');
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          left: 0, right: 0, top: 1, bottom: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      // borderRadius: BorderRadius.circular(10)),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.payments_rounded,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Peter Ngangi",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Jan 1 - Jan 31")
                              ]),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "KES",
                                style: TextStyle(color: Colors.green),
                              ),
                              Text("45,000")
                            ],
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/single_slip');
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 1, bottom: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      // borderRadius: BorderRadius.circular(10)),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.payments_rounded,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Peter Ngangi",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Feb 1 - Feb 28")
                              ]),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "KES",
                                style: TextStyle(color: Colors.green),
                              ),
                              Text("65,000")
                            ],
                          )
                        ],
                      )),
                )
              ]),
            ))
          ],
        ));
  }
}
