import '/res.dart';
import 'package:flutter/material.dart';

class GridBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.pink.shade400,
          //alignment: Alignment.topRight,
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 8),
            itemBuilder: (context, index) {
              return Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Image.network(images[index]));
            },
            itemCount: images.length,
          )
          //
          // GridView.count(
          //     crossAxisCount: 5,
          //     crossAxisSpacing: 4,
          //     mainAxisSpacing: 4,
          //
          //     children:List.generate(1500, (index) =>  Container(color: Colors.blue,alignment: Alignment.center,child: Text('data:${index}')))
          //
          // ),
          ),
    );
  }
}
