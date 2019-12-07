/*
*   Filename    :   certificate_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 9:04 AM by Detective Conan
*   Updated     :   22/11/2019 9:04 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/certificate_bloc/certificate_event.dart';
import 'package:mt_carmel_app/src/blocs/certificate_bloc/certificate_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/certificate_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class CertificateBloc extends Bloc<CertificateEvent, CertificateState> {
  @override
  CertificateState get initialState => CertificateUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<CertificateState> mapEventToState(CertificateEvent event) async* {
    if (event is FetchCertificate) {
      yield CertificateLoading();
      try {
        _moduleAndDataActions =
            await locator<CertificateService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoCertificateLoaded();
          return;
        }
        yield CertificateLoaded();
      } catch (e) {
        print(e);
        yield CertificateError(Exception(e));
      }
    }
  }
}
