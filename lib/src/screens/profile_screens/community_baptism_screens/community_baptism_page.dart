/*
*   Filename    :   community_baptism_page.dart
*   Purpose     :
*   Created     :   22/11/2019 9:30 AM by Detective Conan
*   Updated     :   22/11/2019 9:30 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/community_baptism_bloc/community_baptism_bloc.dart';
import 'package:mt_carmel_app/src/blocs/community_baptism_bloc/community_baptism_state.dart';
import 'package:mt_carmel_app/src/screens/community_baptism_screens/community_baptism_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class CommunityBaptismPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityBaptismBloc, CommunityBaptismState>(
      builder: (context, state) {
        if (state is CommunityBaptismLoading ||
            state is CommunityBaptismUninitialized)
          return Scaffold(body: LoadingIndicator());
        if (state is CommunityBaptismLoaded) {
          return CommunityBaptismScreen();
        }
        if (state is CommunityBaptismError) {
          return Scaffold(body: Text("Something went wrong"));
        }
        if (state is NoCommunityBaptismLoaded) {
          return Scaffold(body: Text("No CommunityBaptism Loaded"));
        }
        return Container();
      },
    );
  }
}
