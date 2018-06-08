import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

const String beeUri =
    'https://flutter.github.io/assets-for-api-docs/videos/bee.mp4';

class VideoDetailsActivity extends StatefulWidget {
  @override
  VideoDetailsActivityState createState() {
    return new VideoDetailsActivityState();
  }
}

class VideoDetailsActivityState extends State<VideoDetailsActivity> {
  VideoPlayerController _controller;
  VoidCallback listener;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    _controller = new VideoPlayerController.network(
      'http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4',
    )
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize();
    /* listener = () {
      setState(() {});
    };*/
  }

  void _createVideo() {
    _controller = new VideoPlayerController.network(beeUri)
      ..addListener(listener)
      ..setVolume(1.0)
      ..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            child: (_controller != null
                ? new VideoPlayer(_controller)
                : new Container()),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createVideo();
          _controller.play();
        },
        child: new Icon(Icons.play_arrow),
      ),
    );
  }
}
