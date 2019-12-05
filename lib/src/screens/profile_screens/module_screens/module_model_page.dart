/*
*   Filename    :   module_model_page.dart
*   Purpose     :
*   Created     :   05/12/2019 10:11 AM by Detective Conan
*   Updated     :   05/12/2019 10:11 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/module_model_bloc/module_model_bloc.dart';
import 'package:mt_carmel_app/src/blocs/module_model_bloc/module_model_event.dart';
import 'package:mt_carmel_app/src/blocs/module_model_bloc/module_model_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/module_screens/module_model_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class ModuleModelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<ModuleModelBloc, ModuleModelState>(
          builder: (context, state) {
            if(state is ModuleModelLoading || state is ModuleModelUninitialized)
              return Scaffold(body: LoadingIndicator());
            if(state is ModuleModelLoaded){
              return ModuleModelScreen();
            }
            if(state is ModuleModelError)
              {
                return _errorDisplay(context);
              }
            if(state is NoModuleModelLoaded)
              {
                return _errorDisplay(context, errorMsg: "No ModuleModel Loaded",
                    buttonLabel: "Reload");
              }
            if(state is ModuleModelNoConnection)
              {
                return _errorDisplay(context, errorMsg: "No Connection");
              }
            return Container();
          },
      )
    ),
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
//                    BlocProvider.of<ModuleModelBloc>(context)
//                        .dispatch(FetchModuleModel());
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
