import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  CustomRoundButton({this.color, this.buttonName, @required this.onPressed});

  final Color color;
  final String buttonName;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed:onPressed,
          minWidth: 100.0,
          height: 42.0,
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

