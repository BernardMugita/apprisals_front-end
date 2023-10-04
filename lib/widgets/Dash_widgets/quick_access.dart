import 'package:employee_insights/widgets/Dash_widgets/employees_card.dart';
import 'package:employee_insights/widgets/Dash_widgets/notifications_card.dart';
import 'package:employee_insights/widgets/Dash_widgets/payslips_card.dart';
import 'package:employee_insights/widgets/Dash_widgets/tasks_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class QuickAccess extends StatefulWidget {
  const QuickAccess({super.key});

  @override
  State<QuickAccess> createState() => _QuickAccessState();
}

class _QuickAccessState extends State<QuickAccess> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Gap(15),
            Text(
              "Quick Access",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [EmployeeCard(), TasksCard()],
        ),
        Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [NotificationsCard(), PayslipsCard()],
        )
      ],
    );
  }
}
