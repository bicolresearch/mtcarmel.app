/*
*  Filename    :   video_list.dart
*  Purpose     :	
*  Created     :   2019-06-21 17:35 by Detective Conan
*  Updated     :   2019-06-21 17:35 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  var videoIds = <String>[
    YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=ZlDSYRbjl_c"),
//    YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=eEIC0QOP5JA"),
    YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=4NO8Rv7HE8c"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video List"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => YoutubePlayer(
          context: context,
          videoId: videoIds[index],
          flags: YoutubePlayerFlags(
            autoPlay: false,
            showVideoProgressIndicator: true,
          ),
        ),
        separatorBuilder: (_, i) => SizedBox(
          height: 10.0,
        ),
        itemCount: videoIds.length,
      ),
    );
  }
}
