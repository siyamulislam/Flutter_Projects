import 'package:flutter/material.dart';
import 'package:flutter_boss/db/sqflite_db.dart';
import 'package:flutter_boss/db/temp_db.dart';
import 'package:flutter_boss/model/movie_model.dart';
import 'package:flutter_boss/pages/add_movie.dart';
import 'package:flutter_boss/widgets/movie_item.dart';
import 'package:flutter_boss/widgets/movie_item_custom.dart';
import 'package:flutter_boss/widgets/movie_item_custom_sql.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Movies> _movieList = [];
  bool _isLoading = true;

    reloadHome() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // wITHoUT Future Builder..... as basic rule 1
    // DBSQFLiteHelper.getAllMovie().then((value) {
    //   setState(() {
    //     _movieList=value;
    //     _isLoading=false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Movie List"),
            IconButton(
                onPressed: () {
                  reloadHome();
                },
                icon: Icon(Icons.refresh)),

          ],
        ),
      ),
      body: FutureBuilder(
        future: DBSQFLiteHelper.getAllMovie(),
        builder: (context, AsyncSnapshot<List<Movies>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(child: Text("No data found!"));
            }
            return ListView.builder(
                itemBuilder: (context, ee) =>
                    MovieItemCustom_SQL(e: snapshot.data[ee],refresh: () => reloadHome(),),
                itemCount: snapshot.data.length);
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Failed to Fetch data!"),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),

      // Tarnerri operation static rule 1
      // _isLoading? Center(child: CircularProgressIndicator(),):_movieList.length==0? Center(child: Text("No Data"),):
      // movieList_sql(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddMovie()))
              .then((value) {
            if (value == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Movie Added!"),
                duration: Duration(seconds: 4),
                action: SnackBarAction(label: 'Undo', onPressed: () {}),
              ));
            }
            setState(() {});
          });
        },
        tooltip: "add",
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
      backgroundColor: Colors.grey.shade200,

      //movieList_2(),

      // movieList_1(),
    );
  }

  ListView movieList_2() {
    return ListView.builder(
      itemBuilder: (context, e) => MovieItem(movies[e]),
      itemCount: movies.length,
    );
  }

  ListView movieList_1() {
    return ListView(children: movies.map((e) => MovieItem(e)).toList());
  }

  ListView movieList_3() {
    return ListView(children: movies.map((e) => MovieItemCustom(e)).toList());
  }

  // ListView movieList_sql() {
  //   return ListView(
  //       children: _movieList.map((e) => MovieItemCustom_SQL(e)).toList());
  //
  //   // ListView.builder(
  //   //   itemBuilder: (context, e) => MovieItemCustom(_movieList[e]),
  //   //   itemCount: _movieList.length,
  //   // );
  // }
}
