/*
*   Filename    :   liturgical_event.dart
*   Purpose     :
*   Created     :   22/11/2019 8:58 AM by Detective Conan
*   Updated     :   22/11/2019 8:58 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LiturgicalEvent extends Equatable {
  LiturgicalEvent([List props = const []]) : super(props);
}

class FetchLiturgical extends LiturgicalEvent {

  @override
  String toString() => 'FetchLiturgical';
}

class RefreshLiturgical extends LiturgicalEvent {

  @override
  String toString() => 'RefreshLiturgical';
}

//TODO: Add events
