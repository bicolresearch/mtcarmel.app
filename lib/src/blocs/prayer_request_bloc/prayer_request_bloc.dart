/*
*   Filename    :   prayer_request_bloc.dart
*   Purpose     :
*   Created     :   19/11/2019 1:51 PM by Detective Conan
*   Updated     :   19/11/2019 1:51 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/prayer_request_bloc/prayer_request_event.dart';
import 'package:mt_carmel_app/src/blocs/prayer_request_bloc/prayer_request_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/prayer_request_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/prayer_request.dart';

class PrayerRequestBloc extends Bloc<PrayerRequestEvent, PrayerRequestState> {
  @override
  PrayerRequestState get initialState => PrayerRequestUninitialized();

  DataActionPrayerRequest _dataActionPrayerRequest;

  DataActionPrayerRequest get dataActionPrayerRequest =>
      _dataActionPrayerRequest;

  @override
  Stream<PrayerRequestState> mapEventToState(PrayerRequestEvent event) async* {
    if (event is FetchPrayerRequest) {
      yield PrayerRequestLoading();
      try {
        _dataActionPrayerRequest =
            await locator<PrayerRequestService>().getPrayerRequests();
        yield PrayerRequestLoaded();
      } catch (e) {
        print(e);
        yield PrayerRequestError(Exception("$e"));
      }
    }
  }
}
