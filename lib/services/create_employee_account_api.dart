import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateEmployeeAccountApi {
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
    final url = Uri.parse('http://10.0.2.2:8000/users/createuser');

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
