
import 'package:flutter/material.dart';
import 'package:flutter_boss/db/temp_db.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetails extends StatelessWidget {
  final int id;
  MovieDetails(this.id);

  @override
  Widget build(BuildContext context) {
    final movie = movies.firstWhere((element) => element.id == id);
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
                  background: Hero(tag: movie.id,child: Image.asset(movie.image, fit: BoxFit.cover)),
                  title: Text(
                    movie.name,
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
                   Text(movie.name,style: TextStyle(fontFamily: 'ZenTokyoZoo',fontSize: 35),),
                   Text(movie.category,style: TextStyle(fontSize: 16),),
                   Text(movie.rating.toString(),style: TextStyle(fontSize: 16),),


                   Text(description,style: TextStyle(fontSize: 14),),
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
