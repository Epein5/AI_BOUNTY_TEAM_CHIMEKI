import 'package:flutter/material.dart';
// import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/instagram_body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: InstagramBody()
    );
  }
}