import 'package:flutter/material.dart';

class EmployeeApprisal extends StatefulWidget {
  const EmployeeApprisal({super.key});

  @override
  State<EmployeeApprisal> createState() => _EmployeeApprisalState();
}

class _EmployeeApprisalState extends State<EmployeeApprisal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          physics: const AlwaysScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          child: Stack(clipBehavior: Clip.none, children: [
            Container(
              width: double.infinity,
              height: 300,
              margin:
                  const EdgeInsets.only(left: 0, right: 0, top: 40, bottom: 0),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Employee Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Employee Position',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email_outlined, color: Colors.white, size: 20),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Employee Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          )),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                top: 280,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 1, bottom: 1),
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 3))
                      ]),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tasks',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.task_rounded,
                            size: 20,
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        height: 1,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.grey[300]),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.task_alt_rounded,
                                size: 25,
                                color: Colors.deepOrange,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Create UI Components',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'dd/mm/yyyy',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '84%',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.task_alt_rounded,
                                size: 25,
                                color: Colors.deepOrange,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Create UI Components',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'dd/mm/yyyy',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '52%',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.task_alt_rounded,
                                size: 25,
                                color: Colors.deepOrange,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Create UI Components',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'dd/mm/yyyy',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '24%',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Positioned(
              top: 490,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 1, bottom: 1),
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 3))
                    ]),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Feedback',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.feedback_rounded,
                          size: 20,
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      height: 1,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Philip Ochieng',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Create UI Components',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          'view feedback',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
