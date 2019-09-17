/*
*   Filename    :   pastors_event.dart
*   Purpose     :
*   Created     :   17/09/2019 4:51 PM by Detective Conan
*   Updated     :   17/09/2019 4:51 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PastorsEvent extends Equatable {
  PastorsEvent([List props = const []]) : super(props);
}

class FetchPastors extends PastorsEvent {

  @override
  String toString() => 'FetchPastors';
}

class RefreshPastors extends PastorsEvent {

  @override
  String toString() => 'RefreshPastors';
}

//TODO: Add events
