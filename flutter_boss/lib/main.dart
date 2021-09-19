import 'package:flutter/material.dart';
import 'package:flutter_boss/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily:'Quantico',

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
