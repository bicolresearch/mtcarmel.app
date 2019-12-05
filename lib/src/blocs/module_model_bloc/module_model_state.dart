/*
*   Filename    :   module_model_state.dart
*   Purpose     :
*   Created     :   04/12/2019 3:35 PM by Detective Conan
*   Updated     :   04/12/2019 3:35 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ModuleModelState extends Equatable {
  ModuleModelState([List props = const []]) : super(props);
}

class ModuleModelUninitialized extends ModuleModelState {

  @override
  String toString() => 'ModuleModelUninitialized';
}

class ModuleModelLoading extends ModuleModelState {

  @override
  String toString() => 'ModuleModelLoading';
}

class ModuleModelLoaded extends ModuleModelState {

  @override
  String toString() => 'ModuleModelLoaded';
}

class ModuleModelError extends ModuleModelState {

  final exception;

  ModuleModelError(this.exception) : super([exception]);

  @override
  String toString() => 'ModuleModelError';
}

class NoModuleModelLoaded extends ModuleModelState {

  @override
  String toString() => 'No ModuleModel Loaded';
}

class ModuleModelNoConnection extends ModuleModelState {

  @override
  String toString() => 'No Connection';
}

//TODO: Add states
