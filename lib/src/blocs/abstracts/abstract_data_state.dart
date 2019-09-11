/*
*   Filename    :   abstract_data_state.dart
*   Purpose     :
*   Created     :   11/09/2019 9:46 AM by Detective Conan
*   Updated     :   11/09/2019 9:46 AM by Detective Conan
*   Changes     :   
*/

/*
*   Filename    :   live_stream_state.dart
*   Purpose     :
*   Created     :   10/09/2019 3:46 PM by Detective Conan
*   Updated     :   10/09/2019 3:46 PM by Detective Conan
*   Changes     :
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/live_stream.dart';

@immutable
abstract class AbstractDataState extends Equatable {
  AbstractDataState([List props = const []]) : super(props);
}

class Uninitialized extends AbstractDataState {

  @override
  String toString() => 'Uninitialized';
}

class Loading extends AbstractDataState {

  @override
  String toString() => 'Loading';
}

class Loaded extends AbstractDataState {
  final data;

  Loaded(this.data):super([data]);


  @override
  String toString() => 'Loaded $data';
}

class LiveStreamError extends AbstractDataState {
  final exception;
  LiveStreamError(this.exception):super([exception]);


  @override
  String toString() => 'Error';
}

