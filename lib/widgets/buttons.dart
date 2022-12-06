
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.onPressed, required this.title});

  final GestureTapCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(title, style: const TextStyle(fontSize: 20, color: Colors.white),),
        onPressed: onPressed,
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(15, 8, 15, 10)),
          foregroundColor: MaterialStatePropertyAll(Colors.blue),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
          ))
        );
  }
}
