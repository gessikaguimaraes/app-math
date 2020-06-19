import 'package:flutter/material.dart';
import 'package:app_math/widgets/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Home(),
    );
  }
}
