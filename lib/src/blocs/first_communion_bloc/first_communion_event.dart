/*
*   Filename    :   first_communion_event.dart
*   Purpose     :
*   Created     :   22/11/2019 9:53 AM by Detective Conan
*   Updated     :   22/11/2019 9:53 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FirstCommunionEvent extends Equatable {
  FirstCommunionEvent([List props = const []]) : super(props);
}

class FetchFirstCommunion extends FirstCommunionEvent {

  @override
  String toString() => 'FetchFirstCommunion';
}

class RefreshFirstCommunion extends FirstCommunionEvent {

  @override
  String toString() => 'RefreshFirstCommunion';
}

//TODO: Add events
