/*
*   Filename    :   individual_baptism_page.dart
*   Purpose     :
*   Created     :   22/11/2019 9:18 AM by Detective Conan
*   Updated     :   22/11/2019 9:18 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/individual_baptism_bloc/individual_baptism_bloc.dart';
import 'package:mt_carmel_app/src/blocs/individual_baptism_bloc/individual_baptism_state.dart';
import 'package:mt_carmel_app/src/screens/individual_baptism_screens/individual_baptism_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class IndividualBaptismPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndividualBaptismBloc, IndividualBaptismState>(
      builder: (context, state) {
        if (state is IndividualBaptismLoading ||
            state is IndividualBaptismUninitialized)
          return Scaffold(body: LoadingIndicator());
        if (state is IndividualBaptismLoaded) {
          return IndividualBaptismScreen();
        }
        if (state is IndividualBaptismError) {
          return Scaffold(body: Text("Something went wrong"));
        }
        if (state is NoIndividualBaptismLoaded) {
          return Scaffold(body: Text("No IndividualBaptism Loaded"));
        }
        return Container();
      },
    );
  }
}
