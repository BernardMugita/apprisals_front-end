import 'dart:convert';
import 'package:employee_insights/utils/apprisal_utils.dart';
import 'package:http/http.dart' as http;

class GetEmployeesAPI {
  String baseUrl = ApprisalUtils.baseUrl;

  Future<List<Map<String, dynamic>>> getEmployees(String token) async {
    final url = Uri.parse("$baseUrl/users/getall");

    final request = await http.post(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (request.statusCode == 200) {
      final responseData = jsonDecode(request.body);
      if (responseData is List<dynamic>) {
        // Check if each item in the list is a map
        if (responseData.isNotEmpty &&
            responseData[0] is Map<String, dynamic>) {
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
