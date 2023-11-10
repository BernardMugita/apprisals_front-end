import 'dart:convert';

import 'package:employee_insights/utils/apprisal_utils.dart';
import 'package:http/http.dart' as http;

class TaskActionsAPI {
  String baseUrl = ApprisalUtils.baseUrl;

  // mark task as done
  Future<String> markTaskAsDone(String token, String taskId) async {
    final url = Uri.parse("$baseUrl/tasks/mark_done");
    final request = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(<String, String>{'task_id': taskId}));

    if (request.body == 'Success' && request.statusCode == 200) {
      final responseData = request.body;
      return responseData;
    }

    return '';
  }

  Future<String> markTaskasDisputed(String token, String taskId) async {
    final url = Uri.parse("$baseUrl/tasks/mark_disputed");
    final request = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(<String, String>{'task_id': taskId}));

    if (request.body == 'Success' && request.statusCode == 200) {
      final responseData = request.body;
      return responseData;
    }
    return '';
  }

  Future<String> deleteTask(String token, String taskId) async {
    final url = Uri.parse("$baseUrl/tasks/delete_task");
    final request = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(<String, String>{'task_id': taskId}));

    if (request.body == 'Success' && request.statusCode == 200) {
      final responseData = request.body;
      return responseData;
    }
    return '';
  }
}
