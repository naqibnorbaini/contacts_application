import 'package:contacts_application/ui/Add%20Contacts.dart';
import 'package:contacts_application/ui/Home.dart';
import 'package:contacts_application/ui/Welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Welcome(),
        builder: (context,child){
        return Scaffold(
          body: Stack(
            children: [
              child!,
              Container(
                child: Image.asset(
                  "assets/image/logo.gif",
                  height: 100.0,
                  width: 100.0,
                ),
                alignment: Alignment.bottomRight,
              ),
            ],
          ),
        );
    },
    );
  }
}

