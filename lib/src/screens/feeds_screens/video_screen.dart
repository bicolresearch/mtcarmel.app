//import 'package:mt_carmel_app/src/constants/app_constants.dart';
//import 'package:video_player/video_player.dart';
//import 'package:flutter/material.dart';
//
//class VideoScreen extends StatefulWidget {
//  @override
//  _VideoScreenState createState() => _VideoScreenState();
//}
//
//class _VideoScreenState extends State<VideoScreen> {
//  VideoPlayerController _controller;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = VideoPlayerController.network(
//        // "https://www.youtube.com/watch?v=7IG5kRFIMZw")
//        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
//      ..initialize().then((_) {
//        _controller.setLooping(true);
//        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//        setState(() {});
//      });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          "Video Screen",
//          style: AppConstants.OPTION_STYLE3,
//        ),
//        toolbarOpacity: 0.5,
//        backgroundColor: Colors.white,
//      ),
//      body: Center(
//        child: Transform.rotate(angle: 3.14/2,
//          child: _controller.value.initialized
//              ? AspectRatio(
//                  aspectRatio: _controller.value.aspectRatio,
//                  child: VideoPlayer(_controller),
//                )
//              :CircularProgressIndicator(),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          setState(() {
//            _controller.value.isPlaying
//                ? _controller.pause()
//                : _controller.play();
//          });
//        },
//        child: Icon(
//          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//        ),
//      ),
//    );
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    _controller.dispose();
//  }
//}
