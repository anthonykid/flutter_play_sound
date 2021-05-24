import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer
      audioPlayer; //This represents a single AudioPlayer, which can play one audio at a time. To play several audios at the same time, you must create several instances of this class.
  String durations = "00:00:00"; //this is the text for the durations

  _MyAppState() {
    audioPlayer =
        AudioPlayer(); //Creates a new instance of Audio Player and assigns an unique id to it.
    audioPlayer.onAudioPositionChanged.listen((duration) {
      //Stream of changes on audio position.
      setState(() {
        //Whenever you change the internal state of a [State] object, make the change in a function that you pass to [setState]:
        durations = duration.toString(); //making the duration turns to string
      });
    });
    audioPlayer.setReleaseMode(
        ReleaseMode.LOOP); //Sets the release mode, keeps playing.
  }

  void playSound(String url) async {
    //await audioPlayer.seek(Duration(seconds: 5)); //this is if you want to start the music from optional seconds
    await audioPlayer.play(url); //Plays an audio.
  }

  void pauseSound() async {
    await audioPlayer.pause(); //Pauses the audio that is currently playing.
  }

  void stopSound() async {
    await audioPlayer.stop(); //Stops the audio that is currently playing.
  }

  void resumeSound() async {
    await audioPlayer
        .resume(); //Resumes the audio that has been paused or stopped, just like calling [play], but without changing the parameters.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo[200],
        appBar: AppBar(
          //Creates a material design app bar.
          leading: Icon(
            Icons
                .music_note, //this is an android icon for putting it at leading icon
            color: Colors.white,
          ),
          title: Text("Playing Music"),
          backgroundColor: Colors.indigo[800],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, //Place the free space evenly between the children as well as before and after the first and last child.
            children: <Widget>[
              //Describes the configuration for an [Element].
              RaisedButton(
                onPressed: () {
                  playSound(
                      "https://ijs.ijjiii.is/c58b31850ac8e9e40f9a9a8d0c0345b8/VzS2yriuQFs/csezczecsznu"); //url for the songs, if you doesnt know where to get this kind of link, you can search how to download a song and before you download it, at the button of the download you copy link address and put it here.
                },
                child: Text("Play"), //this is the text of the button.
              ),
              RaisedButton(
                onPressed: () {
                  pauseSound(); //calling the class.
                },
                child: Text("Pause"), //this is the text of the button.
              ),
              RaisedButton(
                onPressed: () {
                  stopSound(); //calling the class.
                },
                child: Text("Stop"), //this is the text of the button.
              ),
              RaisedButton(
                onPressed: () {
                  resumeSound(); //calling the class.
                },
                child: Text("Resume"), //this is the text of the button .
              ),
              Text(
                "Stay With Me",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
              ), //the title of the songs that i put inside my app
              Text(
                durations, //this is to show the durations
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
