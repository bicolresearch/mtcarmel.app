/*
*  Filename    :   church_regular_schedule_service.dart
*  Purpose     :	
*  Created     :   2019-08-30 14:16 by Detective Conan
*  Updated     :   2019-08-30 14:16 by Detective Conan 
*  Changes     :
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/data_schedule.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/schedule.dart';



class ChurchRegularScheduleService {

  List<Schedule> _churchRegularSchedules = [];

  Future<List<Schedule>> getData() async {
    final _branchId = locator<BranchService>().branch.id;
    print("ChurchRegularScheduleService: $_branchId");
    var response = await http
        .get("${AppConstants.CHURCH_SCHEDULE_JSON_URL}?branch_id=$_branchId")
        .timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      _churchRegularSchedules = DataSchedule.fromJson(body).data;
    } else {
      throw Exception("Failure in retrieving schedules");
    }
    return _churchRegularSchedules;
  }

  List<Schedule> get churchRegularSchedules => _churchRegularSchedules;

}