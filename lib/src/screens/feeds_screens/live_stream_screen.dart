/*
*   Filename    :   live_stream_screen.dart
*   Purpose     :
*   Created     :   10/09/2019 5:01 PM by Detective Conan
*	 Updated			:   17/09/2019 5:58 PM PM by Detective Conan
*	 Changes			:   Placed arrow back button for every state
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

class LiveStreamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<LiveStreamBloc, LiveStreamState>(
                builder: (context, state) {
              if (state is LiveStreamUninitialized ||
                  state is LiveStreamLoading) {
                return Center(
                  child: LoadingIndicator(),
                );
              }
              if (state is LiveStreamLoaded) {
                final LiveStream liveStream = state.liveStream;
                final String videoId =
                    (liveStream.data != null && liveStream.data.isNotEmpty)
                        ? liveStream.data[0].videoId
                        : null;
                if (videoId == null || videoId.isEmpty)
                  return ErrorMessage.errMsg(
                      errorMessage: "Something Went wrong");
                return YoutubePlayerScreen(videoId: videoId);
              }
              if (state is LiveStreamError) {
                return ErrorMessage.errMsg(
                    errorMessage: "Something Went wrong");
              }
              return Container();
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: leftArrowBackButton(context: context),
          ),
        ],
      ),
    );
  }
}
