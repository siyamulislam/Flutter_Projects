import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListItem extends StatelessWidget {
  int x=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body:


        Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(15),
              height: 50 ,
              child:
                  ListView.builder(

                    shrinkWrap: false,
                    itemBuilder:(context, index) {
                      return Text("This is: ${index=index+1} ",textAlign: TextAlign.center,);
                    } ,
                    itemCount: 200,
                    scrollDirection: Axis.horizontal,
                    //reverse: true,

              ),
            ),
            Expanded(
              flex: 10,
              //color: Colors.red,
              //height: 60,
              //width: 80,
              child:
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder:(context, index) {
                      return Text("This is: ${x=x+1} ",textAlign: TextAlign.center,);
                    } ,
                    itemCount: 200,
                    scrollDirection: Axis.vertical,
                    //reverse: true,

              ),
            ),
            SizedBox(
             // color: Colors.green,
              height: 40,
              child:
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder:(context, index) {
                      return Text("This is: ${x=x+1} ",textAlign: TextAlign.center,);
                    } ,
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    //reverse: true,

              ),
            ),
          ],
        )



    );
  }
}
