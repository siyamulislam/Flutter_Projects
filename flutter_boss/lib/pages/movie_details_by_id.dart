
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boss/db/sqflite_db.dart';
import 'package:flutter_boss/db/temp_db.dart';
import 'package:flutter_boss/model/movie_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'home_page.dart';

class MovieDetailsByID extends StatefulWidget {
   int id;

  MovieDetailsByID(this.id);

  @override
  _MovieDetailsByIDState createState() => _MovieDetailsByIDState();
}

class _MovieDetailsByIDState extends State<MovieDetailsByID> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

      return WillPopScope(
       onWillPop: ()async{
         await Navigator.of(context).pop();
      //   await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
         return true;
       },
       child: Scaffold(
          body: FutureBuilder(
            future: DBSQFLiteHelper.getMovieByID(widget.id),
            builder: (context, AsyncSnapshot <Movies> snapshot){
             // print(snapshot.data.id);
              if(snapshot.hasData){
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      stretch: true,
                      // floating: true,
                      expandedHeight: 300,
                      flexibleSpace: FlexibleSpaceBar(
                          background: Hero(tag: snapshot.data.id,child: Image.file(File(snapshot.data.image),fit: BoxFit.cover,)),
                          title: Text(
                            snapshot.data.name,
                          )),

                      // background: Image.asset(widget.e.image,
                      //     height: 150, width: double.infinity, fit: BoxFit.cover),
                      //   bac
                    ),
                    SliverList(delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data.name,style: TextStyle(fontFamily: 'ZenTokyoZoo',fontSize: 35),),
                            Text(snapshot.data.category,style: TextStyle(fontSize: 16),),
                            Text("Rating: "+snapshot.data.rating.toString(),textAlign:TextAlign.start,style: TextStyle(fontSize: 20),),

                            RatingBar.builder(
                              initialRating: snapshot.data.rating,
                              minRating: 0,
                              itemSize: 28,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              //glow: false,
                              itemCount: 10,
                              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                DBSQFLiteHelper.updateMovieRating(widget.id, rating);
                                setState(() {});
                              },
                            ),

                            SizedBox(height: 20,),
                            Text(snapshot.data.description,style: TextStyle(fontSize: 14),),
                            Text(description,style: TextStyle(fontSize: 14),),
                            Text(description,style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontStyle: FontStyle.italic,fontFamily: 'Quantico',fontSize: 14),),
                            Text(description,style: TextStyle(color: Colors.black,fontWeight:FontWeight.normal,
                                fontStyle: FontStyle.italic,fontFamily: 'ZenTokyoZoo',fontSize: 25),),
                          ],),
                      )

                    ])),
                  ],
                );

              }
              if(snapshot.hasError){
                return Center(
                  child: Text("Failed to Fetch data!"),
                );
              }
              return Center(
                  child: CircularProgressIndicator()
              );
            },


          ),

          // Container(
          //   child: Column(
          //     children: [
          //       Text(id.toString(),style: Theme.of(context).textTheme.headline1,)
          //     ],
          //   ),
          // ),

          ),
     );



  }
  Future _onWillPop() async{
    return Navigator.of(context).pop(true);
  }
}
