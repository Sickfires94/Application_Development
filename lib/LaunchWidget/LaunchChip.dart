import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaunchChip extends StatefulWidget{
  String payloadID;

  LaunchChip({required this.payloadID});

  State<StatefulWidget> createState() => _LaunchChipState();
}

class _LaunchChipState extends State<LaunchChip>{
  @override
  Widget build(BuildContext context) {
   return Chip(
     color: MaterialStateProperty.all<Color>(Colors.primaries[Random().nextInt(Colors.primaries.length)]),
     label: Text(widget.payloadID, style: TextStyle(color: Colors.black, fontSize: 16),),
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),);
  }

}