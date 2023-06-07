import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: calcPage(),
    );
  }
}

class calcPage extends StatefulWidget {
  const calcPage({super.key});

  @override
  State<calcPage> createState() => _calcPage();
}

class _calcPage extends State<calcPage> {
 



  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatGPT'),
      ),
    );
  }
}

