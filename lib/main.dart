import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/AuthService.dart';
import 'package:first_app/Blocs/JuiceBloc.dart';
import 'package:first_app/bottomBar/bottomBar.dart';
import 'package:first_app/bottomBar/bottomBarBloc.dart';
import 'package:first_app/firebase_options.dart';
import 'package:first_app/screens/AnalyticsWidget.dart';
import 'package:first_app/screens/homeScreen.dart';
import 'package:first_app/screens/screen2.dart';
import 'package:first_app/screens/screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home:  BlocProvider(
          create: (context) => JuiceBloc(),
          child: const MyHomePage(title: 'Home')
      ),
      // home: const MyHomePage(title: 'Home')
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade200,

      //Q1 Screen
      // body: homeScreenWidget()

      // Q2 Screen
      body: AnalyticsWidget(),
    );
  }
}
