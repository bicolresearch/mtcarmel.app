/*
*   Filename    :   announcement_state.dart
*   Purpose     :
*   Created     :   28/09/2019 9:45 PM by Detective Conan
*   Updated     :   28/09/2019 9:45 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AnnouncementState extends Equatable {
  AnnouncementState([List props = const []]) : super(props);
}

class AnnouncementUninitialized extends AnnouncementState {

  @override
  String toString() => 'AnnouncementUninitialized';
}

class AnnouncementLoading extends AnnouncementState {

  @override
  String toString() => 'AnnouncementLoading';
}

class AnnouncementLoaded extends AnnouncementState {

  @override
  String toString() => 'AnnouncementLoaded';
}

class AnnouncementError extends AnnouncementState {

  final exception;

  AnnouncementError(this.exception) : super([exception]);

  @override
  String toString() => 'AnnouncementError';
}

class NoAnnouncementLoaded extends AnnouncementState {

  @override
  String toString() => 'No Announcement Loaded';
}

