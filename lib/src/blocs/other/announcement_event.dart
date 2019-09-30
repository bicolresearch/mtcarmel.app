/*
*   Filename    :   announcement_event.dart
*   Purpose     :
*   Created     :   28/09/2019 9:45 PM by Detective Conan
*   Updated     :   28/09/2019 9:45 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AnnouncementEvent extends Equatable {
  AnnouncementEvent([List props = const []]) : super(props);
}

class FetchAnnouncement extends AnnouncementEvent {

  @override
  String toString() => 'FetchAnnouncement';
}

class RefreshAnnouncement extends AnnouncementEvent {

  @override
  String toString() => 'RefreshAnnouncement';
}

