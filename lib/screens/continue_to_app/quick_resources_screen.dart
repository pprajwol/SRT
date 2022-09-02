import 'package:flutter/material.dart';

class QuickResourcesScreen extends StatelessWidget {
  static const String routeName = '/QuickResourcesScreen';
  const QuickResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Resources'),
      ),
      body: Center(
        child: Text('Immediate Response'),
      ),
    );
  }
}
