import 'package:flutter/material.dart';

class Label extends StatelessWidget {

  final String path;
  final String question;
  final String pathText;

  const Label({
    Key key, 
    @required this.path,
    @required this.question,
    @required this.pathText
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(this.question, style: TextStyle(color: Colors.black54)),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context, this.path);
            },
            child: Text(this.pathText,
                style: TextStyle(
                    color: Colors.blue[600], fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
