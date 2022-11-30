
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.onPressed, required this.title});

  final GestureTapCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
      child:  Text(title, style: const TextStyle(fontSize: 20),),
      onPressed: onPressed,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      color: Colors.blue,
      textColor: Colors.white,
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 10),
      splashColor: Colors.grey,
    );
  }
}
