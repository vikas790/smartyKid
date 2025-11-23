import 'package:flutter/material.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Learn Science'), backgroundColor: Colors.blue),
      body: Center(
        child: Text(
          'Science content coming soon!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
