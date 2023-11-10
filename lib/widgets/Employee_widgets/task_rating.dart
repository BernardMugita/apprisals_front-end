import 'package:flutter/material.dart';

class TaskRating extends StatefulWidget {
  final Map<String, dynamic> taskRating;
  const TaskRating({Key? key, required this.taskRating}) : super(key: key);

  @override
  State<TaskRating> createState() => _TaskRatingState();
}

class _TaskRatingState extends State<TaskRating> {
  @override
  Widget build(BuildContext context) {
    final taskRating = widget.taskRating;
    int rating = taskRating['rating'];
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.task_alt_rounded,
                size: 25,
                color: Color.fromARGB(255, 146, 146, 0),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      taskRating['title'],
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          color: Color.fromARGB(255, 146, 146, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    taskRating['due_date'],
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ],
          ),
          Text(
            taskRating['rating'].toString(),
            style: TextStyle(
              fontSize: 14,
              color: rating < 20
                  ? Colors.red
                  : rating < 50
                      ? Colors.orange
                      : rating < 80
                          ? Colors.yellow
                          : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
