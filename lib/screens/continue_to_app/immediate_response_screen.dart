import 'package:flutter/material.dart';

class ImmediateResponseScreen extends StatelessWidget {
  static const String routeName = '/immediateResponseScreen';
  const ImmediateResponseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Immediate Response'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Text(
                "Your first priority is to make sure you are safe. You have the right to always feel safe and to call the police if you are in danger. If you feel unsafe or would like immediate support, you can contact the police or someone you trust.",
              ),
              Text(
                "Are you safe?",
                style: Theme.of(context).textTheme.headline5,
              ),
              const Text(
                "Your first priority is to make sure that you are safe. If you feel unsafe, you should contact the police or someone you trust in your family or community.",
              ),
              Text(
                "Are you Hurt?",
                style: Theme.of(context).textTheme.headline5,
              ),
              RichText(
                text: TextSpan(
                  text:
                      "Some sexual assaults can result in injuries. If you are in shock you may not be able to feel the injuries right away. Injuries can also be internal, meaning you may not be able to visually see them. If any of the following have occurred, call an ambulance on Triple Zero (000)",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              // create bullet points
            ],
          ),
        ));
  }
}
