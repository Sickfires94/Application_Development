import 'dart:convert';
import 'dart:math';

import 'package:first_app/LaunchWidget/LaunchTile.dart';
import 'package:first_app/LaunchWidget/launch_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class LaunchList extends StatelessWidget{
  Widget build(BuildContext context) {

    if (context.read<LaunchListProvider>().listSize == 0) {
      context.watch<LaunchListProvider>().fetchAllLaunches();
      return CircularProgressIndicator();
    }

    return Scaffold(
        body: Center(
            child: ListView.builder(itemBuilder: (c, i) {
              return LaunchTile(launchIndex: i);
            }
    )));
  }

}

class LaunchListProvider with ChangeNotifier{
  List<Launch> _launchList = [];
  List<Launch> get launchList => _launchList;
  int get listSize => _launchList.length;

  void toggleDescription(int index){
    _launchList[index].show = !_launchList[index].show;
    notifyListeners();
  }

  void fetchAllLaunches() async{
    final response = await http.get(Uri.parse("https://api.spacexdata.com/v3/missions"));
    if(response.statusCode == 200){
      List data = jsonDecode(response.body);
      _launchList = data.map((launch) => Launch.fromJson(launch)).toList();
      notifyListeners();

    }
    else throw Exception("Failed to load posts");
  }


}

