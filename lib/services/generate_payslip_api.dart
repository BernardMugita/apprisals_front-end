import 'dart:convert';

import 'package:employee_insights/screens/Payslips/single_payslip.dart';
import 'package:employee_insights/utils/apprisal_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GeneratePayslipAPI {
  String baseUrl = ApprisalUtils.baseUrl;

  Future<Map<String, dynamic>> createPayslips(
      String token,
      String employeeId,
      String preparedById,
      String date,
      String period,
      String amount,
      String status,
      List<dynamic> deductions,
      List<dynamic> additions,
      BuildContext context) async {
    final url = Uri.parse("$baseUrl/payslips/create_payslip");

    final request = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode(<String, dynamic>{
        'employee_id': employeeId,
        'prepared_by_id': preparedById,
        'date': date,
        'period': period,
        'amount': amount,
        'status': status,
        'deductions': deductions,
        'additions': additions,
      }), // Convert body data to JSON format
    );

    if (request.statusCode == 200) {
      final payslipData = json.decode(request.body);
      if (payslipData == "Error" ||
          payslipData == "Invalid" ||
          payslipData == "Unauthorized" ||
          payslipData == "object has no attribute") {
        return {};
      } else {
        // Add a delay of 3 seconds before navigating to the next screen
        await Future.delayed(const Duration(seconds: 3), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SinglePayslip(
                payslipDetails: payslipData as Map<String, dynamic>,
              ),
            ),
          );
        });
        return payslipData as Map<String, dynamic>;
      }
    } else {
      throw Exception('Failed to create payslip');
    }
  }
}
