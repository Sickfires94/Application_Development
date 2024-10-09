import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaunchDescription extends StatefulWidget{

  String description;
  LaunchDescription({required this.description});

  @override
  State<StatefulWidget> createState() => _LaunchDescriptionState();
}

class _LaunchDescriptionState extends State<LaunchDescription>{
  bool _show = false;

  @override
  Widget build(BuildContext context) {
      if (!_show) {
        return Column(children: [
          Text(widget.description, overflow:TextOverflow.ellipsis),
          Row(
            textDirection: TextDirection.rtl,
            children: [TextButton(
              onPressed: () => {
              setState(() {
                _show = true;
              })},

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
        Text(widget.description),
        Row(
        textDirection: TextDirection.rtl,
        children: [
        TextButton(onPressed: () => {
          setState(() {
            _show = false;
          })

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