import 'dart:convert';

import 'package:employee_insights/services/storage.dart';
import 'package:employee_insights/services/user_details_api.dart';
import 'package:flutter/material.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  StorageAccess storage = StorageAccess();
  UserDetailsApi userRequest = UserDetailsApi();

  Future<void> logoutUser() async {
    await storage.deleteSecureData('token');
    Navigator.pushNamed(context, '/login');
  }

  Map<String, dynamic> userDetails = {};

  Future<void> fetchUserDetails() async {
    final userToken = await storage.readSecureData('token');
    if (userToken != null && !userToken.contains("User does not exist")) {
      final Map<String, dynamic> dataMap = jsonDecode(userToken!);

      final String token = dataMap['token'];

      final userDetailsData = await userRequest.fetchUserDetails(token);

      setState(() {
        userDetails = userDetailsData;
      });
    }
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
    return Drawer(
      backgroundColor: const Color(0xFFFEF1ED),
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName:
                Text("${userDetails['username']}"), // Display user's name
            accountEmail:
                Text("${userDetails['email']}"), // Display user's email
            currentAccountPicture: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_2_outlined,
                color: Colors.deepOrange,
                size: 40,
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
            ),
          ),
          ListTile(
            title: const Text('Dashboard'),
            leading:
                const Icon(Icons.dashboard_outlined, color: Colors.deepOrange),
            onTap: () {
              // Navigate to the user's profile screen
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Profile'),
            leading:
                const Icon(Icons.person_2_outlined, color: Colors.deepOrange),
            onTap: () {
              // Navigate to the user's profile screen
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            leading: const Icon(Icons.notifications_outlined,
                color: Colors.deepOrange),
            onTap: () {
              // Navigate to the notifications screen
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Messages'),
            leading:
                const Icon(Icons.message_outlined, color: Colors.deepOrange),
            onTap: () {
              // Navigate to the user's profile screen
              Navigator.pushNamed(context, '/messages');
            },
          ),
          ListTile(
            title: const Text('Settings'),
            leading:
                const Icon(Icons.settings_outlined, color: Colors.deepOrange),
            onTap: () {
              // Navigate to the notifications screen
              Navigator.pushNamed(context, '/');
            },
          ),
          const Divider(), // Add a divider between main items and secondary items
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.exit_to_app, color: Colors.deepOrange),
            onTap: () {
              // Perform logout action
              logoutUser();
            },
          ),
        ],
      ),
    );
  }
}
