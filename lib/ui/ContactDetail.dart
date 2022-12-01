import 'package:flutter/material.dart';

class ContactDetail extends StatefulWidget {
  final String user;
  final String phone;
  final String checkin;
  const ContactDetail(
      {Key? key,
      required this.user,
      required this.phone,
      required this.checkin})
      : super(key: key);

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Contact Detail"),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          const Icon(
            Icons.contact_phone,
            size: 200,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Text("User : " + widget.user,
                    style: const TextStyle(fontSize: 20)),
                Text("Phone No : " + widget.phone,
                    style: const TextStyle(fontSize: 20)),
                Text("Check-In : " + widget.checkin,
                    style: const TextStyle(fontSize: 20)),
              ],
            ),
          )
        ],
      )),
    );
  }
}
