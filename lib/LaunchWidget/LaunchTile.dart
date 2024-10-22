import 'dart:math';

import 'package:first_app/LaunchWidget/LaunchChip.dart';
import 'package:first_app/LaunchWidget/LaunchDescription.dart';
import 'package:first_app/LaunchWidget/launch_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LaunchList.dart';

class LaunchTile extends StatelessWidget{

  final int launchIndex;
  LaunchTile({required this.launchIndex});

  Widget build(BuildContext context) {
    Launch? launch = context.watch<LaunchListProvider>().launchList[launchIndex];;
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
            LaunchDescription(launchIndex: launchIndex),
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
