/*
*   Filename    :   community_baptism_state.dart
*   Purpose     :
*   Created     :   22/11/2019 9:28 AM by Detective Conan
*   Updated     :   22/11/2019 9:28 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CommunityBaptismState extends Equatable {
  CommunityBaptismState([List props = const []]) : super(props);
}

class CommunityBaptismUninitialized extends CommunityBaptismState {

  @override
  String toString() => 'CommunityBaptismUninitialized';
}

class CommunityBaptismLoading extends CommunityBaptismState {

  @override
  String toString() => 'CommunityBaptismLoading';
}

class CommunityBaptismLoaded extends CommunityBaptismState {

  @override
  String toString() => 'CommunityBaptismLoaded';
}

class CommunityBaptismError extends CommunityBaptismState {

  final exception;

  CommunityBaptismError(this.exception) : super([exception]);

  @override
  String toString() => 'CommunityBaptismError';
}

class NoCommunityBaptismLoaded extends CommunityBaptismState {

  @override
  String toString() => 'No CommunityBaptism Loaded';
}

//TODO: Add states
