import 'package:flutter/material.dart';

class SupportServicesScreen extends StatelessWidget {
  static const String routeName = '/SupportServicesScreen';
  const SupportServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support Services'),
      ),
      body: Center(
        child: Text('Immediate Response'),
      ),
    );
  }
}
