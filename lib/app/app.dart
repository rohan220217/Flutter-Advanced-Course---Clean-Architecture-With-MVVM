import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  MyApp._internal(); // Private Named constructor

  static final MyApp instance = MyApp._internal(); // Single Instance

  factory MyApp() =>
      instance; // Factory is used to return the single instance for default constructor

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
