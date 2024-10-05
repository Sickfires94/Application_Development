import 'package:first_app/JobList.dart';
import 'package:first_app/appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'bottomBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: topBar(),
      body: JobList(),
      bottomNavigationBar: bottomBar(),
    );

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}

