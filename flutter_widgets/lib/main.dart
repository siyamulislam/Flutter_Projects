import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Homepage());
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Widgets"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("TextButton!"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                  ),
                ),
                //Image.asset('assets/images/1.jpg'),

                ElevatedButton(
                  onPressed: () {},
                  child: Text("ElevatedButton!"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text("OutlinedButton!"),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Image.asset('assets/images/1.jpg'),
              Text("Nature Of World"),
            ],
          )
        ],
      ),
    );
  }
}
