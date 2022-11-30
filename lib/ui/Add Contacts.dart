import 'package:contacts_application/model/AddContactDB.dart';
import 'package:contacts_application/model/contactmodel.dart';
import 'package:contacts_application/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController userController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();

  String checkin = DateFormat("yyyy-mm-dd hh:mm:ss").format(DateTime.now());

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
                    user = userController.text;
                    phoneNo = phoneNoController.text;

                    var contacts = Contacts(
                      user: user,
                      phone: phoneNo,
                      checkin: checkin
                    );
                    print(contacts);

                    DbManager.db.insertContacts(contacts);
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
