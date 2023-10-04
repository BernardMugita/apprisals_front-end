import 'package:flutter/material.dart';

class NotificationsCard extends StatefulWidget {
  const NotificationsCard({super.key});

  @override
  State<NotificationsCard> createState() => _NotificationsCardState();
}

class _NotificationsCardState extends State<NotificationsCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('assets/images/notifications.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Semi-Transparent Overlay
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(187, 0, 25, 126),
            borderRadius: BorderRadius.circular(15),
          ), // Change the color and opacity as needed
        ),
        const Positioned(
          top: 30,
          left: 35,
          child: Column(
            children: [
              Text(
                "Notifications",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
