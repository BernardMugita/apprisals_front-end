import 'package:flutter/material.dart';

class SinglePayslip extends StatefulWidget {
  final Map<String, dynamic> payslipDetails;

  const SinglePayslip({Key? key, required this.payslipDetails})
      : super(key: key);

  @override
  State<SinglePayslip> createState() => _SinglePayslipState();
}

class _SinglePayslipState extends State<SinglePayslip> {
  @override
  Widget build(BuildContext context) {
    final payslip = widget.payslipDetails;
    print(payslip);

    return Scaffold(
      backgroundColor: const Color(0xFFFEF1ED),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        // remove the back arrow
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Row(
                children: [
                  GestureDetector(
                    child: const Icon(Icons.arrow_back_rounded),
                    onTap: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "PAYSLIP DETAILS",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        payslip['net_pay'].toString(),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        child: Text("KES54,500",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ),
                      SizedBox(
                        child: Text(
                            "PAID ON ${payslip.isNotEmpty ? payslip['date'] : 'loading...'}",
                            style: const TextStyle(fontSize: 14)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            maximumSize: const Size(180, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.download_rounded),
                              Text(
                                "DOWNLOAD PAYSLIP",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  Column(
                    children: [
                      const Row(children: [
                        Text("Employee Details",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ]),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Employee Name",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(
                              child: Text(
                                  "${payslip['employee']['first_name']} ${payslip['employee']['last_name']}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                  )))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Email Address",
                              style: TextStyle(fontSize: 14)),
                          SizedBox(
                              child: Text(
                                  payslip.isNotEmpty
                                      ? payslip['employee']['email']
                                      : 'loading...',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  )))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Phone number",
                              style: TextStyle(fontSize: 14)),
                          SizedBox(
                              child: Text(
                                  payslip.isNotEmpty
                                      ? payslip['employee']['telephone']
                                      : 'loading...',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  )))
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Normal Pay",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(
                              child: Text(
                                payslip['amount'].toString(),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.green)))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Salary", style: TextStyle(fontSize: 14)),
                          SizedBox(
                              child: Text(
                                payslip['amount'].toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  )))
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Allowances",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(
                              child: Text('KES 5,000',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.green)))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("House allowance",
                              style: TextStyle(fontSize: 14)),
                          SizedBox(
                              child: Text('KES 5,000',
                                  style: TextStyle(
                                    fontSize: 14,
                                  )))
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Leave",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(
                              child: Text('KES 0',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.green)))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Situational Leave Taken",
                              style: TextStyle(fontSize: 14)),
                          SizedBox(
                              child: Text('KES 0',
                                  style: TextStyle(
                                    fontSize: 14,
                                  )))
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Deductions",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(
                              child: Text('KES 5,500',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.green)))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PAYE", style: TextStyle(fontSize: 14)),
                          SizedBox(
                              child: Text('KES 3,500',
                                  style: TextStyle(
                                    fontSize: 14,
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("NHIF", style: TextStyle(fontSize: 14)),
                          SizedBox(
                              child: Text('KES 2,000',
                                  style: TextStyle(
                                    fontSize: 14,
                                  )))
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Net Pay",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(
                              child: Text(
                                payslip['net_pay'].toString(),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.green)))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Direct credit amount",
                              style: TextStyle(fontSize: 14)),
                          SizedBox(
                              child: Text(
                                  payslip['net_pay'].toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  )))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
