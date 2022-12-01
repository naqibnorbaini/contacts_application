import 'package:contacts_application/constant.dart';
import 'package:contacts_application/model/AddContactDB.dart';
import 'package:contacts_application/model/contactmodel.dart';
import 'package:contacts_application/ui/ContactDetail.dart';
import 'package:contacts_application/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:contacts_application/constant.dart' as constant;

class ViewContacts extends StatefulWidget {
  @override
  _ViewContactsState createState() => _ViewContactsState();
}

class _ViewContactsState extends State<ViewContacts> {
  List<Contacts> _foundUser = [];

  @override
  void initState() {
    initView();
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Contacts> result = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        result = constant.contactList;
      });
    } else {
      result = constant.contactList
          .where((user) =>
              user.user.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUser = result;
    });
  }

  void initView() async {
    DbManager.db.getContacts().then((value) {
      setState(() {
        constant.contactList = value;
        _foundUser = value;
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
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        _runFilter(value);
                      },
                      decoration: const InputDecoration(
                          labelText: "Search",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(Icons.sort),
                      iconSize: 30,
                      onPressed: () {
                        constant.contactList.sort((a, b) =>
                            a.user.toString().compareTo(b.user.toString()));
                        setState(() {
                          constant.contactList;
                        });
                      },
                    ))
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: _foundUser.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactDetail(user: _foundUser[index].user, phone: _foundUser[index].phone, checkin: _foundUser[index].checkin,)),
                      );
                    },
                    child: ListTile(
                      leading: const Icon(Icons.contacts),
                      title: Text(_foundUser[index].user),
                      trailing: const Icon(Icons.arrow_circle_right),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
