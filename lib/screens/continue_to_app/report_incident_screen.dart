import 'package:flutter/material.dart';

class ReportIncidentScreen extends StatelessWidget {
  static const String routeName = '/ReportIncidentScreen';
  const ReportIncidentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Incident'),
      ),
      body: Center(
        child: Text('Immediate Response'),
      ),
    );
  }
}
