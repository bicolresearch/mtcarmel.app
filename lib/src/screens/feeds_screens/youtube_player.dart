// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:flutter/material.dart';

// class YoutubePlayerScreen extends StatefulWidget {
//   YoutubePlayerScreen({Key key}) : super(key: key);

//   _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
// }

// class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Youtube Player")),
//       body: Center(
//         child: _player(),
//       )
//     );
//   }

//   Widget _player(){
  
//     try{
//       return YoutubePlayer(
//         context: context,
//         videoId:  "eEIC0QOP5JA",
//         // videoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=7IG5kRFIMZw"),
//         // videoId: "nFM8WNwZasw",
//         autoPlay: true,
//         showVideoProgressIndicator: true,
//         videoProgressIndicatorColor: Colors.amber,
//         progressColors: ProgressColors(
//           playedColor: Colors.amber,
//           handleColor: Colors.amberAccent,
//         ),
//         onPlayerInitialized: (controller) {
//           // _controller = controller;
//           // _controller.addListener(listener);
//         },
//       );
//     }
//     catch(e){
//       return Container();
//     }
//   }
// }