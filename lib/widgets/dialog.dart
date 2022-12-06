
import 'package:contacts_application/widgets/buttons.dart';
import 'package:flutter/material.dart';

success(BuildContext context, msg) {
  final alert = AlertDialog(
    content: Text(
      msg,
      style: TextStyle(fontSize: 23),
      textAlign: TextAlign.center,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    actions: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [

        CustomButton(onPressed: (){Navigator.pop(context);}, title: "OK")
      ])
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}