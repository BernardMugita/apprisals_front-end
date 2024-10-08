import 'dart:convert';

import 'package:employee_insights/services/storage.dart';
import 'package:employee_insights/services/user_details_api.dart';
import 'package:employee_insights/widgets/Dash_widgets/quick_access.dart';
import 'package:employee_insights/widgets/Dash_widgets/recent_tasks.dart';
import 'package:employee_insights/widgets/Dash_widgets/reviews.dart';
import 'package:employee_insights/widgets/Dash_widgets/stats_strip.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  StorageAccess storage = StorageAccess();
  UserDetailsApi userRequest = UserDetailsApi();

  Map<String, dynamic> userDetails = {};

  Future<void> fetchUserDetails() async {
    final userToken = await storage.readSecureData('token');
    if (userToken != null && !userToken.contains("User does not exist")) {
      final Map<String, dynamic> dataMap = jsonDecode(userToken);

      final String token = dataMap['token'];

      final userDetailsData = await userRequest.fetchUserDetails(token);
      // print(userDetailsData);
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
    return Scaffold(
        backgroundColor: const Color(0xFFFEF1ED),
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
          child: Column(
            children: [
              const Gap(50),
              // welcome banner
              Container(
                padding: const EdgeInsets.only(left: 10, right: 0),
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello! Welcome Back",
                          style: TextStyle(
                              fontSize: 14, color: Colors.deepOrange[600]),
                        ),
                        SizedBox(
                          child: Text(
                            "${userDetails['first_name']} ${userDetails['last_name']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 0),
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 255, 192, 109))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        radius: 20,
                        child: const Icon(
                          Icons.search_rounded,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      const SizedBox(
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Search"),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              shape: const CircleBorder()),
                          child: const Icon(Icons.arrow_circle_right))
                    ]),
              ),
              const Gap(20),
              const StatsStrip(),
              const Gap(20),
              const RecentTasks(),
              const Gap(20),
              const QuickAccess(),
              const Gap(20),
              const Reviews()
            ],
          ),
        ));
  }
}
