import 'package:flutter/material.dart';
import 'package:flutter_boss/model/movie_model.dart';

class MovieItem extends StatefulWidget {
  final Movies e;
  MovieItem(this.e);


  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.e.name),
      subtitle: Text(widget.e.category),
      leading: Image.asset(widget.e.image,height: 80,width: 120,fit: BoxFit.cover,),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.red),
          SizedBox(width: 5),
          Text(widget.e.rating.toString()),
        ],
      ),
    );
  }
}
