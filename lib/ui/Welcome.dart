import 'package:contacts_application/ui/Home.dart';
import 'package:contacts_application/widgets/buttons.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Welcome"),),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("Welcome!",
                style: TextStyle(fontSize: 50),
              ),

              Text("This is a technical assesment for Vimigo",
              style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("1. There will be two buttons on the next page, Add Contacts and View Contacts buttons",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("2. Add Contact will lead user to a page where the user can add a contact info into the database. User will need contact name and phone number",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("3. View contact will lead user to a page where the user can view the contacts saved and can search for a contact using contact's name. Sort button will sort the contact alphabetically ",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,),
              ),



              CustomButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  title: "Let's go"),
            ],
          ),
        ),
      ),
    );
  }
}
