import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/FriendsWidget/FriendsAdd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AuthService.dart';

class login extends StatelessWidget{

  final Set<void> Function(String) redirect;
  const login({super.key,required this.redirect});


  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null){
      return ElevatedButton(onPressed: () async {
        await AuthService().signInWithGoogle();
        redirect("list");
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
              redirect("login");
            }, child: Text("Logout")),
          ],
        ),
      );
    }
  }

}