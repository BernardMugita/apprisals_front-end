import 'dart:convert';

import 'package:employee_insights/services/get_payslips_api.dart';
import 'package:employee_insights/services/storage.dart';
import 'package:employee_insights/widgets/App_widgets/loading_state.dart';
import 'package:employee_insights/widgets/App_widgets/top_decoration_alternate.dart';
import 'package:employee_insights/widgets/Payslip_widgets/payslip_banner.dart';
import 'package:employee_insights/widgets/Payslip_widgets/payslip_component.dart';
import 'package:flutter/material.dart';

class PayslipsList extends StatefulWidget {
  const PayslipsList({super.key});

  @override
  State<PayslipsList> createState() => _PayslipsListState();
}

class _PayslipsListState extends State<PayslipsList> {
  StorageAccess storage = StorageAccess();
  GetPayslipsAPI payslipsAction = GetPayslipsAPI();
  List<Map<String, dynamic>> payslipData = [];

  bool isLoading = true;
  bool isDataLoaded = false;
  String fetchText = 'Fetching payslips...';

  Future<void> getPayslips() async {
    final userToken = await storage.readSecureData('token');
    final Map<String, dynamic> dataMap = jsonDecode(userToken!);

    final String token = dataMap['token'];

    try {
      setState(() {
        isLoading = true;
      });

      final payslips = await payslipsAction.getPayslips(token);

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          isLoading = false;
          payslipData = payslips;
        });
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getPayslips();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFEF1ED),
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, maximumSize: const Size(160, 40)),
          onPressed: () {
            Navigator.pushNamed(context, '/create_payslips');
          },
          child: const Text("Prepare Payslip"),
        ),
        body: Column(
          children: [
            const TopDecorationAlternate(),
            const PayslipBanner(),
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 2),
              decoration: const BoxDecoration(color: Colors.white),
              child: const Row(
                children: [
                  Text("Jan 2023 - Dec 2023"),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.chevron_left_rounded),
                      Icon(Icons.chevron_right_rounded)
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(1),
              width: double.infinity,
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 2),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: SingleChildScrollView(
                child: Center(
                  child: isLoading
                      ? LoadingState(
                          fetchText: fetchText,
                        )
                      : Column(
                          children: [
                            for (var payslip in payslipData)
                              PayslipComponent(
                                payslipData: payslip,
                              )
                          ],
                        ),
                ),
              ),
            )
          ],
        ));
  }
}
