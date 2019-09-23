/*
*   Filename    :   live_stream_bloc.dart
*   Purpose     :
*   Created     :   10/09/2019 3:45 PM by Detective Conan
*   Updated     :   10/09/2019 3:45 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/live_stream_bloc/live_stream_event.dart';
import 'package:mt_carmel_app/src/blocs/live_stream_bloc/live_stream_state.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/live_stream.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LiveStreamBloc extends Bloc<LiveStreamEvent, LiveStreamState> {
  @override
  LiveStreamState get initialState => LiveStreamUninitialized();

  @override
  Stream<LiveStreamState> mapEventToState(LiveStreamEvent event) async* {
    if (event is FetchLiveStream) {
      yield LiveStreamLoading();
      try {
        final liveStream = await _fetchData();
        yield LiveStreamLoaded(liveStream);
      } catch (e) {
        if (e.toString().contains("No connection")) {
          yield LiveStreamNoConnection();
          return;
        }
        yield LiveStreamError(Exception("$e"));
      }
    }
  }

  Future<LiveStream> _fetchData() async {


    final hasConnection = await ConnectivityChecker.hasDataConnection();

    if(!hasConnection)
      throw Exception("No connection");

    LiveStream _liveStream;
    final branchId = await locator<BranchService>().branch.id;
    await http
        .get("${AppConstants.LIVE_STREAM_JSON_URL}/?branch_id=$branchId")
        .then(
          (value) {
            print(value);
            if (value.statusCode == 200) {
              final body = json.decode(value.body);
              _liveStream = LiveStream.fromJson(body);
            } else {
              print(value.statusCode);
              throw "Data error";
            }
          },
        )
        .timeout(
          Duration(seconds: 5),
        )
        .catchError(
          (e) {
            throw e;
          },
        );
    return _liveStream;
  }
}
