import 'dart:convert';

import 'package:http/http.dart' as http;

class TaskActionsAPI {
  // mark task as done
  Future<String> markTaskAsDone(String token, String taskId) async {
    final url = Uri.parse('http://10.0.2.2:8000/tasks/mark_done');
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
    final url = Uri.parse('http://10.0.2.2:8000/tasks/mark_disputed');
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
    final url = Uri.parse('http://10.0.2.2:8000/tasks/delete_task');
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
