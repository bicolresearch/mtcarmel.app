/*
*   Filename    :   certificate_state.dart
*   Purpose     :
*   Created     :   22/11/2019 9:05 AM by Detective Conan
*	 Updated			:   28/11/2019 9:42 AM PM by Detective Conan
*	 Changes			:   Added no connection state
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CertificateState extends Equatable {
  CertificateState([List props = const []]) : super(props);
}

class CertificateUninitialized extends CertificateState {
  @override
  String toString() => 'CertificateUninitialized';
}

class CertificateLoading extends CertificateState {
  @override
  String toString() => 'CertificateLoading';
}

class CertificateLoaded extends CertificateState {
  @override
  String toString() => 'CertificateLoaded';
}

class CertificateError extends CertificateState {
  final exception;

  CertificateError(this.exception) : super([exception]);

  @override
  String toString() => 'CertificateError';
}

class NoCertificateLoaded extends CertificateState {
  @override
  String toString() => 'No Certificate Loaded';
}

class CertificateNoConnection extends CertificateState {
  @override
  String toString() => 'No Connection';
}

//TODO: Add states
