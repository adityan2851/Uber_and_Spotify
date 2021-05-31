import 'package:flutter/material.dart';

class ProgessDialog extends StatelessWidget {
  // const ProgessDialog({Key key}) : super(key: key);
  String message;
  ProgessDialog({this.message});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.amberAccent,
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              SizedBox(width: 6,),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
              SizedBox(width: 26,),
              Text(
                message, style: TextStyle(color: Colors.black, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
