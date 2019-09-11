/*
*   Filename    :   sub_services_event.dart
*   Purpose     :
*   Created     :   11/09/2019 12:51 PM by Detective Conan
*   Updated     :   11/09/2019 12:51 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';

@immutable
abstract class SubServicesEvent extends Equatable {
  SubServicesEvent([List props = const []]) : super(props);
}

class FetchSubServices extends SubServicesEvent {
  final moduleReference;

  FetchSubServices(this.moduleReference):super([moduleReference]);

  @override
  String toString() => 'FetchSubServices';
}

class RefreshSubServices extends SubServicesEvent {

  @override
  String toString() => 'RefreshSubServices';
}

//TODO: Add events
