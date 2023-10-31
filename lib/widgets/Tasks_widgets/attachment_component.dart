import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class AttachmentComponent extends StatefulWidget {
  const AttachmentComponent({super.key});

  @override
  State<AttachmentComponent> createState() => _AttachmentComponentState();
}

class _AttachmentComponentState extends State<AttachmentComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        CircleAvatar(
          backgroundColor: Colors.blue[100],
          radius: 40,
          child: const Icon(
            FontAwesomeIcons.fileWord,
            color: Colors.blue,
            size: 30,
          ),
        ),
        const Gap(10),
        const Text("file_name_organization_structure_documentation.docx",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue,
            )),
      ]),
    );
  }
}
