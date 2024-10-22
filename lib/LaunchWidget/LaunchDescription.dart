import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LaunchList.dart';
import 'launch_model.dart';

class LaunchDescription extends StatelessWidget{

  int launchIndex;
  LaunchDescription({required this.launchIndex});

  Widget build(BuildContext context) {

    Launch launch = context.watch<LaunchListProvider>().launchList[this.launchIndex];
    if (!launch.show) {
      return Column(children: [
        Text(launch.description ?? "", overflow:TextOverflow.ellipsis),
        Row(
            textDirection: TextDirection.rtl,
            children: [TextButton(
              onPressed: () => {
                context.read<LaunchListProvider>().toggleDescription(launchIndex)
              },

              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey.shade200),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        //side: BorderSide(color: Colors.red),

                      )
                  )
              ),

              child: Row(
                textDirection: TextDirection.rtl,
                children:[
                  Icon(Icons.arrow_downward, size: 30.0,color: Colors.blue),
                  Text("More", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                ],),
            )]),
      ]);
    }
    return Column(children: [
      Text(launch.description ?? ""),
      Row(
          textDirection: TextDirection.rtl,
          children: [
            TextButton(onPressed: () => {
              context.read<LaunchListProvider>().toggleDescription(launchIndex)
            },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey.shade200),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        //side: BorderSide(color: Colors.red),

                      )
                  )
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children:[
                  Icon(Icons.arrow_upward, size: 30.0, color: Colors.blue),
                  Text("Less"),
                ],),
            )]),
    ]);
  }
}
