/*
*  Filename    :   regular_church_schedule_service.dart
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



class RegularChurchScheduleService {

  List<Schedule> _regularChurchSchedules = [];
  final _branchId = locator<BranchService>().branchId;

  Future<List<Schedule>> getJsonData() async {
    var response = await http
        .get("${AppConstants.CHURCH_SCHEDULE_JSON_URL}/?branch_id=$_branchId")
        .timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      _regularChurchSchedules = DataSchedule.fromJson(body).data;
    } else {
      throw Exception("Failure in retrieving schedules");
    }
    return _regularChurchSchedules;
  }

  List<Schedule> get regularChurchSchedules => _regularChurchSchedules;

}