import 'dart:convert';
import 'package:http/http.dart' as http;

class GetOTPAPI {
  Future<void> getOTP(String token) async {
    final String authorization = token;

    // get request for user details

    final url = Uri.parse('http://10.0.2.2:8000/getotp');

    final request = await http.post(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authorization'
    });

    if (request.statusCode == 200) {
      // Request was successful, parse the response
      final responseData = jsonDecode(request.body);
      return responseData;
    } else {
      // Request failed, handle the error
      print('Request failed with status: ${request.statusCode}');
    }
  }
}
