/*
*  Filename    :   youtube_player_screen.dart
*  Purpose     :
*  Created     :   2019-07-25 09:16 by Detective Conan
*  Updated     :   2019-08-28 14:54 by Detective conan
*  Changes     :   Returns the screen to portrait only upon exiting.
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  YoutubePlayerScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  YoutubePlayerController _controller = YoutubePlayerController();
  var _seekToController = TextEditingController();
  double _volume = 100;
  bool _muted = true;
  String _playerStatus = "";
  String _errorCode = '0';

  String _videoId = "4NO8Rv7HE8c";

  void listener() {
    if (_controller.value.playerState == PlayerState.ENDED) {}
    setState(() {
      _playerStatus = _controller.value.playerState.toString();
      _errorCode = _controller.value.errorCode.toString();
    });
  }

  @override
  void deactivate() {
    // This pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  YoutubePlayer(
                    context: context,
                    videoId: _videoId,
                    mute: _muted,
                    autoPlay: true,
                    forceHideAnnotation: false,
                    showVideoProgressIndicator: true,
                    videoProgressIndicatorColor: Colors.red,
                    progressColors: ProgressColors(
                      playedColor: Colors.red,
                      handleColor: Colors.redAccent,
                    ),
                    isLive: true,
                    onPlayerInitialized: (controller) {
                      _controller = controller;
                      _controller.addListener(listener);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              onPressed: () {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                                setState(() {});
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                  _muted ? Icons.volume_off : Icons.volume_up),
                              onPressed: () {
                                _muted
                                    ? _controller.unMute()
                                    : _controller.mute();
                                setState(() {
                                  _muted = !_muted;
                                });
                              },
                            ),
                            IconButton(
                                icon: Icon(Icons.fullscreen),
                                onPressed: () => _controller.enterFullScreen()),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Volume",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            Expanded(
                              child: Slider(
                                inactiveColor: Colors.transparent,
                                value: _volume,
                                min: 0.0,
                                max: 100.0,
                                divisions: 10,
                                label: '${(_volume).round()}',
                                onChanged: (value) {
                                  setState(
                                    () {
                                      _volume = value;
                                    },
                                  );
                                  _controller.setVolume(_volume.round());
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: _controller.value.isFullScreen?null:leftArrowBackButton(context: context),
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10.0),
          ),
        ],
      ),
    );
  }
}
