import 'dart:convert';
import 'package:http/http.dart' as http;

class GetEmployeesAPI {
  Future<List<Map<String, dynamic>>> getEmployees(String token) async {
    final url = Uri.parse('http://10.0.2.2:8000/users/getall');

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
          print('Response items are not in the expected format (Map).');
        }
      } else {
        print('Response is not in the expected format (List of Maps).');
      }
    } else {
      print("Something went wrong");
    }

    return [];
  }
}
