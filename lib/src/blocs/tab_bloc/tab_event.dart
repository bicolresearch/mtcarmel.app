/*
*   Filename    :   tab_event.dart
*   Purpose     :
*   Created     :   02/09/2019 10:16 AM by Detective Conan
*   Updated     :   02/09/2019 10:16 AM by Detective Conan
*   Changes     :   
*/

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TabEvent extends Equatable{
  TabEvent([List props = const []]): super(props);
}

class UpdateTab extends TabEvent{
  final tab;

  UpdateTab(this.tab): super([tab]);

  @override
  String toString() => "UpdateTab { tab: $tab }";
}