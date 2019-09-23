/*
*   Filename    :   contact_detail_bloc.dart
*   Purpose     :
*   Created     :   18/09/2019 12:12 PM by Detective Conan
*   Updated     :   18/09/2019 12:12 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/contact_detail_bloc/contact_detail_event.dart';
import 'package:mt_carmel_app/src/blocs/contact_detail_bloc/contact_detail_state.dart';
import 'package:mt_carmel_app/src/core/services/contact_detail_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/contact.dart';

class ContactDetailBloc
    extends Bloc<ContactDetailEvent, ContactDetailState> {
  
  ContactData _contactData;

  ContactData get contactData => _contactData;

  @override
  ContactDetailState get initialState => ContactDetailUninitialized();

  @override
  Stream<ContactDetailState> mapEventToState(
      ContactDetailEvent event) async* {
    if(event is FetchContactDetail){
      yield ContactDetailLoading();
      try {
        _contactData = await locator<ContactDetailService>().getData();
        yield ContactDetailLoaded();
      } catch (e) {
        print(e);
        if (e.toString().contains("No connection")) {
          yield ContactDetailNoConnection();
          return;
        }
        yield ContactDetailError(e);
        return;
      }
    }
  }
}