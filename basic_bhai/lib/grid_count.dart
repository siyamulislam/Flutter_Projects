import 'package:flutter/material.dart';
class GridCount extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.pink.shade400,
        //alignment: Alignment.topRight,
        padding: EdgeInsets.all(10),
        child: GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,

            children:List.generate(1500, (index) =>  Container(color: Colors.blue,alignment: Alignment.center,child: Text('data:${index}')))

        ),
      ),
    );
  }
}