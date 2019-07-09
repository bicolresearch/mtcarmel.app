/*
*  Filename    :   base_model.dart
*  Purpose     :	
*  Created     :   2019-07-08 14:18 by Detective Conan
*  Updated     :   2019-07-08 14:18 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/core/view_models/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}