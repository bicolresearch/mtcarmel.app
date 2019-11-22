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

class CertificateBloc extends Bloc<CertificateEvent, CertificateState> {
  @override
  CertificateState get initialState => CertificateUninitialized();

  @override
  Stream<CertificateState> mapEventToState(CertificateEvent event) async* {
    if (event is FetchCertificate) {
      yield CertificateLoading();
      try {
        // TODO implement code
        yield CertificateLoaded();
      } catch (e) {
        print(e);
        yield CertificateError(Exception(e));
      }
    }
  }
}
