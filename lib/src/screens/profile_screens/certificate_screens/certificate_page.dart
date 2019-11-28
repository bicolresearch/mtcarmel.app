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
import 'package:mt_carmel_app/src/blocs/certificate_bloc/certificate_event.dart';
import 'package:mt_carmel_app/src/blocs/certificate_bloc/certificate_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/certificate_screens/certificate_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class CertificatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: BlocBuilder<CertificateBloc, CertificateState>(
            builder: (context, state) {
              if (state is CertificateLoading ||
                  state is CertificateUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is CertificateLoaded) {
                return CertificateScreen();
              }
              if (state is CertificateError) {
                return _errorDisplay(context);
              }
              if (state is NoCertificateLoaded) {
                return _errorDisplay(context,
                    errorMsg: "No Certificate Loaded");
              }
              if (state is CertificateNoConnection) {
                return _errorDisplay(context,
                    errorMsg: "No Connection", buttonLabel: "Reload");
              }
              return Container();
            },
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: leftArrowBackButton(context: context),
          ),
        ],
      ),
    );
  }

  Widget _errorDisplay(BuildContext context,
      {String errorMsg = "Something went wrong!",
      String buttonLabel = "Retry"}) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: Text("$errorMsg")),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.brown,
                  child: Text(
                    "$buttonLabel",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    BlocProvider.of<CertificateBloc>(context)
                        .dispatch(FetchCertificate());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
