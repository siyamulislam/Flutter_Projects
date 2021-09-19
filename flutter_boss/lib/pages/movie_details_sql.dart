import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_boss/db/sqflite_db.dart';
import 'package:flutter_boss/db/temp_db.dart';
import 'package:flutter_boss/model/movie_model.dart';

class MovieDetails_SQL extends StatefulWidget {
  final int id;
  MovieDetails_SQL(this.id);

  @override
  _MovieDetails_SQLState createState() => _MovieDetails_SQLState();
}
class _MovieDetails_SQLState extends State<MovieDetails_SQL> {
  List<Movies> _movieList = [];
  @override
  Widget build(BuildContext context) {
    DBSQFLiteHelper.getCustomMovie(widget.id).then((value) {
      setState(() {
        _movieList=value;

      });
    });

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }
    final Movies movie = _movieList.firstWhere((element) => element.id == widget.id, orElse: () => null,);
    //print(movie.id);
   // print(movie.image);
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Movie Details"),
        // ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
             stretch: true,
             // floating: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                  background: Hero(tag: movie.id,child: Image.file(File(movie.image,),fit: BoxFit.cover,)),
                  title: Text(
                    movie.name,
                  )),
            ),
             SliverList(delegate: SliverChildListDelegate([
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                   Text(movie.name,style: TextStyle(fontFamily: 'ZenTokyoZoo',fontSize: 35),),
                   Text(movie.category,style: TextStyle(fontSize: 16),),
                   Text(movie.description,style: TextStyle(fontSize: 24),),
                   Text(description,style: TextStyle(fontSize: 14),),
                   Text(description,style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontStyle: FontStyle.italic,fontFamily: 'Quantico',fontSize: 14),),
                   Text(description,style: TextStyle(color: Colors.black,fontWeight:FontWeight.normal,
                   fontStyle: FontStyle.italic,fontFamily: 'ZenTokyoZoo',fontSize: 25),),
                 ],),
               )

             ])),
          ],
        )

        // Container(
        //   child: Column(
        //     children: [
        //       Text(id.toString(),style: Theme.of(context).textTheme.headline1,)
        //     ],
        //   ),
        // ),

        );
  }
}
