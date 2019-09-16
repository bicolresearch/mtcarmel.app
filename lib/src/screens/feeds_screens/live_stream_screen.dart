/*
*   Filename    :   live_stream_screen.dart
*   Purpose     :
*   Created     :   10/09/2019 5:01 PM by Detective Conan
*   Updated     :   10/09/2019 5:01 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/live_stream_bloc/live_stream_bloc.dart';
import 'package:mt_carmel_app/src/blocs/live_stream_bloc/live_stream_state.dart';
import 'package:mt_carmel_app/src/models/live_stream.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/youtube_player_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class LiveStreamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LiveStreamBloc, LiveStreamState>(
          builder: (context, state) {
        if (state is LiveStreamUninitialized || state is LiveStreamLoading) {
          return Column(
            children: <Widget>[
              Expanded(child: Center(child: LoadingIndicator())),
              leftArrowBackButton(context: context),
              SizedBox(
                height: 20,
              )
            ],
          );
        }
        if (state is LiveStreamLoaded) {
          final LiveStream liveStream = state.liveStream;
          final String videoId =
              (liveStream.data != null && liveStream.data.isNotEmpty)
                  ? liveStream.data[0].videoId
                  : null;
          if (videoId == null || videoId.isEmpty)
            return ErrorMessage.errMsg(errorMessage: "Something Went wrong");
          return YoutubePlayerScreen(videoId: videoId);
        }
        if (state is LiveStreamError) {
          return ErrorMessage.errMsg(errorMessage: "Something Went wrong");
        }
        return Container();
      }),
    );
  }
}
