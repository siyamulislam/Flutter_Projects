import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_boss/db/sqflite_db.dart';
import 'package:flutter_boss/model/movie_model.dart';
import 'package:flutter_boss/pages/movie_details_by_id.dart';
import 'package:intl/intl.dart';

class MovieItemCustom_SQL extends StatefulWidget {
  final Movies e;
  int isfavv;
  final VoidCallback refresh;

  //final VoidCallback? onCountSelected; with ns
  MovieItemCustom_SQL({this.e,this.refresh});
  //MovieItemCustom_SQL(this.e);

  @override
  _MovieItemCustom_SQLState createState() => _MovieItemCustom_SQLState();
}

class _MovieItemCustom_SQLState extends State<MovieItemCustom_SQL> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.e.id),
      //background: Text("fffffffffffff"),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.grey.withOpacity(.3),
          borderRadius: BorderRadius.circular(20),
    
    ),
        child: Icon(Icons.delete_forever,size: 80,color: Colors.red,),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        DBSQFLiteHelper.deleteMovieByID(widget.e.id).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Movie Deleted"),
            duration: Duration(seconds: 4),
            action: SnackBarAction(label: 'Undo', onPressed: () {}),
          ));
        });
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
         // barrierDismissible: true,
         // barrierColor: Colors.red.withOpacity(.5),
          builder: (context) {
            return AlertDialog(
              title: Row(children: [
                Icon(Icons.delete_forever,color: Colors.red,size: 40,),
                Text("Delete ${widget.e.name}!",style:  TextStyle(color: Colors.black),)
              ],),
              content: Text("Are you sre to delete this item?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text("CANCEL")),
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text("CONFIRM"))
              ],
              elevation: 5,
            );
          },
        );
      },
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              //MaterialPageRoute(builder: (context) => MovieDetails(widget.e.id)));
              MaterialPageRoute(builder: (context) => MovieDetailsByID(widget.e.id))).then((value) {
          // Future.delayed(Duration(milliseconds: 3000),(){
          //
          //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          // });
            //widget.onCountSelected!(); with null safety
            widget.refresh();
          });
        },
        child: Card(
          shadowColor: Colors.blue,
          color: Colors.blueGrey.shade100,
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child: Hero(
                      tag: widget.e.id,
                      child: Image.file(File(widget.e.image),
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 5,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black.withOpacity(0.35),
                      ),
                      child: FittedBox(
                        child: Text(
                          'Rank: ' + widget.e.id.toString() + '',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Text('Name: ' + widget.e.name),
                          Text(
                            widget.e.name,
                            style: Theme.of(context).textTheme.headline6,
                          ),

                          Row(
                            children: [
                              Icon(Icons.category,
                                  color: Colors.green, size: 12),
                              SizedBox(width: 5),
                              Text(widget.e.category,
                                  style: Theme.of(context).textTheme.bodyText2),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Text('Name: ' + widget.e.name),
                            Icon(Icons.star, color: Colors.red, size: 18),
                            SizedBox(width: 5),
                            Text(widget.e.rating.toString(),
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Text('Name: ' + widget.e.name),
                            Icon(Icons.date_range,
                                color: Colors.blue, size: 18),
                            SizedBox(width: 5),
                            Text(
                                DateFormat('MM, yyyy').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        widget.e.releaseDate)),
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Text('Name: ' + widget.e.name),

                        SizedBox(width: 15),
                        GestureDetector(
                          child: Icon(
                              widget.e.isfav
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Colors.red,
                              size: 30),
                          onTap: () {
                            _changeFav();
                            if (widget.e.isfav) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Add to favorite!"),
                                duration: Duration(seconds: 7),
                                action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () => _changeFav()),
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Remove to Favorite!"),
                                duration: Duration(seconds: 7),
                                action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () => _changeFav()),
                              ));
                            }
                            ;
                          },
                        ),

                        SizedBox(width: 5),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    //ListTile(
    //   title: Text(widget.e.name),
    //   subtitle: Text(widget.e.category),
    //   leading: Image.asset(widget.e.image,height: 80,width: 120,fit: BoxFit.cover,),
    //   trailing: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Icon(Icons.star, color: Colors.red),
    //       SizedBox(width: 5),
    //       Text(widget.e.rating.toString()),
    //     ],
    //   ),
    // );
  }

  _changeFav() {
    setState(() {
      DBSQFLiteHelper.updateMovieFav(widget.e.id, widget.e.isfav);
      widget.e.isfav = !widget.e.isfav;
    });
  }
}
