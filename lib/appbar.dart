import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class topBar extends AppBar{
  @override
  State<topBar> createState() => _appbarState();
}

class _appbarState extends State<topBar>{
  @override
  Widget build(BuildContext context) {
    return
      Center( child: AppBar(
        shape: Border(
            bottom: BorderSide(
                color: Colors.white60,
                width: 2
            )
        ),
        backgroundColor: Colors.white,
        title: Text('Jobs'),
        actions:  <Widget>[ Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.notifications_none,
              color: Colors.purple,
              size: 30.0,
              semanticLabel: 'Text to announce in accessibility modes',
            )),]
    ),);
  }

}