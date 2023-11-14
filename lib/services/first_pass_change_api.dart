import 'dart:convert';
import 'package:employee_insights/services/storage.dart';
import 'package:employee_insights/utils/apprisal_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirstPassChangeAPI {
  String baseUrl = ApprisalUtils.baseUrl;

  StorageAccess storage = StorageAccess();

  Future<void> changePassword(String password, String confirmPassword,
      String token, BuildContext context) async {
    if (password != "" && confirmPassword != "") {
      if (password != confirmPassword) {
        print("Passwords do not match");
      } else {
        final url = Uri.parse("$baseUrl/users/firsttimechange");

        final request = await http.post(url,
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },
            body: jsonEncode(<String, String>{'password': password}));

        if (request.statusCode == 200) {
          // Request was successful, parse the response
          final responseData = jsonDecode(request.body);
          print(responseData);
          await storage.writeSecureData(
              'token', jsonEncode(responseData['token']));
          Navigator.pushNamed(context, '/');
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
