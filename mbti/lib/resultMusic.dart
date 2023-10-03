import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(ResultMusic());
}

class ResultMusic extends StatelessWidget {
  final String videoId = 'jEMe8gRBjLs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(
            mute: false,
            autoPlay: true,
          ),
        ),
        showVideoProgressIndicator: true,
      )),
    );
  }
}
