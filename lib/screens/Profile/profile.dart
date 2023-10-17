import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/edit_profile');
            },
            child: const Icon(
              Icons.edit_square,
              color: Colors.deepOrange,
            ),
          ),
          const Gap(15)
        ],
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.deepOrange,
            )),
        backgroundColor: const Color(0xFFFEF1ED),
      ),
      backgroundColor: const Color(0xFFFEF1ED),
      body: Container(
          padding:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.zero,
                child: Center(
                  child: Column(children: [
                    CircleAvatar(
                      backgroundColor: Colors.deepOrange[200],
                      radius: 50,
                      child: const Icon(
                        Icons.person_3_outlined,
                        color: Colors.deepOrange,
                        size: 40,
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      "Philip Ochieng'",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const Gap(10),
                    const Text(
                      "philip@tesla.com",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )
                  ]),
                ),
              ),
              const Gap(30),
              Expanded(
                  child: Container(
                padding: EdgeInsets.zero,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                          backgroundColor: Colors.deepOrange[200],
                          radius: 10,
                          child: const Icon(
                            Icons.person,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          "Role",
                          style: TextStyle(
                              color: Colors.deepOrange[300],
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      const Text("Managing Director")
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                          backgroundColor: Colors.deepOrange[200],
                          radius: 10,
                          child: const Icon(
                            Icons.label,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          "Username",
                          style: TextStyle(
                              color: Colors.deepOrange[300],
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      const Text("POchieng'")
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                          backgroundColor: Colors.deepOrange[200],
                          radius: 10,
                          child: const Icon(
                            Icons.business,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          "Organization",
                          style: TextStyle(
                              color: Colors.deepOrange[300],
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      const Text("Tesla Inc")
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                          backgroundColor: Colors.deepOrange[200],
                          radius: 10,
                          child: const Icon(
                            Icons.phone,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          "Telephone",
                          style: TextStyle(
                              color: Colors.deepOrange[300],
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      const Text("+25479345881")
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                          backgroundColor: Colors.deepOrange[200],
                          radius: 10,
                          child: const Icon(
                            Icons.email_outlined,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          "Work email",
                          style: TextStyle(
                              color: Colors.deepOrange[300],
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      const Text("philip@tesla.com")
                    ],
                  ),
                ]),
              )),
              const Gap(20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2, backgroundColor: Colors.white),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                      Text(
                        "Delete Account",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
