import 'dart:convert';

import 'package:http/http.dart' as http;

class GetEmployeesAPI {
  Future<Map<String, dynamic>> getEmployees(String token) async {
    final url = Uri.parse('http://10.0.2.2:8000/users');

    final request = await http.post(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (request.statusCode == 200) {
      final responseData = jsonDecode(request.body);
      if (responseData is Map<String, dynamic>) {
        return responseData;
      }
    } else {
      print("Something went wrong");
    }

    return {};
  }
}
