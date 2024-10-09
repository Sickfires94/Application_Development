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
                color: Colors.teal.shade700,
                width: 2
            )
        ),
        backgroundColor: Colors.teal.shade700,
        title: Text('Space Missions', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
    ),);
  }

}