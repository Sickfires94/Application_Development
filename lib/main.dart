import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/AuthService.dart';
import 'package:first_app/FriendsWidget/FriendList.dart';
import 'package:first_app/FriendsWidget/FriendsAdd.dart';
import 'package:first_app/login.dart';
import 'package:flutter/material.dart';

bool shouldUseFirestoreEmulator = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseFirestore.instance.settings = const Settings(
  //   persistenceEnabled: true,
  // );
  // if (shouldUseFirestoreEmulator) {
  //   FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  // }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String screenState = "list";

  void changeScreen(String state){
    setState(() {
      screenState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(screenState){
    case "Login": return login(redirect: (String screen)=>{changeScreen(screen)});
    case "list": return friendList(redirect: (String screen)=>{changeScreen(screen)});
    case "friendAdd":return friendsAdd(redirect:(String screen)=>{changeScreen(screen)} );
    }
    return login(redirect: (String screen)=>{changeScreen(screen)});
    }
}
