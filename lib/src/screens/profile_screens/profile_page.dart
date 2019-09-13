/*
*   Filename    :   profile_page.dart
*   Purpose     :
*   Created     :   13/09/2019 10:04 AM by Detective Conan
*   Updated     :   13/09/2019 10:04 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/profile_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:mt_carmel_app/src/blocs/profile_bloc/profile_bloc.dart';
import 'package:mt_carmel_app/src/blocs/profile_bloc/profile_state.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if(state is ProfileLoading || state is ProfileUninitialized)
          return LoadingIndicator();
        if(state is ProfileLoaded){
          return ProfileScreen();
        }
        if(state is ProfileError)
          {
            return ErrorMessage.errMsg(errorMessage: "Something went wrong");
          }
        return Container();
      },
    );
  }
}
