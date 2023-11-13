import 'dart:convert';

import 'package:employee_insights/services/generate_payslip_api.dart';
import 'package:employee_insights/services/get_employees_api.dart';
import 'package:employee_insights/services/storage.dart';
import 'package:employee_insights/widgets/Payslip_widgets/allowance_item.dart';
import 'package:employee_insights/widgets/Payslip_widgets/deduction_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class CreatePayslips extends StatefulWidget {
  const CreatePayslips({super.key});

  @override
  State<CreatePayslips> createState() => _CreatePayslipsState();
}

class _CreatePayslipsState extends State<CreatePayslips> {
  DateTime? selectedDate = DateTime.now();
  DateTime firstDate = DateTime(DateTime.now().year - 1);
  DateTime lastDate = DateTime(DateTime.now().year + 1);

  final TextEditingController _allowanceNameController =
      TextEditingController();
  final TextEditingController _allowanceAmountController =
      TextEditingController();
  final TextEditingController _deductionNameController =
      TextEditingController();
  final TextEditingController _deductionAmountController =
      TextEditingController();

  List allowanceItems = [];
  List deductionItems = [];

  Map<String, dynamic>? selectedEmployee;

  final TextEditingController _basicSalaryController = TextEditingController();
  StorageAccess storage = StorageAccess();
  GetEmployeesAPI getEmployeesRequest = GetEmployeesAPI();
  List<Map<String, dynamic>> employeeData = [];
// get all employees
  Future<void> getEmployees() async {
    final userToken = await storage.readSecureData('token');
    if (userToken != null && !userToken.contains("User does not exist")) {
      final Map<String, dynamic> dataMap = jsonDecode(userToken);
      final String token = dataMap['token'];
      final employees = await getEmployeesRequest.getEmployees(token);
      setState(() {
        employeeData = employees;
      });
    }
  }

// Date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate!,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // Add allowance item
  void addAllowanceItem() {
    setState(() {
      allowanceItems.add({
        'name': _allowanceNameController.text,
        'amount': _allowanceAmountController.text
      });
      _allowanceNameController.clear();
      _allowanceAmountController.clear();
    });
  }

  // remover allowance item
  void removeAllowanceItem(index) {
    setState(() {
      allowanceItems.removeAt(index);
    });
  }

  // Add deduction item
  void addDeductionItem() {
    setState(() {
      deductionItems.add({
        'name': _deductionNameController.text,
        'amount': _deductionAmountController.text
      });
      _deductionNameController.clear();
      _deductionAmountController.clear();
    });
  }

  // remover deduction item
  void removeDeductionItem(index) {
    setState(() {
      deductionItems.removeAt(index);
    });
  }

  GeneratePayslipAPI generatePayslipRequest = GeneratePayslipAPI();
  bool success = false;
  bool error = false;
  String alertMessage = "";

  // generate payslip
  Future<void> generatePayslip() async {
    final userToken = await storage.readSecureData('token');
    final Map<String, dynamic> dataMap = jsonDecode(userToken!);
    final String token = dataMap['token'];
    final decodedToken = JwtDecoder.decode(token);
    String preparedById = decodedToken['id'];

    try {
      await generatePayslipRequest.createPayslips(
        token,
        selectedEmployee?['id'],
        preparedById,
        DateTime.now().toLocal().toString().split(' ')[0],
        selectedDate.toString().split(' ')[0],
        _basicSalaryController.text,
        'pending',
        deductionItems,
        allowanceItems,
        context,
      );

      setState(() {
        success = true;
        alertMessage = 'Success! Payslip created.';
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          success = false;
          alertMessage = "";
          Navigator.pop(context);
        });
      });
    } catch (e) {
      print(e);
      setState(() {
        error = true;
        alertMessage = "Error generating payslip.";
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          error = false;
          alertMessage = "";
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    String email = selectedEmployee?['email'] ?? '';
    String phone = selectedEmployee?['telephone'] ?? '';
    return Scaffold(
      backgroundColor: const Color(0xFFFEF1ED),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 40),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create Payslip",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Icon(Icons.create_outlined, color: Colors.green),
                ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.green),
            child: const Text(
                "Create Employee payslips using this interface. Simply select an employee from the drop down and wait for their details to load. Add the Basic Salary and make any adjustments on the month's deductions and allowances/additions. Click on 'Create-Slip' to save the employee's payslip.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    height: 1.5,
                    fontWeight: FontWeight.w400)),
          ),
          const Gap(5),
          Container(
            margin: const EdgeInsets.only(top: 3),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.transparent,
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Employee Details",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.person, color: Colors.green),
                ]),
          ),
          const Divider(
            color: Color.fromARGB(105, 76, 175, 79),
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(children: [
              Row(
                children: [
                  const Text("Name", style: TextStyle(fontSize: 16)),
                  const Spacer(),
                  Expanded(
                      child: DropdownButton(
                    hint: const Text(
                      '- - - select employee - - -',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    value: selectedEmployee == {}
                        ? null
                        : selectedEmployee, // Change the type here
                    items: employeeData.map((employee) {
                      return DropdownMenuItem(
                        value:
                            employee, // Change this to the whole employee map
                        child: Text(
                          '${employee['first_name']} ${employee['last_name']}',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedEmployee = value as Map<String, dynamic>;
                      });
                    },
                  ))
                ],
              ),
              Row(
                children: [
                  const Text("Email", style: TextStyle(fontSize: 16)),
                  const Gap(40),
                  Expanded(
                    child: TextFormField(
                      controller: TextEditingController(
                          text: selectedEmployee == null ? '' : email),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 225, 225, 225),
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                          hintText: "Email address",
                          hintStyle: TextStyle(fontSize: 14),
                          border: InputBorder.none),
                    ),
                  )
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  const Text("Phone", style: TextStyle(fontSize: 16)),
                  const Gap(35),
                  Expanded(
                    child: TextFormField(
                      controller: TextEditingController(
                          text: selectedEmployee == null ? '' : phone),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 225, 225, 225),
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                          hintText: "Phone number",
                          hintStyle: TextStyle(fontSize: 14),
                          border: InputBorder.none),
                    ),
                  )
                ],
              )
            ]),
          ),
          const Gap(20),
          Container(
            margin: const EdgeInsets.only(top: 3),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.transparent,
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment Details",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.credit_card_sharp, color: Colors.green),
                ]),
          ),
          const Divider(
            color: Color.fromARGB(105, 76, 175, 79),
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(children: [
              Row(
                children: [
                  const Text("Basic Salary", style: TextStyle(fontSize: 16)),
                  const Gap(35),
                  Expanded(
                    child: TextFormField(
                      controller: _basicSalaryController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 225, 225, 225),
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                          hintText: "Basic Salary",
                          hintStyle: TextStyle(fontSize: 14),
                          border: InputBorder.none),
                    ),
                  )
                ],
              ),
              const Gap(10),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Period:", style: TextStyle(fontSize: 16)),
                    const Gap(10),
                    Row(children: [
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(10)),
                        onPressed: () =>
                            _selectDate(context), // Open date picker
                        child: Row(children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Colors.green,
                          ),
                          const Gap(10),
                          Text(
                            "${selectedDate?.toLocal()}"
                                .split(' ')[0], // Display selected date
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black),
                          )
                        ]),
                      ))
                    ])
                  ],
                ),
              )
            ]),
          ),
          const Gap(20),
          Container(
            margin: const EdgeInsets.only(top: 3),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.transparent,
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Allowances & Bonuses",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_upward, color: Colors.green),
                ]),
          ),
          const Divider(
            color: Color.fromARGB(105, 76, 175, 79),
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            width: double.infinity,
            height: 120,
            color: const Color.fromARGB(255, 225, 225, 225),
            // map the allowanceItems list to the AllowanceItem widget
            child: Column(children: [
              // check if allowanceItems is empty
              if (allowanceItems.isEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: const Text("Empty list",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                )
              else
                for (var allowance in allowanceItems)
                  (AllowanceItem(
                    allowanceItem: allowance,
                  ))
            ]),
          ),
          const Gap(10),
          SizedBox(
            width: double.infinity,
            child: Row(children: [
              Expanded(
                  child: TextFormField(
                controller: _allowanceNameController,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 225, 225, 225),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    hintText: "Allowance name",
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none),
              )),
              const Gap(10),
              Expanded(
                  child: TextFormField(
                controller: _allowanceAmountController,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 225, 225, 225),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    hintText: "amount",
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none),
              ))
            ]),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(children: [
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(10)),
                onPressed: () {
                  addAllowanceItem();
                },
                child: const Text("Add"),
              )),
              const Gap(10),
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.all(10)),
                onPressed: () {},
                child: const Text("Remove"),
              ))
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.transparent,
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Deductions",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_downward, color: Colors.red),
                ]),
          ),
          const Divider(
            color: Color.fromARGB(105, 76, 175, 79),
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            width: double.infinity,
            height: 120,
            color: const Color.fromARGB(255, 225, 225, 225),
            child: Column(children: [
              // check if deductionItems is empty
              if (deductionItems.isEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: const Text("Empty list",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                )
              else
                for (var deduction in deductionItems)
                  (DeductionItem(
                    deductionItem: deduction,
                  ))
            ]),
          ),
          const Gap(10),
          SizedBox(
            width: double.infinity,
            child: Row(children: [
              Expanded(
                  child: TextFormField(
                controller: _deductionNameController,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 225, 225, 225),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    hintText: "Deduction name",
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none),
              )),
              const Gap(10),
              Expanded(
                  child: TextFormField(
                controller: _deductionAmountController,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 225, 225, 225),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    hintText: "amount",
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none),
              ))
            ]),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(children: [
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(10)),
                onPressed: () {
                  addDeductionItem();
                },
                child: const Text("Add"),
              )),
              const Gap(10),
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.all(10)),
                onPressed: () {
                  removeDeductionItem(0);
                },
                child: const Text("Remove"),
              ))
            ]),
          ),
          const Gap(20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(10)),
              onPressed: () {
                generatePayslip();
              },
              child: const Text("Create Payslip"),
            ),
          )
        ]),
      ),
    );
  }
}
