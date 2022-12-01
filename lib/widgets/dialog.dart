
import 'package:flutter/material.dart';

success(BuildContext context, msg) {
  final alert = AlertDialog(
    content: Text(
      msg,
      style: TextStyle(fontSize: 23),
      textAlign: TextAlign.center,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    actions: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FlatButton(
          child: new Text(
            'OK',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          color: Colors.blue,
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          onPressed: ()  {
            Navigator.pop(context);//pop the dialog to show the loading indicator
          },
        ),
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