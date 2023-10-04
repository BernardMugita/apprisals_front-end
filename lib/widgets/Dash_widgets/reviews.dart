import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Reviews",
                style: TextStyle(color: Colors.grey[500]),
              )
            ],
          ),
          const Gap(20),
          Row(
            children: [
              const Text("Communication"),
              const Spacer(),
              Row(children: [
                Icon(
                  Icons.star,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star_outline,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star_outline,
                  color: Colors.deepOrange[200],
                ),
              ]),
              const Gap(5),
              const Text("50%")
            ],
          ),
          const Gap(10),
          Row(
            children: [
              const Text("Reliability"),
              const Spacer(),
              Row(children: [
                Icon(
                  Icons.star,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star_outline,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star_outline,
                  color: Colors.deepOrange[200],
                ),
              ]),
              const Gap(5),
              const Text("50%")
            ],
          ),
          const Gap(10),
          Row(
            children: [
              const Text("Adaptability"),
              const Spacer(),
              Row(children: [
                Icon(
                  Icons.star,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star_outline,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star_outline,
                  color: Colors.deepOrange[200],
                ),
              ]),
              const Gap(5),
              const Text("50%")
            ],
          ),
          const Gap(10),
          Row(
            children: [
              const Text("Collaboration"),
              const Spacer(),
              Row(children: [
                Icon(
                  Icons.star,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star_outline,
                  color: Colors.deepOrange[200],
                ),
                Icon(
                  Icons.star_outline,
                  color: Colors.deepOrange[200],
                ),
              ]),
              const Gap(5),
              const Text("50%")
            ],
          ),
        ],
      ),
    );
  }
}
