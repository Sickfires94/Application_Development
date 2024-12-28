import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../Services/JuiceService.dart';

class JuiceCard extends StatelessWidget{
  Juice juice;
  JuiceCard({required this.juice});

  Widget build(BuildContext context) {
    print(juice.imageURL.toString());
    return Container(
        decoration: BoxDecoration(
          color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(50),

    ),
        child: ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // TopBar
          Row(
          children: [
            IconButton(icon: Icon(Icons.arrow_back_ios_new), iconSize: 30.0, onPressed: () {},),
            SizedBox(width: 110),
            Text("Details"),
            SizedBox(width: 110),
            IconButton(icon: Icon(Icons.share), iconSize: 30.0, onPressed: () {},),
          ]
    ),
          SizedBox(height: 50,),
          // Image
          Image(image: NetworkImage(juice.imageURL.toString())),
          SizedBox(height: 100,),

          // Name and Quantity
          Row(
            children: [
              Text(juice.name ?? "Default Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              SizedBox(width: 10),
              Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.red)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {}, child: Text("+", style: TextStyle(fontSize: 20 ),)),
                    Text("2"),
                    TextButton(onPressed: () {}, child: Text("-", style: TextStyle(fontSize: 20 ),)),
                  ],
                ),
              )
            ],
      ),
          Text("Each (" + (juice.weight ?? "No Weight" ) + ")" ),
          Row( children: [
            StarRating(rating: juice.review?.toDouble() ?? 1.1),
            Text("(" + (juice.reviewCount ?? 0).toString() + ")"),
          ]
          ),
          SizedBox(height: 30,),
          Text((juice.Description! + " Read More") ?? ""),
          SizedBox(height: 30,),
          Row (children: [
            Icon(Icons.timer, size: 60, ),
            Column(children: [
              Text("Delivery Time", style: TextStyle(fontWeight: FontWeight.bold),),
              Text(juice.deliveryTime ?? "")
            ],)
          ]),
          SizedBox(height: 60),
          Row(children: [
            Column(children: [
              Text("Total Price"),
              Text("\$" + (juice.price ?? 0).toString(), style: TextStyle(fontWeight: FontWeight.bold), ),
            ],),
            SizedBox(width: 130,),
            SizedBox(width: 150, child:
            TextButton(onPressed: (){}, child: Text("Add to cart", style: TextStyle(color: Colors.white),), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red),), )
            ),],)
        ]

      )
    ),);
  }

}