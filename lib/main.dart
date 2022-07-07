import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(
        title: 'Flutter Youtube Video',
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({required this.title, this.url});
  final String title;
  final url;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //now a videonplayer controller
  late YoutubePlayerController _controller;

  //lets intilize our controller
  void runyoutubeplayer() {
    initialvedioId:
    YoutubePlayer.convertUrlToId(widget.url);
    flags:
    YoutubePlayerFlags(
      enableCaption: false,
      isLive: false,
      autoPlay: false,
    );
  }

  @override
  void initState() {
    runyoutubeplayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("this video push and pop so many times")],
            ),
          ),
        );
      },
    );
  }
}
