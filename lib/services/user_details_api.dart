import 'dart:convert';
import 'package:http/http.dart' as http;

class UserDetailsApi {
  Future<Map<String, dynamic>> fetchUserDetails(String token) async {
    final String authorization = token;

    // get request for user details

    final url = Uri.parse('http://10.0.2.2:8000/users/getbyid');

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
        print('Response is not in the expected format (Map).');
      }
    } else {
      // Request failed, handle the error
      print('Request failed with status: ${request.statusCode}');
    }

    return {};
  }
}
