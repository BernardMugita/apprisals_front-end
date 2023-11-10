import 'dart:convert';

import 'package:employee_insights/utils/apprisal_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditTaskAPI {
  String baseUrl = ApprisalUtils.baseUrl;

  Future<Map<String, dynamic>> editTask(
      String taskId,
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
    final url = Uri.parse("$baseUrl/tasks/edit_task");

    final request = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(<String, String>{
          'task_id': taskId,
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

    if (request.statusCode == 200) {
      if (request.body == "Invalid Token" || request.body.startsWith("Error")) {
        // Request was successful, parse t
        throw Exception('Something went wrong');
      } else {
        final taskDetails = json.decode(request.body);
        return taskDetails as Map<String, dynamic>;
      }
    } else {
      throw Exception('Failed to edit task');
    }
  }
}
