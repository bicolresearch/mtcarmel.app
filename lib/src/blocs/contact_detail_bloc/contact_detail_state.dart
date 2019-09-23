/*
*   Filename    :   contact_detail_state.dart
*   Purpose     :
*   Created     :   18/09/2019 12:13 PM by Detective Conan
*   Updated     :   18/09/2019 12:13 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ContactDetailState extends Equatable {
  ContactDetailState([List props = const []]) : super(props);
}

class ContactDetailUninitialized extends ContactDetailState {

  @override
  String toString() => 'ContactDetailsUninitialized';
}

class ContactDetailLoading extends ContactDetailState {

  @override
  String toString() => 'ContactDetailLoading';
}

class ContactDetailLoaded extends ContactDetailState {

  @override
  String toString() => 'ContactDetailLoaded';
}

class ContactDetailError extends ContactDetailState {

  final exception;

  ContactDetailError(this.exception) : super([exception]);

  @override
  String toString() => 'ContactDetailsError';
}

class NoContactDetailLoaded extends ContactDetailState {

  @override
  String toString() => 'No ContactDetails Loaded';
}

class ContactDetailNoConnection extends ContactDetailState {

  @override
  String toString() => 'ContactDetailNoConnection';
}
