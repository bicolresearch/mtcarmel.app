/*
*   Filename    :   certificate_event.dart
*   Purpose     :
*   Created     :   22/11/2019 9:04 AM by Detective Conan
*   Updated     :   22/11/2019 9:04 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CertificateEvent extends Equatable {
  CertificateEvent([List props = const []]) : super(props);
}

class FetchCertificate extends CertificateEvent {

  @override
  String toString() => 'FetchCertificate';
}

class RefreshCertificate extends CertificateEvent {

  @override
  String toString() => 'RefreshCertificate';
}

//TODO: Add events
