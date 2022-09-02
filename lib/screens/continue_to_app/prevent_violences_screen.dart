import 'package:flutter/material.dart';

class PreventViolencesScreen extends StatelessWidget {
  static const String routeName = '/PreventViolencesScreen';
  const PreventViolencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prevent Violences'),
      ),
      body: Center(
        child: Text('Immediate Response'),
      ),
    );
  }
}
