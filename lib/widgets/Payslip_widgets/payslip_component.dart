import 'package:flutter/material.dart';

class PayslipComponent extends StatefulWidget {
  const PayslipComponent({super.key});

  @override
  State<PayslipComponent> createState() => _PayslipComponentState();
}

class _PayslipComponentState extends State<PayslipComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/single_slip');
      },
      child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          margin: const EdgeInsets.only(left: 0, right: 0, top: 1, bottom: 1),
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          // borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.green[200],
                child: const Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.green,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Peter Ngangi",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Jan 1 - Jan 31")
                  ]),
              const Spacer(),
              const Column(
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
    );
  }
}
