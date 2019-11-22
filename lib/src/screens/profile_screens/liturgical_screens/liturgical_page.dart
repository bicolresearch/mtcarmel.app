/*
*   Filename    :   liturgical_page.dart
*   Purpose     :
*   Created     :   22/11/2019 9:01 AM by Detective Conan
*   Updated     :   22/11/2019 9:01 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/liturgical_bloc/liturgical_bloc.dart';
import 'package:mt_carmel_app/src/blocs/liturgical_bloc/liturgical_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/liturgical_screens/liturgical_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class LiturgicalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiturgicalBloc, LiturgicalState>(
      builder: (context, state) {
        if (state is LiturgicalLoading || state is LiturgicalUninitialized)
          return Scaffold(body: LoadingIndicator());
        if (state is LiturgicalLoaded) {
          return LiturgicalScreen();
        }
        if (state is LiturgicalError) {
          return Scaffold(body: Text("Something went wrong"));
        }
        if (state is NoLiturgicalLoaded) {
          return Scaffold(body: Text("No Liturgical Loaded"));
        }
        return Container();
      },
    );
  }
}
