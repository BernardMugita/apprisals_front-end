import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
                  )
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Don't have OTP?"),
                  GestureDetector(
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
                    child: const Text("Discard"),
                  )),
                  const Gap(10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {},
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
