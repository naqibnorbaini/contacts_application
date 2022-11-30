import 'package:contacts_application/widgets/buttons.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController userController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();

  String user = "";
  String phoneNo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Add Contacts"),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: userController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact Name',
                    ),
                    onChanged: (text) {
                      setState(() {
                        user = userController.toString();
                      });
                    },
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: phoneNoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                    ),
                    onChanged: (text) {
                      setState(() {
                        phoneNo = phoneNoController.toString();
                      });
                    },
                  )),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton(
                  title: "Submit",
                  onPressed: (){

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
