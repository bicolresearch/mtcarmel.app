/*
*   Filename    :   branch_selection_service.dart
*   Purpose     :
*   Created     :   08/09/2019 1:51 AM by Detective Conan
*   Updated     :   08/09/2019 1:51 AM by Detective Conan
*   Changes     :   
*/

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/branch_selection.dart';

class BranchSelectionService {
  Future<List<BranchId>> getJsonData() async {
    List<BranchId> _branchSelection = [
      BranchId("1", "1", "Mt. Carmel Basilica")
    ];
    // TODO uncomment when api is ready
//    await http
//        .get(/*TODO insert url*/ "")
//        .then(
//          (value) {
//            if (value.statusCode == 200) {
//              _branchSelection = (json.decode(value.body) as List)
//                  .map((data) => new BranchId.fromJson(data))
//                  .toList();
//            } else {
//              throw Exception("Fetching branch selection failed");
//            }
//          },
//        )
//        .timeout(
//          Duration(seconds: 5),
//        )
//        .catchError(
//          (e) {
//            throw e;
//          },
//        );
    return _branchSelection;
  }
}
