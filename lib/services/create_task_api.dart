import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateTaskAPI {
  Future<Map<String, dynamic>> createTask(
      String token,
      String title,
      String description,
      String status,
      String assignedToId,
      String assignedById,
      String taskType,
      String rating,
      String feedback,
      String dueDate) async {
    if (title != "" &&
        description != "" &&
        status != "" &&
        assignedToId != "" &&
        assignedById != "" &&
        taskType != "" &&
        dueDate != "") {
      final url = Uri.parse("http://10.0.2.2:8000/tasks/create_task");

      final bodyData = {
        'title': title,
        'description': description,
        'status': status,
        'assigned_to_id': assignedToId,
        'assigned_by_id': assignedById,
        'taskType': taskType,
        'rating': rating,
        'feedback': feedback,
        'dueDate': dueDate,
      };

      final request = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(bodyData), // Convert body data to JSON format
      );

      if (json.decode(request.body) != "Invalid Token") {
        if (request.statusCode == 200) {
          // Request was successful, parse the response
          final responseData = json.decode(request.body);
          print(responseData);
          return responseData as Map<String, dynamic>;
        } else {
          // Request failed, handle the error
          print('Request failed with status: ${request.statusCode}');
        }
      } else {
        print("Invalid Token");
      }
    } else {
      print('please enter all fields');
    }

    return {};
  }
}
