import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context, 'Settings'),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}