/*
*  Filename    :   mass_request_provider.dart
*  Purpose     :	
*  Created     :   2019-08-22 15:01 by Detective Conan
*  Updated     :   2019-08-22 15:01 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/selection_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/mass_request.dart';
import 'package:mt_carmel_app/src/models/selection_api.dart';

class MassRequestProvider with ChangeNotifier {

  static const String _MASS_REQUEST_SELECTION_API = "${AppConstants
      .API_BASE_URL}purpose_mass/";

  List<SelectionApi> _purposeMassSelection = [];

  var _massRequest;

  Future initializedPurposeMassSelection() async {
    final selectionService = locator<SelectionService>();

    await selectionService.getSelection(
        "$_MASS_REQUEST_SELECTION_API")
    .then((value) {
    _purposeMassSelection = value ?? [];
    }).catchError((error) {
    debugPrint(error);
    });
  }


  MassRequest get massRequest => _massRequest;

  set massRequest(MassRequest request) {
    _massRequest = request;
  }

  List<SelectionApi> get purposeMassSelection => _purposeMassSelection;

}

