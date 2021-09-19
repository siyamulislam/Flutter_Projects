import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:layout_design/anim.dart';
import 'package:layout_design/string.dart';
import 'package:layout_design/dice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Basic Layout"),
        ),
        body: ListView(
          children: [
            imageSection(),
            SizedBox(height: 10),
            titleBody(),
            SizedBox(height: 5),
            buildButtonContainer(context),
            SizedBox(height: 10),
            textBody(),
            textTransfrom(context),
            textBody(),
          ],
        ));
  }

  Container buildButtonContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        shape: BoxShape.rectangle,
        // gradient: LinearGradient(
        //   colors: [Colors.blue, Colors.green, Colors.red],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
        gradient: LinearGradient(
          colors: [
            Colors.green.shade500,
            Colors.green.shade700,
            Colors.green.shade900
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(3, 4),
            blurRadius: 4,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.videogame_asset_sharp, color: Colors.white),
              SizedBox(height: 5),

              //FlatButton(onPressed: null, child: Text("data")),

              new GestureDetector(
                onTap: () {
                  _playMusic();
                  // Fluttertoast.showToast(
                  //     msg: "This is Center Short Toast",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.CENTER,
                  //     timeInSecForIosWeb: 2,
                  //     backgroundColor: Colors.red,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0);

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Dice()));

                  final scaffold = ScaffoldMessenger.of(context);
                  scaffold.showSnackBar(
                    SnackBar(
                      content: const Text('WellCome to Dice Game'),
                      action: SnackBarAction(
                          label: 'Ok', onPressed: scaffold.hideCurrentSnackBar),
                    ),
                  );
                },
                child: Text("Dice",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              )
            ],
          ),
          Column(
            children: [
              Icon(Icons.near_me, color: Colors.white),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Anim()));
                },
                child: Text("Route",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
          Column(
            children: [
              Icon(Icons.share, color: Colors.white),
              SizedBox(height: 5),
              Text('Share', style: TextStyle(fontSize: 16, color: Colors.white))
            ],
          )
        ],
      ),
    );
  }

  Container textTransfrom(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.headline3!.fontSize! * 1.1 + 100.0,
      ),
      margin: const EdgeInsets.all(60.0),
      color: Colors.blue[600],
      alignment: Alignment.center,
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('Hello World!',
              textStyle: TextStyle(fontSize: 40, color: Colors.white)),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          print("Tap Event");
        },
      ),

      // Text('Hello World',
      //     style: Theme.of(context)
      //         .textTheme
      //         .headline3!
      //         .copyWith(color: Colors.white)),
      transform: Matrix4.rotationZ(0.1),
    );
  }
}

imageSection() {
  return Image.asset(
    'assets/images/2.png',
    // 'assets/images/1.jpg',
    height: 200,
    width: double.infinity,
    fit: BoxFit.cover,
  );
}

titleBody() {
  return ListTile(
    title: Text("Oeschinen Lake Campground",
        style: TextStyle(fontSize: 20, color: Colors.black)),
    subtitle: Text(
      "Kandersteg, Switzerland",
      style: TextStyle(fontSize: 18),
    ),
    // tileColor: Colors.blue,
    //leading: Icon(Icons.ac_unit),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: Colors.orange,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "41",
          style: TextStyle(fontSize: 18),
        ),
      ],
    ),
  );
}

textBody() {
  return Container(
    padding: const EdgeInsets.all(10.0),
    margin: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      border: Border.all(width: 5, color: Colors.grey.shade500),
    ),
    child: Text(
      decription,
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
  );
}

void _playMusic() {
  // AudioPlayer.logEnabled = true;
  // AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  // audioPlayer.play('assets/audio/intro.mp3');

  AudioCache audioCache = AudioCache();
  audioCache.play(
    'audio/intro.mp3',
  );
}

//void _playMusic() {
//   AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
//   audioPlayer.play('assets/audio/clickSnd.wav');
// } //audioPlayer: ^1.19.1
