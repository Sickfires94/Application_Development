import 'package:first_app/ExpressionProviders.dart';
import 'package:first_app/buttonsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: context.watch<historyProvider>().history.length,
        itemBuilder: (c, i){
      var _item = context.watch<historyProvider>().history[i];
      return  Card(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          color: Colors.grey.shade800,
          child: ListTile(
        title: Text(_item.result,
          style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),),
        subtitle: Text(_item.expression,
          style: TextStyle(
          color: Colors.red,
            fontSize: 20,
      ),),),);
    });
  }
  
}