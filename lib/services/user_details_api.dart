import 'dart:convert';
import 'package:employee_insights/utils/apprisal_utils.dart';
import 'package:http/http.dart' as http;

class UserDetailsApi {
  String baseUrl = ApprisalUtils.baseUrl;

  Future<Map<String, dynamic>> fetchUserDetails(String token) async {
    final String authorization = token;

    // get request for user details
    final url = Uri.parse("$baseUrl/users/getbyid");

    final request = await http.post(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authorization'
    });

    if (request.statusCode == 200) {
      // Request was successful, parse the response
      final responseData = jsonDecode(request.body);
      if (responseData is Map<String, dynamic>) {
        return responseData;
      } else {
        throw Exception('Response is not in the expected format (Map).');
      }
    } else {
      // Request failed, handle the error
      throw Exception('Request failed with status: ${request.statusCode}');
    }
  }
}
