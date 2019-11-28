/*
*   Filename    :   crypt_lobby_state.dart
*   Purpose     :
*   Created     :   28/11/2019 10:25 AM by Detective Conan
*   Updated     :   28/11/2019 10:25 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CryptLobbyState extends Equatable {
  CryptLobbyState([List props = const []]) : super(props);
}

class CryptLobbyUninitialized extends CryptLobbyState {

  @override
  String toString() => 'CryptLobbyUninitialized';
}

class CryptLobbyLoading extends CryptLobbyState {

  @override
  String toString() => 'CryptLobbyLoading';
}

class CryptLobbyLoaded extends CryptLobbyState {

  @override
  String toString() => 'CryptLobbyLoaded';
}

class CryptLobbyError extends CryptLobbyState {

  final exception;

  CryptLobbyError(this.exception) : super([exception]);

  @override
  String toString() => 'CryptLobbyError';
}

class NoCryptLobbyLoaded extends CryptLobbyState {

  @override
  String toString() => 'No CryptLobby Loaded';
}

class CryptLobbyNoConnection extends CryptLobbyState {

  @override
  String toString() => 'No Connection';
}

//TODO: Add states
