import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AuthService.dart';

class login extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _LoginState();

}

class _LoginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null){
      return ElevatedButton(onPressed: () async {
        await AuthService().signInWithGoogle();
        setState(() {});
      }, child: Text("Google Login"));
    }
    else {
      return Center(
        child: Column(
          children: [
            Text("Logged in"),
            ElevatedButton(onPressed: () async {
              await AuthService().signOutWithGoogle();
              await AuthService().logout();
              setState(() {});
            }, child: Text("Logout")),
          ],
        ),
      );
    }
  }

}