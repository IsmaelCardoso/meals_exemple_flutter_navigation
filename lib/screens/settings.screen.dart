import 'package:flutter/material.dart';
import 'package:meals_exemple_flutter_navigation/widgets/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
