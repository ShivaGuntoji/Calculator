import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  MyButton({this.color, this.textColor, this.buttonText,this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
      color: Colors.deepPurple.shade100,
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.deepPurple.shade100)),
      elevation: 0.0,
      hoverElevation: 2.0,
      padding: EdgeInsets.all(8),
      onPressed: buttonTapped,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
          child: Container(
            color:color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor,fontSize: 20 ),
              ),
            ),
          ),
      ),
    );
  }
}

