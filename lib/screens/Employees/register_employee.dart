import 'dart:convert';

import 'package:employee_insights/services/create_employee_account_api.dart';
import 'package:employee_insights/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class RegisterEmployee extends StatefulWidget {
  const RegisterEmployee({super.key});

  @override
  State<RegisterEmployee> createState() => RegisterEmployeeState();
}

class RegisterEmployeeState extends State<RegisterEmployee> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _jobRoleController = TextEditingController();
  StorageAccess storage = StorageAccess();
  CreateEmployeeAccountApi createEmployeeAccountApi =
      CreateEmployeeAccountApi();

  Future<void> _createEmployee() async {
    final userToken = await storage.readSecureData('token');
    final Map<String, dynamic> dataMap = jsonDecode(userToken!);

    final String token = dataMap['token'];

    final decodedToken = JwtDecoder.decode(token);

    final organizationName = decodedToken['organization'];

    await createEmployeeAccountApi.createEmployee(
        token,
        _usernameController.text,
        _firstNameController.text,
        _lastnameController.text,
        _roleController.text,
        _emailController.text,
        organizationName,
        _telephoneController.text,
        _jobRoleController.text,
        context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF1ED),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 16,
              ))),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Text(
            "Create Employee Account",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 146, 146, 0)),
          ),
          const Gap(20),
          const SizedBox(
            width: double.infinity,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Color.fromARGB(255, 146, 146, 0),
              child: Icon(
                Icons.person_add_alt_1_rounded,
                size: 65,
                color: Colors.yellowAccent,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(children: [
              const Gap(20),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    icon: Icon(FontAwesomeIcons.solidUser),
                    labelText: "Username",
                    hintText: "Employee's username",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              ),
              const Gap(10),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.label_important),
                    labelText: "First Name",
                    hintText: "Employee's first name",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              ),
              const Gap(10),
              TextFormField(
                controller: _lastnameController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.label_important),
                    labelText: "Last Name",
                    hintText: "Employee's last name",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              ),
              const Gap(10),
              // drops down a list of roles
              DropdownButtonFormField<String>(
                value: _roleController.text.isNotEmpty
                    ? _roleController.text
                    : '--Select Role--',
                decoration: const InputDecoration(
                  icon: Icon(Icons.admin_panel_settings_rounded),
                  labelText: 'Role',
                  contentPadding: EdgeInsets.only(left: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
                items: <String>['--Select Role--', 'admin', 'user']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value, // The value associated with this item
                    child: Text(value), // The text displayed for this item
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    // Update the selected value when the user makes a selection
                    _roleController.text =
                        newValue ?? ''; // Use null-aware operator
                  });
                },
              ),
              const Gap(10),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.email_sharp),
                    labelText: "Email Address",
                    hintText: "Employee's email address",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              ),
              const Gap(10),
              TextFormField(
                controller: _telephoneController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: "Telephone Number",
                    hintText: "Employees Telephone Number",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              ),
              const Gap(10),
              TextFormField(
                controller: _jobRoleController,
                decoration: const InputDecoration(
                    icon: Icon(FontAwesomeIcons.userTie),
                    labelText: "Job Role",
                    hintText: "Employees Job Role",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              )
            ]),
          ),
          const Gap(40),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _createEmployee();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 146, 146, 0),
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                child: const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 16, color: Colors.yellowAccent),
                ),
              ))
        ]),
      ),
    );
  }
}
