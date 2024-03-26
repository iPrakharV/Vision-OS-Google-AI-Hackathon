import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(BattlegroundVisionPro());
}

class BattlegroundVisionPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Battleground Vision Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
