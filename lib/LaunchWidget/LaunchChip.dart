import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaunchChip extends StatelessWidget{
  String payloadID;

  LaunchChip({required this.payloadID});

  Widget build(BuildContext context) {
    return Chip(
      color: MaterialStateProperty.all<Color>(Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      label: Text(this.payloadID, style: TextStyle(color: Colors.black, fontSize: 16),),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),);
  }
}
