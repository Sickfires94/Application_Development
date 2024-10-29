import 'dart:convert';
import 'dart:math';

import 'package:first_app/LaunchWidget/LaunchTile.dart';
import 'package:first_app/LaunchWidget/launch_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LaunchList extends StatelessWidget{
  final List<Launch> launches;
  LaunchList({required this.launches});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: launches.length,
            itemBuilder: (c, index){
              Launch launch = launches[index];
              return  LaunchTile(launch: launch);
            })
          // return Center(child: CircularProgressIndicator(),);
        ));
  }
}

