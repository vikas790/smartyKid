import 'package:flutter/material.dart';

class MathScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Learn Math'), backgroundColor: Colors.green),
      body: Center(
        child: Text(
          'Math content coming soon!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
