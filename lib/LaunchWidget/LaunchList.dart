import 'dart:convert';
import 'dart:math';

import 'package:first_app/LaunchWidget/LaunchTile.dart';
import 'package:first_app/LaunchWidget/launch_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LaunchList extends StatefulWidget{



  @override
  State<StatefulWidget> createState() => _LaunchListState();
}

class _LaunchListState extends State<LaunchList>{
  Future<List<Launch>> fetchAllLaunches() async{
    final response = await http.get(Uri.parse("https://api.spacexdata.com/v3/missions"));
    if(response.statusCode == 200){
      List data = jsonDecode(response.body);
      return data.map((launch) => Launch.fromJson(launch)).toList();
    }
    else throw Exception("Failed to load posts");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(future: fetchAllLaunches(), builder: (context, snap){
          if (snap.hasData){
            print("************************");
            return ListView.builder(
                itemCount: snap.data?.length,
                itemBuilder: (c, index){

                Launch launch = snap.data![index];
                bool _show = true;

                  return  LaunchTile(launch: launch);
            });
          }
          return Center(child: Text("Loading"),);
          // return Center(child: CircularProgressIndicator(),);
        })
      )
    );
  }
}

