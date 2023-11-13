import 'package:flutter/material.dart';

class DeductionItem extends StatefulWidget {
  final Map<String, dynamic> deductionItem;
  const DeductionItem({required this.deductionItem, Key? key})
      : super(key: key);

  @override
  State<DeductionItem> createState() => _DeductionItemState();
}

class _DeductionItemState extends State<DeductionItem> {
  @override
  Widget build(BuildContext context) {
    final item = widget.deductionItem;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 3),
      color: Colors.white,
      width: double.infinity,
      child: Row(children: [
        Text(item['name']),
        const Spacer(),
        Row(
          children: [
            const Text('KES', style: TextStyle(color: Colors.red)),
            Text(item['amount'], style: const TextStyle(color: Colors.red)),
          ],
        )
      ]),
    );
  }
}
