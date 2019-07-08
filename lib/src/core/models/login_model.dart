/*
*  Filename    :   login_model.dart
*  Purpose     :	
*  Created     :   2019-07-08 13:24 by Detective Conan
*  Updated     :   2019-07-08 13:24 by Detective Conan 
*  Changes     :
*/

import 'package:mt_carmel_app/src/core/models/base_model.dart';
import 'package:mt_carmel_app/src/core/models/view_state.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';


class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);
    var success =  await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}