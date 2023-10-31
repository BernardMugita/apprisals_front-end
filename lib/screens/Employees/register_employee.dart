import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class RegisterEmployee extends StatefulWidget {
  const RegisterEmployee({super.key});

  @override
  State<RegisterEmployee> createState() => RegisterEmployeeState();
}

class RegisterEmployeeState extends State<RegisterEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF1ED),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 16,
              ))),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Text(
            "Create Employee Account",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 146, 146, 0)),
          ),
          const Gap(20),
          const SizedBox(
            width: double.infinity,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Color.fromARGB(255, 146, 146, 0),
              child: Icon(
                Icons.person_add_alt_1_rounded,
                size: 65,
                color: Colors.yellowAccent,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(children: [
              const Gap(20),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(FontAwesomeIcons.solidUser),
                    labelText: "Username",
                    hintText: "Employee's username",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              ),
              const Gap(10),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.label_important),
                    labelText: "First Name",
                    hintText: "Employee's first name",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              ),
              const Gap(10),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.label_important),
                    labelText: "Last Name",
                    hintText: "Employee's last name",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              ),
              const Gap(10),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.email_sharp),
                    labelText: "Email Address",
                    hintText: "Employee's email address",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              ),
              const Gap(10),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: "Telephone Number",
                    hintText: "Employees Telephone Number",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              ),
              const Gap(10),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.business_sharp),
                    labelText: "Organization",
                    hintText: "Employee's Organization",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              ),
              const Gap(10),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(FontAwesomeIcons.userTie),
                    labelText: "Job Role",
                    hintText: "Employees Job Role",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Colors.deepOrangeAccent))),
              )
            ]),
          ),
          const Gap(40),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 146, 146, 0),
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                child: const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 16, color: Colors.yellowAccent),
                ),
              ))
        ]),
      ),
    );
  }
}
