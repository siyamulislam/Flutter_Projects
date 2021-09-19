import 'package:flutter/material.dart';
import 'package:flutter_boss/model/movie_model.dart';
import 'package:flutter_boss/pages/movie_details.dart';

class MovieItemCustom extends StatefulWidget {
  final Movies e;

  MovieItemCustom(this.e);

  @override
  _MovieItemCustomState createState() => _MovieItemCustomState();
}

class _MovieItemCustomState extends State<MovieItemCustom> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MovieDetails(widget.e.id)));
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
                  child: Hero(tag: widget.e.id,
                    child: Image.asset(widget.e.image,
                        height: 150, width: double.infinity, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black.withOpacity(0.35),
                    ),
                    child: Text(
                      'Rank: ' + widget.e.id.toString() + '',
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
                            Icon(Icons.category, color: Colors.green, size: 12),
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
                          Icon(Icons.date_range, color: Colors.blue, size: 18),
                          SizedBox(width: 5),
                          Text(widget.e.releaseDate.toString(),
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
                        child: Icon(widget.e.isfav? Icons.favorite:Icons.favorite_outline ,
                            color: Colors.red, size: 30),
                        onTap: () {
                          setState(() {
                            widget.e.isfav = !widget.e.isfav;
                            //widget.e.isfav?  widget.e.isfav=false: widget.e.isfav=true;
                           // widget.e.isfav=true;


                          });
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
}
