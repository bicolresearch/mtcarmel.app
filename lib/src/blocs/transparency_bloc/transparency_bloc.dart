/*
*   Filename    :   transparency_bloc.dart
*   Purpose     :
*   Created     :   12/09/2019 3:53 PM by Detective Conan
*   Updated     :   12/09/2019 3:53 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/transparency_bloc/transparency_event.dart';
import 'package:mt_carmel_app/src/blocs/transparency_bloc/transparency_state.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/core/services/transaparency_service.dart';
import 'package:mt_carmel_app/src/models/donations.dart';

class TransparencyBloc extends Bloc<TransparencyEvent, TransparencyState> {
  int _totalAmount = 0;

  @override
  TransparencyState get initialState => TransparencyUninitialized();

  int get totalAmount => _totalAmount;

  DonationRecord _donationRecord;

  DonationRecord get donationRecord => _donationRecord;

  @override
  Stream<TransparencyState> mapEventToState(TransparencyEvent event) async* {
    if (event is FetchTransparency) {
      if (_totalAmount == 0) yield TransparencyLoading();
      try {
        int newTotal = 0;
        Donations donations;
        donations = await locator<TransparencyService>().getData();
        newTotal = int.tryParse(donations.totalDonations.amount);
        if (newTotal != _totalAmount) {
          _totalAmount = newTotal;
          _donationRecord = donations.donationsRecord;
          yield TransparencyLoaded();
        }
      } catch (e) {
        print(e);
        yield TransparencyError(e);
      }
    }
  }
}
