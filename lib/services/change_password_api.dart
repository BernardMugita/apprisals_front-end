import 'dart:convert';
import 'package:employee_insights/services/storage.dart';
import 'package:employee_insights/utils/apprisal_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChangePasswordAPI {
  StorageAccess storage = StorageAccess();

  String baseUrl = ApprisalUtils.baseUrl;

  Future<void> changePassword(String otp, String newPassword,
      String confirmNewPassword, String token, BuildContext context) async {
    if (newPassword != "" && confirmNewPassword != "") {
      if (newPassword != confirmNewPassword) {
        throw Exception('Passwords do not match');
      } else {
        final url = Uri.parse("$baseUrl/users/change_password");

        final request = await http.post(url,
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },
            body: jsonEncode(
                <String, String>{'password': newPassword, 'otp': otp}));

        if (request.statusCode == 200) {
          // Request was successful, parse the response
          final responseData = jsonDecode(request.body);
          print(responseData);
          await storage.deleteSecureData('token');
          Navigator.pushNamed(context, '/login');
        } else {
          // Request failed, handle the error
          print('Request failed with status: ${request.statusCode}');
        }
      }
    } else {
      print('please enter password or confirm password');
    }
  }
}
