/*
*   Filename    :   concrete_bloc_delegate.dart
*   Purpose     :
*   Created     :   02/09/2019 3:02 PM by Detective Conan
*   Updated     :   02/09/2019 3:02 PM by Detective Conan
*   Changes     :   
*/

import 'package:bloc/bloc.dart';

class ConcreteBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}