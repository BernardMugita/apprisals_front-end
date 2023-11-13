import 'dart:convert';
import 'package:employee_insights/screens/Dashboard/dashboard.dart';
import 'package:employee_insights/screens/Employees/employee_apprisal.dart';
import 'package:employee_insights/screens/Employees/employees.dart';
import 'package:employee_insights/screens/Employees/register_employee.dart';
import 'package:employee_insights/screens/Messages/messages.dart';
import 'package:employee_insights/screens/Messages/single_message_view.dart';
import 'package:employee_insights/screens/Payslips/create_payslip.dart';
import 'package:employee_insights/screens/Payslips/payslips_list.dart';
import 'package:employee_insights/screens/Payslips/single_payslip.dart';
import 'package:employee_insights/screens/Profile/change_password.dart';
import 'package:employee_insights/screens/Profile/edit_profile.dart';
import 'package:employee_insights/screens/Profile/profile.dart';
import 'package:employee_insights/screens/Tasks/create_task.dart';
import 'package:employee_insights/screens/Tasks/single_task_view.dart';
import 'package:employee_insights/screens/Tasks/tasks_list.dart';
import 'package:employee_insights/screens/User_view/login.dart';
import 'package:employee_insights/screens/User_view/register.dart';
import 'package:employee_insights/services/storage.dart';
import 'package:employee_insights/widgets/App_widgets/end_drawer.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

StorageAccess storage = StorageAccess();

// Future<bool> checkAuthStatus() async {
//   final token = await storage.readSecureData('token');
//   print(token);
//   return token != null;
// }
//
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final userToken = await storage.readSecureData("token");
  // print(userToken);
  bool isExpired = true;
  if (userToken != null && !userToken.contains("User does not exist")) {
    final Map<String, dynamic> jsonMap = jsonDecode(userToken);
    final String token = jsonMap['token'];
    isExpired = JwtDecoder.isExpired(token);
  }

  Map<String, dynamic> taskDetails = {};

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: isExpired ? '/login' : '/',
    routes: {
      '/': (context) => const RootApp(currentIndex: 0),
      '/login': (context) => const Login(),
      '/register': (context) => const Register(),
      '/dashboard': (context) => const Dashboard(),
      '/tasks': (context) => const TasksList(),
      '/singletask': (context) => SingleTaskView(
            taskDetails: taskDetails,
            onTaskEdited: (Map<String, dynamic> task) {
              taskDetails = task;
            },
          ),
      '/createtask': (context) => const CreateNewTask(),
      '/employees': (context) => const EmployeesList(),
      '/employee_apprisal': (context) =>
          const EmployeeApprisal(employeeEvaluation: {}),
      '/payslips': (context) => const PayslipsList(),
      '/single_slip': (context) => const SinglePayslip(
            payslipDetails: {},
      ),
      '/create_payslips': (context) => const CreatePayslips(),
      '/messages': (context) => const Messages(),
      '/single_message': (context) => const SingleMessageView(),
      '/profile': (context) => const Profile(),
      '/edit_profile': (context) => const EditProfile(),
      '/change_password': (context) => const ChangePassword(),
      '/register_employee': (context) => const RegisterEmployee()
    },
    // onGenerateRoute: (settings) {
    //   return MaterialPageRoute(builder: (context) {
    //     // Use a FutureBuilder to check authentication status
    //     return FutureBuilder<bool>(
    //       future: checkAuthStatus(),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           final isAuthenticated = snapshot.data!;
    //           if (isAuthenticated) {
    //             // User is authenticated, navigate to the requested route
    //             return settings.name == null
    //                 ? const RootApp(currentIndex: 0)
    //                 : const Dashboard(); // Replace with the desired route
    //           } else {
    //             // User is not authenticated, redirect to the login page
    //             return const Login();
    //           }
    //         } else if (snapshot.hasError) {
    //           // Handle the error, e.g., show an error page
    //           return const Text("ErrorPage"); // Create an ErrorPage widget
    //         } else {
    //           // Display a loading indicator while checking the authentication status
    //           return const Text(
    //               " LoadingIndicator()"); // Create a LoadingIndicator widget
    //         }
    //       },
    //     );
    //   });
    // },
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

  final List<Color> _activeColors = [
    const Color.fromRGBO(255, 171, 145, 1), // Home
    Colors.deepOrange, // Search
    const Color.fromARGB(255, 141, 127, 0), // Favorite
    Colors.green, // Profile
  ];

  final List<Color> _inactiveColors = [
    Colors.grey, // Home
    Colors.grey, // Search
    Colors.grey, // Favorite
    Colors.grey, // Profile
  ];

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
        selectedItemColor: _activeColors[_currentIndex],
        unselectedItemColor: _inactiveColors[_currentIndex],
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
