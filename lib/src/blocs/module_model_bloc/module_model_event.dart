/*
*   Filename    :   module_model_event.dart
*   Purpose     :
*   Created     :   04/12/2019 3:34 PM by Detective Conan
*   Updated     :   04/12/2019 3:34 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ModuleModelEvent extends Equatable {
  ModuleModelEvent([List props = const []]) : super(props);
}

class FetchModuleModel extends ModuleModelEvent {
  final String moduleDir;

  FetchModuleModel(this.moduleDir) : super([moduleDir]);

  @override
  String toString() => 'FetchModuleModel';
}

class RefreshModuleModel extends ModuleModelEvent {
  @override
  String toString() => 'RefreshModuleModel';
}

//TODO: Add events
