import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class friendList extends StatelessWidget{

  final Set<void> Function(String) redirect;
  const friendList({super.key,required this.redirect});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              redirect("friendAdd");
            },
          )]
      ),
      body: StreamBuilder(stream: FirebaseFirestore.instance
          .collection('Friends')
          .snapshots(), builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        return ListView.builder(
            itemCount: streamSnapshot.data?.docs.length,
            itemBuilder: (ctx, index) =>
                ListTile(
                  title: Text(streamSnapshot.data?.docs[index]["FriendName"]),
                  subtitle: Text(streamSnapshot.data?.docs[index]["Email"]),
                  trailing: Icon(Icons.delete),
                )
        );
      },),);
  }
}