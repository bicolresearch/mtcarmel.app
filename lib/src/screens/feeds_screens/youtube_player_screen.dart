import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/video_list.dart';
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
    if (_controller.value.playerState == PlayerState.ENDED) {
    }
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Video",
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.video_library,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoList()),
              );
            },
          ),
        ],
      ),
      body: Center(
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
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 14.0,
                    ),
                    onPressed: () {},
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 18.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                progressColors: ProgressColors(
                  playedColor: Colors.red,
                  handleColor: Colors.redAccent,
                ),
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
                          icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                          onPressed: () {
                            _muted ? _controller.unMute() : _controller.mute();
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
//                    SizedBox(
//                      height: 10.0,
//                    ),
//                    TextField(
//                      controller: _seekToController,
//                      keyboardType: TextInputType.number,
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(),
//                        hintText: "Seek to seconds",
//                        suffixIcon: Padding(
//                          padding: EdgeInsets.all(5.0),
//                          child: OutlineButton(
//                            child: Text("Seek"),
//                            onPressed: () => _controller.seekTo(
//                              Duration(
//                                seconds: int.parse(_seekToController.text),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
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
                              setState(() {
                                _volume = value;
                              });
                              _controller.setVolume(_volume.round());
                            },
                          ),
                        ),
                      ],
                    ),
//                    Padding(
//                      padding: EdgeInsets.all(8.0),
//                      child: Text(
//                        "Status: $_playerStatus",
//                        style: TextStyle(
//                          fontWeight: FontWeight.w300,
//                        ),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
//      floatingActionButton: FloatingActionButton(onPressed: (){},
//        child: Icon(Icons.keyboard_arrow_left, color: Colors.white,),
//        backgroundColor: Colors.brown,),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}