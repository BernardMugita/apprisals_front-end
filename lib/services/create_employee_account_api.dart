import 'dart:convert';
import 'package:employee_insights/utils/apprisal_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateEmployeeAccountApi {
  String baseUrl = ApprisalUtils.baseUrl;

  Future<void> createEmployee(
      String token,
      String username,
      String firstname,
      String lastname,
      String roles,
      String email,
      String organization,
      String telephone,
      String jobrole,
      BuildContext context) async {
    final url = Uri.parse("$baseUrl/users/createuser");

    final request = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'first_name': firstname,
        'last_name': lastname,
        'roles': roles,
        'email': email,
        'telephone': telephone,
        'organization': organization,
        'job_role': jobrole
      }),
    );

    if (request.statusCode == 200) {
      String response = request.body;

      if (response != "Invalid Token") {
        response = response;
      } else {
        throw Exception('Failed to create employee');
      }
    } else {
      throw Exception('Failed to create employee');
    }
  }
}
