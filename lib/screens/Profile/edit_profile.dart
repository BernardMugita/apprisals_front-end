import 'dart:convert';

import 'package:employee_insights/services/storage.dart';
import 'package:employee_insights/services/user_details_api.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  StorageAccess storage = StorageAccess();
  UserDetailsApi userRequest = UserDetailsApi();

  String firstname = "";
  String lastname = "";
  String email = "";
  String telephone = "";

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();

  Map<String, dynamic> userDetails = {};

  Future<void> fetchUserDetails() async {
    final userToken = await storage.readSecureData('token');
    final Map<String, dynamic> dataMap = jsonDecode(userToken!);

    final String token = dataMap['token'];

    final userDetailsData = await userRequest.fetchUserDetails(token);

    setState(() {
      userDetails = userDetailsData;
      firstname = userDetails['first_name'];
      lastname = userDetails['last_name'];
      email = userDetails['email'];
      telephone = userDetails['telephone'];
    });
    firstnameController = TextEditingController(text: firstname);
    lastnameController = TextEditingController(text: lastname);
    emailController = TextEditingController(text: email);
    telephoneController = TextEditingController(text: telephone);
  }

  // run function
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchUserDetails();
    });
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
        child: Column(children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(224, 224, 224, 1)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Column(children: [
                const Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
                const Gap(20),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange[200],
                  radius: 50,
                  child: const Icon(
                    Icons.person_3_outlined,
                    color: Colors.deepOrange,
                    size: 40,
                  ),
                ),
                const Gap(10),
                TextButton(
                    style: TextButton.styleFrom(
                        maximumSize: const Size(150, 40),
                        elevation: 2,
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.upload,
                          size: 18,
                          color: Colors.blue,
                        ),
                        Text(
                          "Upload Image",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ))
              ]),
            ),
          ),
          const Gap(3),
          Container(
              width: double.infinity,
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: const Color.fromRGBO(224, 224, 224, 1)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "First name",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const Gap(5),
                      TextFormField(
                        controller: firstnameController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            hintText: "Enter First name",
                            labelText: "First name",
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
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Last name",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const Gap(5),
                      TextFormField(
                        controller: lastnameController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            hintText: "Enter Last name",
                            labelText: "Last name",
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
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email address",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const Gap(5),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            hintText: "Change email address",
                            labelText: "Email address",
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
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Telephone number",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const Gap(5),
                      TextFormField(
                          controller: telephoneController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              hintText: "Change telephone number",
                              labelText: "Telephone number",
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
                              )))
                    ],
                  )
                ],
              )),
          const Gap(20),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {},
                child: const Text("Discard"),
              )),
              const Gap(10),
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {},
                child: const Text(
                  "Save Changes",
                ),
              ))
            ],
          ),
          const Gap(10),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/change_password');
            },
            child: const Text(
              "Change your password?",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ]),
      ),
    );
  }
}
