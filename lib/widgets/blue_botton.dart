import 'package:flutter/material.dart';

class BlueBotton extends StatelessWidget {

  final String text;
  final Function onPressed;

  const BlueBotton({
    Key key, 
    @required this.text, 
    @required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(top:20),
          child: RaisedButton(
            elevation: 2,
            highlightElevation: 5,
            color: Colors.blue,
            shape: StadiumBorder(),
            onPressed: onPressed,
            child: Container(
              width: double.infinity,
              height: 55,
              child: Center(
                child: Text(this.text, style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        );
  }
}