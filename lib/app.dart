import 'package:flutter/material.dart';
import 'package:greeting_application/scenes/greeting/greeting_scene.dart';

class GreetingApp extends StatelessWidget {
  static const String appTitle = "Greeting App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      home: GreetingScene(),
    );
  }
}
