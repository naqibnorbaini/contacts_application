import 'package:contacts_application/ui/Add%20Contacts.dart';
import 'package:contacts_application/ui/ViewContact.dart';
import 'package:contacts_application/widgets/buttons.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Home")),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddContact()),
                    );
                  },
                  title: "Add Contacts",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewContacts()),
                    );
                  },
                  title: "View Contacts",
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
