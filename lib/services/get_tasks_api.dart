import 'dart:convert';
import 'package:employee_insights/utils/apprisal_utils.dart';
import 'package:http/http.dart' as http;

class GetTasksAPI {
  String baseUrl = ApprisalUtils.baseUrl;

  Future<Map<String, dynamic>> getTask(String token, String taskId) async {
    final url = Uri.parse("$baseUrl/tasks/get_task_by_id");
    final request = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(<String, String>{'task_id': taskId}));

    if (request.statusCode == 200) {
      final responseData = jsonDecode(request.body);
      if (responseData.isNotEmpty && responseData is Map<String, dynamic>) {
        return responseData;
      } else {
        throw Exception('Response items are not in the expected format (Map).');
      }
    } else {
      throw Exception("Something went wrong");
    }
  }

  Future<List<Map<String, dynamic>>> getTasks(
      String token, Function(Map<String, dynamic>) onTaskEditedCallback) async {
    final url = Uri.parse("$baseUrl/tasks/get_tasks");

    final request = await http.post(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (request.statusCode == 200) {
      final responseData = jsonDecode(request.body);
      if (responseData is List<dynamic>) {
        if (responseData.isNotEmpty &&
            responseData[0] is Map<String, dynamic>) {
          // Invoke the callback with each task in responseData
          responseData.cast<Map<String, dynamic>>().forEach((task) {
            onTaskEditedCallback(task);
          });

          return responseData.cast<Map<String, dynamic>>();
        } else {
          throw Exception(
              'Response items are not in the expected format (Map).');
        }
      } else {
        throw Exception(
            'Response is not in the expected format (List of Maps).');
      }
    } else {
      throw Exception("Something went wrong");
    }
  }
}
