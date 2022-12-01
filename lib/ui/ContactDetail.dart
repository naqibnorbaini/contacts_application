import 'package:flutter/material.dart';

class ContactDetail extends StatefulWidget {
  const ContactDetail({Key? key}) : super(key: key);

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Contact Detail"),),),
      body: Center(
        child: Column(
          children: [
            Text("Hello")
          ],
        )
      ),
    );
  }
}
