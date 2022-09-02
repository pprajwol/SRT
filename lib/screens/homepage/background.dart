import 'package:flutter/material.dart';
import 'package:srtapp/utils/assets.dart';
import 'package:srtapp/utils/size.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          // Background image full
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              Assets.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            child: child,
          ),
        ],
      ),
    );
  }
}
