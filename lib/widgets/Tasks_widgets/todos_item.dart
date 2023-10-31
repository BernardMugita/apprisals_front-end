import 'package:flutter/material.dart';

class TodosItem extends StatefulWidget {
  const TodosItem({super.key});

  @override
  State<TodosItem> createState() => _TodosItemState();
}

class _TodosItemState extends State<TodosItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Icon(Icons.assignment, color: Color(0xFF008000)),
            SizedBox(
              width: 10,
            ),
            Text(
              "Create a bottom navigation bar",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
        Checkbox(
          value: isChecked,
          activeColor: Colors.deepOrange,
          checkColor: Colors.white,
          onChanged: (newValue) {
            setState(() {
              isChecked = newValue!;
            });
          },
        ),
      ],
    );
  }
}
