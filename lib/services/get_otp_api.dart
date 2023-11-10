import 'dart:convert';
import 'package:employee_insights/utils/apprisal_utils.dart';
import 'package:http/http.dart' as http;

class GetOTPAPI {
  String baseUrl = ApprisalUtils.baseUrl;

  Future<void> getOTP(String token) async {
    final String authorization = token;

    // get request for user details

    final url = Uri.parse("$baseUrl/users/get_otp");

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
      throw Exception('Request failed with status: ${request.statusCode}');
    }
  }
}
