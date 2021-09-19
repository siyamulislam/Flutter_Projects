import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Anim extends StatelessWidget {
  const Anim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextLiquidFill(
          text: 'LIQUIDY',
          waveColor: Colors.blueAccent,
          boxBackgroundColor: Colors.black,
          waveDuration: Duration(seconds: 5),
          textStyle: TextStyle(
            fontSize: 60.0,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
    );
  }
}
