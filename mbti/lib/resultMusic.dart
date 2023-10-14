import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// void main() {
//   runApp(MaterialApp(home: ResultMusic()));
// }

class ResultMusic extends StatelessWidget {
  const ResultMusic({super.key, this.mbti});
  final mbti;
  @override
  Widget build(BuildContext context) {
    
    var playlist = {
      "INFJ": "io0cVw3IxT8",
      "INFP": "RYZMbzksrKA",
      "INTP": "iz4xS8Ff72Y",
      "INTJ": "zIZzfJZAkIU",
      "ISTJ": "oH0rDHpVOlw",
      "ISFJ": "h1w83jr6v7w",
      "ISTP": "pzITbqeA5i4",
      "ISFP": "WCqtFWjCtaM",
      "ESTP": "k3uC15-GoKk",
      "ESFP": "OUUj7aKHPpA",
      "ESTJ": "UvHukCh4_JY",
      "ESFJ": "MpQZMObaueI",
      "ENFP": "w3VV16WEr9k",
      "ENTP": "RH6H0Tb-qsU",
      "ENFJ": "Cf5zMPAWnZo",
      "ENTJ": "FQp8L7mpQig",
    };

    String? videoId = playlist["${mbti}"];

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: videoId ?? 'FQp8L7mpQig' ,
                  flags: YoutubePlayerFlags(
                    mute: false,
                    autoPlay: true,
                  ),
                ),
                showVideoProgressIndicator: true,
              ),
            ),
            Text('***${mbti} 플레이 리스트***'),
          ],
        ),
      ),
    );
  }
}
