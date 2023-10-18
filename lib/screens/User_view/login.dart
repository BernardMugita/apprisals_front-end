import 'dart:convert';

import 'package:employee_insights/screens/Profile/first_time_change.dart';
import 'package:employee_insights/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  StorageAccess storage = StorageAccess();

  Future<void> authenticateUser(String organization, String username,
      String password, BuildContext context) async {
    final url = Uri.parse('http://10.0.2.2:8000/login');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'company': organization,
        'email': username,
        'password': password
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      final responseData = jsonDecode(response.body);
      final userData = JwtDecoder.decode(responseData['token']);
      print(userData);
      if (userData['has_changed_pass'] == true) {
        await storage.writeSecureData('token', response.body);
        Navigator.pushNamed(context, '/');
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FirstTimeChange(userData: userData),
          ),
        );
      }
    } else {}
  }

  @override
  void initState() {
    super.initState();
    // Call the showLoginInfo dialog when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLoginInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFEF1ED),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Form(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 50),
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.deepOrangeAccent,
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  const Gap(30),
                  const Column(
                    children: [
                      Text(
                        "Welcome to Employee Apprisals!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          "Login to your account",
                          style:
                              TextStyle(color: Color.fromARGB(255, 93, 93, 93)),
                        ),
                      )
                    ],
                  ),
                  const Gap(20),
                  SizedBox(
                    width: 280,
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter Organization name",
                          labelText: "Organization name",
                          icon: const Icon(Icons.business),
                          iconColor: Colors.deepOrange[200],
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                          )),
                      controller: _organizationController,
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    width: 280,
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter your username",
                          labelText: "Username",
                          icon: const Icon(Icons.person),
                          iconColor: Colors.deepOrange[200],
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                          )),
                      controller: _usernameController,
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    width: 280,
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter your password",
                          labelText: "Password",
                          icon: const Icon(Icons.lock),
                          iconColor: Colors.deepOrange[200],
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                          )),
                      obscureText: true,
                      controller: _passwordController,
                    ),
                  ),
                  const Gap(30),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        authenticateUser(
                            _organizationController.text.trim(),
                            _usernameController.text.trim(),
                            _passwordController.text.trim(),
                            context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  showLoginInfo() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: const Color(0xFFFEF1ED),
            icon: const CircleAvatar(
              backgroundColor: Colors.deepOrange,
              radius: 30,
              child: Icon(
                Icons.password,
                size: 30,
                color: Colors.white,
              ),
            ),
            title: const Text(
              "One Time Password",
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.bold),
            ),
            content: const SizedBox(
              width: 200,
              child: Text(
                  "Use the one time password sent to your email to login. Make sure you change it for security reasons."),
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Close",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ));
}
