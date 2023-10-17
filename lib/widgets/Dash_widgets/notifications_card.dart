import 'package:flutter/material.dart';

class NotificationsCard extends StatefulWidget {
  const NotificationsCard({super.key});

  @override
  State<NotificationsCard> createState() => _NotificationsCardState();
}

class _NotificationsCardState extends State<NotificationsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, '/')},
      child: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage('assets/images/teams.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-Transparent Overlay
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: const Color.fromARGB(187, 0, 25, 126),
              borderRadius: BorderRadius.circular(15),
            ), // Change the color and opacity as needed
          ),
          Container(
            color: Colors.transparent,
            height: 120,
            width: double.infinity,
            child: const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Icon(
                      Icons.groups,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Teams",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
