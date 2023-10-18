import 'package:employee_insights/services/first_pass_change_api.dart';
import 'package:employee_insights/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FirstTimeChange extends StatefulWidget {
  final Map<String, dynamic> userData;

  const FirstTimeChange({required this.userData});

  @override
  State<FirstTimeChange> createState() => _FirstTimeChangeState();
}

class _FirstTimeChangeState extends State<FirstTimeChange> {
  StorageAccess storage = StorageAccess();
  FirstPassChangeAPI passRequest = FirstPassChangeAPI();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String password = "";
  String confirmPassword = "";

  Future<void> changePassword() async {
    final userToken = widget.userData;
    final token = userToken['token'];

    password = _passwordController.text.trim();
    confirmPassword = _confirmPasswordController.text.trim();

    await passRequest.changePassword(password, confirmPassword, token, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFEF1ED),
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
          child: Container(
              padding: EdgeInsets.zero,
              height: 600,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(224, 224, 224, 1)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    const Text("Change your password",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange)),
                    const Gap(30),
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
                          controller: _passwordController,
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
                          controller: _confirmPasswordController,
                        )
                      ],
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                onPressed: () {
                                  changePassword();
                                },
                                child: const Text(
                                  "Change Password",
                                )))
                      ],
                    ),
                  ]),
                ),
              )),
        ));
  }
}
