import 'package:first_app/HistoryMenu.dart';
import 'package:first_app/buttonsWidget.dart';
import 'package:first_app/ExpressionProviders.dart';
import 'package:first_app/screenWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => screenProvider()),
      ChangeNotifierProvider(create: (_) => historyProvider()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatelessWidget{
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.green),
        ),
        drawer: Drawer(
          child: HistoryList(),
          backgroundColor: Colors.grey.shade900,
        ) ,
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
        children: [
          screenWidget(),
          buttonsWidget(),
        ],)));
  }

}



