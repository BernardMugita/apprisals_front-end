import 'package:flutter/material.dart';

class AllowanceItem extends StatelessWidget {
  final Map<String, dynamic> allowanceItem;

  const AllowanceItem({required this.allowanceItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String name = allowanceItem['name'] ?? '';
    final String amount = allowanceItem['amount'] ?? '';

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 3),
      color: Colors.white,
      width: double.infinity,
      child: Row(
        children: [
          Text(name),
          const Spacer(),
          Row(
            children: [
              const Text('KES', style: TextStyle(color: Colors.green)),
              Text(amount, style: const TextStyle(color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }
}
