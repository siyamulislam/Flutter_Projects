
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  var dices = [
    'assets/images/dice/d1.png',
    'assets/images/dice/d2.png',
    'assets/images/dice/d3.png',
    'assets/images/dice/d4.png',
    'assets/images/dice/d5.png',
    'assets/images/dice/d6.png',
  ];
  var n0 = 0, n1 = 1, n2 = 2, n3 = 3, n4 = 4, n5 = 5;
  var random = Random.secure();
  final buttonStyle =ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius:
        BorderRadius.all(Radius.elliptical(20, 20)))),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
    backgroundColor:
    MaterialStateProperty.all(Colors.green.shade900),
  );
  final txtst =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dice Game"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      dices[n0],
                      width: 120,
                      height: 120,
                    ),
                    Image.asset(
                      dices[n1],
                      width: 120,
                      height: 120,
                    ),
                    Image.asset(
                      dices[n2],
                      width: 120,
                      height: 120,
                    ),
                  ],
                ),
              ),
              Container(
                // padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      dices[n3],
                      width: 120,
                      height: 120,
                    ),
                    Image.asset(
                      dices[n4],
                      width: 120,
                      height: 120,
                    ),
                    Image.asset(
                      dices[n5],
                      width: 120,
                      height: 120,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 50),
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Score: ${n0 + 1}+${n3 + 1}= ${n0 + n3 + 2}",
                      style: txtst,
                    ),
                    Text(
                      "Score: ${n1 + 1}+${n4 + 1}= ${n1 + n4 + 2}",
                      style: txtst,
                    ),
        
                    Text(
                      "Score: ${n2 + 1}+${n5 + 1}= ${n2 + n5 + 2}",
                      style: txtst,
                    ),
                  ],
                ),
              ),
        
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _changeDice0();
        
                        _playMusic();
                      },
                      style: buttonStyle,
                      child: Text('Roll',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _changeDice1();
        
                        _playMusic();
                      },
                      style: buttonStyle,
                      child: Text('Roll',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _changeDice2();
        
                        _playMusic();
                      },
                      style: buttonStyle,
                      child: Text('Roll',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
        
                  OutlineButton(
                    onPressed: () {
                     _playMusic3();
                      setState(() {
                         n0 = 0; n1 = 1; n2 = 2; n3 = 3; n4 = 4; n5 = 5;
                      });
                    },
                    child: Text('Reset',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        )),
                  ),
                  MaterialButton(
                    onPressed: () {
        
                      _playMusic2();
                      Navigator.pop(context);
                    },
                    child: Text('Home!',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        )),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  void _changeDice0() {
    setState(() {
      n0 = random.nextInt(6);
      n3 = random.nextInt(6);
      _playNum(n0+n3+2);
    });
  }  void _changeDice1() {
    setState(() {
      n1 = random.nextInt(6);
      n4 = random.nextInt(6);
     // Future.delayed(Duration(seconds: 5));
      _playNum(n1+n4+2);
      //sleep(Duration(seconds:2));
    });
  }  void _changeDice2() {
    setState(() {
      n2 = random.nextInt(6);
      n5 = random.nextInt(6);
      _playNum(n2+n5+2);
    });
  }

  int _playNum(var xx) {

   // AssetsAudioPlayer assetsAudioPlayer= AssetsAudioPlayer();
   // assetsAudioPlayer.open(Audio('assets/audio/$xx.mp3'));
    AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
     //audioPlayer.play('assets/audio/$xx.mp3');
     Future.delayed(Duration(milliseconds: 500),(){
       AudioCache audioCache =AudioCache();

       audioCache.play('audio/$xx.mp3',);
      // audioCache.play('6.mp3');
     });

    return xx;
  }
}

void _playMusic() {
  AudioCache audioCache =AudioCache();
  audioCache.play('audio/clickSnd.wav',);
 }
 //void _playMusic() {
//   AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
//   audioPlayer.play('assets/audio/clickSnd.wav');
// } //audioplayer: ^1.19.1

void _playMusic2() {
  AudioCache audioCache =AudioCache();
  audioCache.play('audio/home.mp3');
}void _playMusic3() {
  AudioCache audioCache =AudioCache();
  audioCache.play('audio/au.mp3');
}


