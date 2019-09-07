/*
*   Filename    :   services_event.dart
*   Purpose     :
*   Created     :   05/09/2019 6:30 PM by Detective Conan
*   Updated     :   05/09/2019 6:30 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ServicesEvent extends Equatable {
  ServicesEvent([List props = const []]) : super(props);
}

class FetchServices extends ServicesEvent {

  @override
  String toString() => 'FetchServices';
}


