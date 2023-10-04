import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StatsStrip extends StatefulWidget {
  const StatsStrip({super.key});

  @override
  State<StatsStrip> createState() => _StatsStripState();
}

class _StatsStripState extends State<StatsStrip> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green[200],
              child: const Icon(
                Icons.payments_sharp,
                color: Colors.green,
              ),
            ),
            const Gap(10),
            const SizedBox(
              width: 80,
              child: Text(
                "Total earnings",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.purple[200],
              child: const Icon(
                Icons.task_alt_rounded,
                color: Colors.deepPurple,
              ),
            ),
            const Gap(10),
            const SizedBox(
              width: 80,
              child: Text("Completed Tasks", textAlign: TextAlign.center),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.deepOrange[200],
              child: const Icon(
                Icons.pending_actions_outlined,
                color: Colors.deepOrange,
              ),
            ),
            const Gap(10),
            const SizedBox(
              width: 80,
              child: Text("Pending Tasks", textAlign: TextAlign.center),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red[200],
              child: const Icon(
                Icons.remove,
                color: Colors.red,
              ),
            ),
            const Gap(10),
            const SizedBox(
              width: 80,
              child: Text("Total Deductions", textAlign: TextAlign.center),
            )
          ],
        )
      ],
    );
  }
}
