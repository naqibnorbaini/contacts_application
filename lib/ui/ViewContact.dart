import 'package:contacts_application/constant.dart';
import 'package:contacts_application/model/AddContactDB.dart';
import 'package:contacts_application/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:contacts_application/constant.dart' as constant;

class ViewContacts extends StatefulWidget {
  @override
  _ViewContactsState createState() => _ViewContactsState();
}

class _ViewContactsState extends State<ViewContacts> {
  @override
  void initState() {
    initView();
    super.initState();
  }

  void initView() async {
    DbManager.db.getContacts().then((value) {
      setState(() {
        constant.contactList = value;
      });
    }).whenComplete(() {
      print(constant.contactList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("View Contacts")),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              CustomButton(
                  onPressed: (){
                    constant.contactList.sort((a, b) => a.toString().compareTo(b.toString()));
                  },
                  title: "Sort"),

              // Row(
              //   children: [
              //     Expanded(
              //       flex: 3,
              //       child: Container(
              //           margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
              //           width: double.infinity,
              //           height: 50,
              //           child: TextField(
              //             decoration: const InputDecoration(
              //               border: OutlineInputBorder(),
              //               labelText: 'Contact Name',
              //             ),
              //             onChanged: (text) {
              //               setState(() {});
              //             },
              //           )),
              //     ),
              //     Expanded(
              //         flex: 1,
              //         child: Container(
              //           margin: EdgeInsets.only(left: 5),
              //           child: RaisedButton(
              //             child: const Text(
              //               "Search",
              //               style: TextStyle(fontSize: 15),
              //             ),
              //             onPressed: () {},
              //             shape: const RoundedRectangleBorder(
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(16.0))),
              //             color: Colors.blue,
              //             textColor: Colors.white,
              //             padding: const EdgeInsets.fromLTRB(15, 8, 15, 10),
              //             splashColor: Colors.grey,
              //           ),
              //         ))
              //   ],
              // ),
              ListView.builder(
                itemCount: constant.contactList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.contacts),
                    title: Text(constant.contactList[index].user),
                    trailing: InkWell(
                        onTap: () {},
                        child: const Icon(Icons.arrow_circle_right)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
