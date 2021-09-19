import 'package:basic_bhai/grid_builder.dart';
import 'package:basic_bhai/grid_count.dart';
import 'package:basic_bhai/listItem.dart';
import 'package:basic_bhai/widgets/Flexible.dart';
import 'package:basic_bhai/widgets/circle_avater.dart';
import 'package:basic_bhai/widgets/fitted_box.dart';
import 'package:basic_bhai/widgets/rich_text.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  FittedBoxWidget()
    );
  }
}
