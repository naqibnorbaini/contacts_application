
import 'package:flutter/material.dart';


button( BuildContext context, title, route) {
  RaisedButton(
    child:  Text(title, style: const TextStyle(fontSize: 20),),
    onPressed: (){
      Navigator.popAndPushNamed(context, route);
    },
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0))),
    color: Colors.blue,
    textColor: Colors.white,
    padding: const EdgeInsets.fromLTRB(15, 8, 15, 10),
    splashColor: Colors.grey,
  );
}
