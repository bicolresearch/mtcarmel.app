/*
*   Filename    :   individual_baptism_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 9:16 AM by Detective Conan
*   Updated     :   22/11/2019 9:16 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/individual_baptism_bloc/individual_baptism_event.dart';
import 'package:mt_carmel_app/src/blocs/individual_baptism_bloc/individual_baptism_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/individual_baptism_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/individual_baptism.dart';

class IndividualBaptismBloc
    extends Bloc<IndividualBaptismEvent, IndividualBaptismState> {
  @override
  IndividualBaptismState get initialState => IndividualBaptismUninitialized();

  List<IndividualBaptism> _individualBaptismList = [];

  List<IndividualBaptism> get individualBaptismList => _individualBaptismList;

  @override
  Stream<IndividualBaptismState> mapEventToState(
      IndividualBaptismEvent event) async* {
    if (event is FetchIndividualBaptism) {
      yield IndividualBaptismLoading();
      try {
        _individualBaptismList = await locator<IndividualBaptismService>()
            .getIndividualBaptismList();
        if (_individualBaptismList.length == 0) {
          yield NoIndividualBaptismLoaded();
          return;
        }
        yield IndividualBaptismLoaded();
      } catch (e) {
        print(e);
        yield IndividualBaptismError(Exception(e));
      }
    }
  }
}
