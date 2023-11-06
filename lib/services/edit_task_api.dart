import 'dart:convert';

import 'package:employee_insights/screens/Tasks/single_task_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditTaskAPI {
  Future<String> editTask(
      String token,
      String title,
      String description,
      String status,
      String assignedToId,
      String assignedById,
      String taskType,
      String rating,
      String feedback,
      String dueDate,
      BuildContext context) async {
    final url = Uri.parse('http://10.0.2.2:8000/tasks/edit_task');

    final request = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(<String, String>{
          'title': title,
          'description': description,
          'status': status,
          'assigned_to_id': assignedToId,
          'assigned_by_id': assignedById,
          'task_type': taskType,
          'rating': rating,
          'feedback': feedback,
          'due_date': dueDate,
        }));

    if (json.decode(request.body) != "Invalid Token") {
      if (request.statusCode == 200) {
        // Request was successful, parse the response
        final taskData = json.decode(request.body);
        print(taskData);
        // Add a delay of 3 seconds before navigating to the next screen
        await Future.delayed(const Duration(seconds: 3));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleTaskView(
              taskDetails: taskData,
            ),
          ),
        );
        return taskData;
      } else {
        // Request failed, handle the error
        print('Request failed with status: ${request.statusCode}');
      }
    } else {
      print("Invalid Token");
    }

    return '';
  }
}
