import 'package:employee_insights/screens/Dashboard/dashboard.dart';
import 'package:employee_insights/screens/Employees/employee_apprisal.dart';
import 'package:employee_insights/screens/Employees/employees.dart';
import 'package:employee_insights/screens/Messages/messages.dart';
import 'package:employee_insights/screens/Messages/single_message_view.dart';
import 'package:employee_insights/screens/Payslips/payslips_list.dart';
import 'package:employee_insights/screens/Payslips/single_payslip.dart';
import 'package:employee_insights/screens/Tasks/create_task.dart';
import 'package:employee_insights/screens/Tasks/single_task_view.dart';
import 'package:employee_insights/screens/Tasks/tasks_list.dart';
import 'package:employee_insights/screens/User_view/login.dart';
import 'package:employee_insights/screens/User_view/register.dart';
import 'package:employee_insights/widgets/end_drawer.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const RootApp(currentIndex: 0),
      '/login': (context) => const Login(),
      '/register': (context) => const Register(),
      '/dashboard': (context) => const Dashboard(),
      '/tasks': (context) => const TasksList(),
      '/singletask': (context) => const SingleTaskView(),
      '/createtask': (context) => const CreateNewTask(),
      '/employees': (context) => const EmployeesList(),
      '/employee_apprisal': (context) => const EmployeeApprisal(),
      '/payslips': (context) => const PayslipsList(),
      '/single_slip': (context) => const SinglePayslip(),
      '/messages': (context) => const Messages(),
      '/single_message': (context) => const SingleMessageView(),
    },
  ));
}

class RootApp extends StatefulWidget {
  final int currentIndex;

  const RootApp({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _currentIndex = 0;
  static const List _componentList = [
    Dashboard(),
    TasksList(),
    EmployeesList(),
    PayslipsList(),
    Messages(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(child: _componentList.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 20,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xFF0E3C46),
        unselectedItemColor: const Color(0x760E3C46),
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        onTap: (int newIndex) {
          if (newIndex == 4) {
            // Open the drawer when "More" is tapped
            _scaffoldKey.currentState?.openEndDrawer();
          } else {
            setState(() {
              _currentIndex = newIndex;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Dashboard',
              icon: Icon(
                Icons.dashboard_outlined,
                size: 20,
              )),
          BottomNavigationBarItem(
              label: 'Tasks',
              icon: Icon(
                Icons.task_outlined,
                size: 20,
              )),
          BottomNavigationBarItem(
              label: 'Employees',
              icon: Icon(
                Icons.people_outline_rounded,
                size: 20,
              )),
          BottomNavigationBarItem(
              label: 'Payslips',
              icon: Icon(
                Icons.payment_outlined,
                size: 20,
              )),
          BottomNavigationBarItem(
              label: 'More',
              icon: Icon(
                Icons.reorder_rounded,
                size: 20,
              ))
        ],
      ),
      endDrawer: const EndDrawer(),
      // show end drawer gesture
      endDrawerEnableOpenDragGesture: true,
    );
  }
}
