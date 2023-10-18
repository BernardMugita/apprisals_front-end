import 'dart:convert';

import 'package:employee_insights/services/change_password_api.dart';
import 'package:employee_insights/services/get_otp_api.dart';
import 'package:employee_insights/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  StorageAccess storage = StorageAccess();
  GetOTPAPI otpRequest = GetOTPAPI();
  ChangePasswordAPI changePasswordRequest = ChangePasswordAPI();

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  String newPassword = "";
  String confirmNewPassword = "";
  String otp = "";

  Future<void> getOTP() async {
    final userToken = await storage.readSecureData('token');
    final Map<String, dynamic> dataMap = jsonDecode(userToken!);

    final String token = dataMap['token'];

    await otpRequest.getOTP(token);
  }

  Future<void> changePassword() async {
    final userToken = await storage.readSecureData('token');
    if (userToken != null) {
      final Map<String, dynamic> dataMap = jsonDecode(userToken);

      final String token = dataMap['token'];

      otp = _otpController.text.trim();
      newPassword = _newPasswordController.text.trim();
      confirmNewPassword = _confirmNewPasswordController.text.trim();

      await changePasswordRequest.changePassword(
          otp, newPassword, confirmNewPassword, token, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFEF1ED),
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.deepOrange,
              )),
          backgroundColor: const Color(0xFFFEF1ED),
        ),
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
          child: Center(
              child: Container(
            padding: const EdgeInsets.all(20),
            height: 450,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(224, 224, 224, 1)),
                borderRadius: BorderRadius.circular(15)),
            child: Column(children: [
              const Text("Change your password",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange)),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "OTP Code",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const Gap(5),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Enter OTP code",
                        labelText: "OTP code",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // You can adjust the radius as needed
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(224, 224, 224, 1),
                              width: 1.0, // Change the border width
                            )),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        )),
                    controller: _otpController,
                  )
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Don't have OTP?"),
                  GestureDetector(
                    onTap: () {
                      getOTP();
                    },
                    child: const Text(
                      "Click here",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "New Password",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const Gap(5),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Enter New password",
                        labelText: "New password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // You can adjust the radius as needed
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(224, 224, 224, 1),
                              width: 1.0, // Change the border width
                            )),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        )),
                    controller: _newPasswordController,
                  )
                ],
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Confirm Password",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const Gap(5),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Confirm password",
                        labelText: "Confirm new password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // You can adjust the radius as needed
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(224, 224, 224, 1),
                              width: 1.0, // Change the border width
                            )),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        )),
                    controller: _confirmNewPasswordController,
                  )
                ],
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {},
                    child: const Text("Cancel"),
                  )),
                  const Gap(10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        changePassword();
                      },
                      child: const Text(
                        "Change Password",
                      ))
                ],
              ),
            ]),
          )),
        ));
  }
}
