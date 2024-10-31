import 'package:first_app/ExpressionProviders.dart';
import 'package:first_app/buttonsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class screenWidget extends StatelessWidget{
  Widget build(BuildContext context) {
    return
      Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.all(20),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            context.watch<screenProvider>().getLastNum(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 50
            ),
          ),
          Text(
            context.watch<screenProvider>().expression,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),),
      ],),);
  }

}