/*
*   Filename    :   crypt_lobby_event.dart
*   Purpose     :
*   Created     :   28/11/2019 10:25 AM by Detective Conan
*   Updated     :   28/11/2019 10:25 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CryptLobbyEvent extends Equatable {
  CryptLobbyEvent([List props = const []]) : super(props);
}

class FetchCryptLobby extends CryptLobbyEvent {

  @override
  String toString() => 'FetchCryptLobby';
}

class RefreshCryptLobby extends CryptLobbyEvent {

  @override
  String toString() => 'RefreshCryptLobby';
}

//TODO: Add events
