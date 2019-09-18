/*
*   Filename    :   contact_detail_event.dart
*   Purpose     :
*   Created     :   18/09/2019 12:13 PM by Detective Conan
*   Updated     :   18/09/2019 12:13 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ContactDetailEvent extends Equatable {
  ContactDetailEvent([List props = const []]) : super(props);
}

class FetchContactDetail extends ContactDetailEvent {

  @override
  String toString() => 'FetchContactDetail';
}

class RefreshContactDetails extends ContactDetailEvent {

  @override
  String toString() => 'RefreshContactDetails';
}

//TODO: Add events
