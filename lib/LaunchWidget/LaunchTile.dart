import 'dart:math';

import 'package:first_app/LaunchWidget/LaunchChip.dart';
import 'package:first_app/LaunchWidget/LaunchDescription.dart';
import 'package:first_app/LaunchWidget/launch_model.dart';
import 'package:flutter/material.dart';

class LaunchTile extends StatefulWidget{

  final Launch launch;
  LaunchTile({required this.launch});

  State<StatefulWidget> createState() => _LaunchTileState();
}

class _LaunchTileState extends State<LaunchTile>{
  @override
  Widget build(BuildContext context) {
    Launch? launch = widget.launch;
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.white10, width: 2), // Add border color and width
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Add margin to space between tiles
      child: ListTile(
        title: Text(launch.missionName ?? ""),
        subtitle: Column(
          children: [
            LaunchDescription(description: launch.description ?? ""),
            Wrap(
              spacing: 20,
              children: launch.payloadIds
              !.map((payloadID) => LaunchChip(payloadID: payloadID)).toList(),
            ),
          ],
        ),
      ),
    );
  }

}