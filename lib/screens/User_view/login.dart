import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'MATS',
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Organization name',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Username',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(10)),
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: const Text('Login'),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Register'),
              )
            ],
          )
        ],
      ),
    ));
  }
}
