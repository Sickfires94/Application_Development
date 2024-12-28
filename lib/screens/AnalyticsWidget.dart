import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnalyticsWidget extends StatelessWidget{

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(50),


      ),
      
      margin: const EdgeInsets.all(5),
      child: Padding(
        
        padding: EdgeInsets.all(20),
        child: Column(
        children: [
          Row(
          children: [
            Column(
              children: [
                Text("Weekly Expense", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                Text("From 1 - 6 Apr, 2024")
              ],
            ),
          SizedBox(width: 10,),
            ElevatedButton(onPressed: (){}, child: Text("View Report"),
            ),
          ],
      ),

          SizedBox(height: 30,),

          Row(children: [
            Container(

              child: Center( child: Text("48%", style: TextStyle(color: Colors.deepPurple, fontSize: 50),)),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: Colors.deepPurpleAccent.shade100,
              ),),

            Column(children: [
              Container(
                child: Center( child: Text("32%", style: TextStyle(color: Colors.green, fontSize: 40),)),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Colors.greenAccent.shade100,
                ),),
              Row(children: [
                Container(
                  child: Center( child: Text("13%", style: TextStyle(color: Colors.red, fontSize: 30),)),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Colors.redAccent.shade100,
                  ),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Container(
                    child: Center( child: Text("7%", style: TextStyle(color: Colors.orange, fontSize: 20),)),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.orangeAccent.shade100,
                    ),),
                    SizedBox(height: 50,)
                  ],

                )
              ],)
            ],)
          ],),


          SizedBox(height: 30,),

          Row(
            children: List.generate(600~/10, (index) => Expanded(
              child: Container(
                color: index%2==0?Colors.transparent
                    :Colors.grey,
                height: 2,
              ),
            )),
          ),


          SizedBox(height: 10,),

          Row(children: [
            Container(height: 10, width: 10, decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.deepPurple,
          ),),
            Column(
              children: [
              Text("Grocery", style: TextStyle(color: Colors.deepPurpleAccent),),
              Text("\$758.20"),
            ],),

            SizedBox(width: 150,),

            Container(height: 10, width: 10, decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.greenAccent,
            ),),
            Column(
              children: [
                Text("Food & Drink", style: TextStyle(color: Colors.greenAccent),),
                Text("\$758.20"),
              ],),

          ],),


          SizedBox(height: 10,),

          Row(
            children: List.generate(600~/10, (index) => Expanded(
              child: Container(
                color: index%2==0?Colors.transparent
                    :Colors.grey,
                height: 2,
              ),
            )),
          ),


          SizedBox(height: 10,),

          Row(children: [
            Container(height: 10, width: 10, decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent,
            ),),

            Column(
              children: [
                Text("Shopping", style: TextStyle(color: Colors.redAccent),),
                Text("\$758.20"),
              ],),

            SizedBox(width: 140,),

            Container(height: 10, width: 10, decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orangeAccent,
            ),),
            Column(
              children: [
                Text("Transportation", style: TextStyle(color: Colors.orangeAccent),),
                Text("\$758.20"),
              ],),

          ],),


        ],

      ),),
    );
  }

}