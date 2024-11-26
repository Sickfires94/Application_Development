import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class friendsAdd extends StatefulWidget{
  final Set<void> Function(String) redirect;
  const friendsAdd({super.key,required this.redirect});
  @override
  State<StatefulWidget> createState() => _friendsAddState();
}

class _friendsAddState extends State<friendsAdd> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController FriendController = TextEditingController();
  TextEditingController EmailController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
      child: Column(
        children: [
          TextFormField(
            controller: FriendController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Friend Name"),
          ),
          TextFormField(
            controller: EmailController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Email"),
          ),
          ElevatedButton(onPressed: _addFriend, child: Text("Add Friend")),
        ],
      ),
    ),);
  }

  Future<void> _addFriend() async {
    FirebaseFirestore.instance
        .collection('Friends')
        .add({
      'FriendName': FriendController.text,
      "Email": EmailController.text
    });
    widget.redirect("list");
  }
}