import 'dart:convert';

import 'package:employee_insights/utils/apprisal_utils.dart';
import 'package:http/http.dart' as http;

class GetPayslipsAPI {
  final baseUrl = ApprisalUtils.baseUrl;

  Future<List<Map<String, dynamic>>> getPayslips(String token) async {
    final url = Uri.parse("$baseUrl/payslips/get_all_payslips");

    final request = await http.post(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (request.statusCode == 200) {
      final responseData = jsonDecode(request.body);

      // cast to List<Map<String, dynamic>>
      final List<dynamic> payslips = responseData['payslips'];
      

      return payslips.cast<Map<String, dynamic>>();
    } else {
      throw Exception(
          "Failed to get payslips. Status Code: ${request.statusCode}, Response: ${request.body}");
    }
  }
}
