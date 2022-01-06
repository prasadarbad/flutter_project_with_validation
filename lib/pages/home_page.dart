import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 50;
  final String name = "diplomachakhazana";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("diplomachakhazana"),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to $days of flutter by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
