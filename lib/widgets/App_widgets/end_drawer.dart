import 'package:flutter/material.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  @override
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFEF1ED),
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("JeromeMugita"), // Display user's name
            accountEmail: Text("mugita@gmail.com"), // Display user's email
            currentAccountPicture: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_2_outlined,
                color: Colors.deepOrange,
                size: 40,
              ),
            ),
            decoration: BoxDecoration(
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
              // You can implement your logout logic here
            },
          ),
        ],
      ),
    );
  }
}
