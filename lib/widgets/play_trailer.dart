import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayTrailer extends StatefulWidget {
  //final String movieId;
  final String urlVideo;
  PlayTrailer(this.urlVideo);

  @override
  _PlayTrailerState createState() => _PlayTrailerState();
}

class _PlayTrailerState extends State<PlayTrailer> {
  late YoutubePlayerController _controller;

  void _playUtube() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.urlVideo,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        controlsVisibleAtStart: true,
        enableCaption: false,
        isLive: false,
      ),
    );
  }

  @override
  void initState() {
    _playUtube();
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
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (ctx, player) {
          return player;
        });
  }
}
