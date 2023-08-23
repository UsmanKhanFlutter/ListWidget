import 'package:flutter/material.dart';
import 'package:list_task/ListWidget/list_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Persistent List'),
        ),
        body: const ListWidget(),
      ),
    );
  }
}
