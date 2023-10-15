// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// void main() {
//   runApp(ResultMusic());
// }

// class ResultMusic extends StatefulWidget {
//   const ResultMusic({super.key, this.mbti});
//   final mbti;

//   @override
//   State<ResultMusic> createState() => _ResultMusicState();
// }

// var _play = false;
// const colorizeColors = [
//   Colors.purple,
//   Colors.blue,
//   Colors.yellow,
//   Colors.red,
// ];
// const colorizeTextStyle = TextStyle(
//   fontSize: 13.0,
//   fontFamily: 'Horizon',
// );

// class _ResultMusicState extends State<ResultMusic> {
//    late WebViewController _webViewController;
//     @override
//   void initState() {
//     super.initState();
//     // Enable debugging if using AndroidWebViewController
//     if (_webViewController.platform is AndroidWebViewController) {
//       AndroidWebViewController.enableDebugging(true);
//     }
//   }

//   var playlist = {
//     "INFJ": "io0cVw3IxT8",
//     "INFP": "RYZMbzksrKA",
//     "INTP": "iz4xS8Ff72Y",
//     "INTJ": "zIZzfJZAkIU",
//     "ISTJ": "oH0rDHpVOlw",
//     "ISFJ": "h1w83jr6v7w",
//     "ISTP": "pzITbqeA5i4",
//     "ISFP": "WCqtFWjCtaM",
//     "ESTP": "k3uC15-GoKk",
//     "ESFP": "OUUj7aKHPpA",
//     "ESTJ": "UvHukCh4_JY",
//     "ESFJ": "MpQZMObaueI",
//     "ENFP": "w3VV16WEr9k",
//     "ENTP": "RH6H0Tb-qsU",
//     "ENFJ": "Cf5zMPAWnZo",
//     "ENTJ": "FQp8L7mpQig",
//   };
//   // final _controller = YoutubePlayerController.fromVideoId(
//   //   videoId: 'io0cVw3IxT8',
//   //   autoPlay: false,
//   //   params: const YoutubePlayerParams(showFullscreenButton: false),
//   // );

//   late final PlatformWebViewControllerCreationParams params;

//   @override
//   Widget build(BuildContext context) {
  

//     String? videoId = playlist["${widget.mbti}"];

//     return Scaffold(
//       body:WebViewWidget(
//         initialUrl: 'https://www.youtube.com/embed/$videoId',
//         onWebViewCreated: (WebViewController webViewController) {
//           _webViewController = webViewController;
//         },

//       // Container(
//       //   child:
//       //   Column(
//       //     children: [
//       //       Row(
//       //         mainAxisSize: MainAxisSize.min,
//       //         mainAxisAlignment: MainAxisAlignment.center,
//       //         crossAxisAlignment: CrossAxisAlignment.center,
//       //         children: [
//       //           AnimatedTextKit(
//       //             animatedTexts: [
//       //               WavyAnimatedText('나의 추천 음악! dumb dumb'),
//       //             ],
//       //             isRepeatingAnimation: _play,
//       //             onTap: () {
//       //               _play = !_play;

//       //               setState(() {});
//       //             },
//       //           ),
//       //           AudioWidget.assets(
//       //             child: IconButton(
//       //               icon: Icon(_play ? Icons.pause : Icons.play_arrow),
//       //               onPressed: () {
//       //                 _play = !_play;

//       //                 setState(() {});
//       //               },
//       //             ),
//       //             path: 'audios/background.mp3',
//       //             play: _play,
//       //           ),
//       //         ],
//       //       ),
//       //       WebViewWidget(
//       //         controller: controller,
//       //       ),
//       //       Text('***${widget.mbti} 플레이 리스트***'),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }
