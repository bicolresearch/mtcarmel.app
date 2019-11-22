/*
*   Filename    :   certificate_page.dart
*   Purpose     :
*   Created     :   22/11/2019 9:05 AM by Detective Conan
*   Updated     :   22/11/2019 9:05 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/certificate_bloc/certificate_bloc.dart';
import 'package:mt_carmel_app/src/blocs/certificate_bloc/certificate_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/certificate_screens/certificate_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class CertificatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CertificateBloc, CertificateState>(
      builder: (context, state) {
        if(state is CertificateLoading || state is CertificateUninitialized)
          return Scaffold(body: LoadingIndicator());
        if(state is CertificateLoaded){
          return CertificateScreen();
        }
        if(state is CertificateError)
          {
            return Scaffold(body: Text("Something went wrong"));
          }
        if(state is NoCertificateLoaded)
          {
            return Scaffold(body: Text("No Certificate Loaded"));
          }
        return Container();
      },
    );
  }
}