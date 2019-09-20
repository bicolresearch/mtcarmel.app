/*
*  Filename    :   send_help_screen.dart
*  Purpose     :	 Displays the different type of donations
*  Created     :   2019-06-02 09:10 by Detective Conan
*	 Updated			:   20/09/2019 3:20 PM PM by Detective Conan
*	 Changes			:   Changed the image cache to advance image cache
*/

import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_bloc.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/send_help.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class SendHelpScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final sendHelpDataList =
        BlocProvider.of<SendHelpBloc>(context).sendHelpDataList;

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Primary Donation
              Container(
                  height: MediaQuery.of(context).size.height / 2 - 50,
                  child: _donationItem(
                      context: context,
                      sendHelp: sendHelpDataList[0],
                      isPrimary: true)),

              Expanded(
                child: Container(
                  child: GridView.count(
                    physics: ScrollPhysics(parent: ScrollPhysics()),
                    shrinkWrap: true,
                    primary: true,
                    crossAxisCount: 2,
                    children:
                        // exclude the primary
                        List.generate(
                      sendHelpDataList.length - 1,
                      (index) {
                        try {
                          return _donationItem(
                              context: context,
                              sendHelp: sendHelpDataList[index + 1]);
                        } catch (e) {
                          print(e.toString());
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _donationItem(
      {BuildContext context,
      bool isPrimary = false,
      @required SendHelpData sendHelp}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(2.0),
      child: Container(
        color: Colors.brown[50],
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: (sendHelp.mediaPath == null)
                  ? Container()
                  : TransitionToImage(
                      image: AdvancedNetworkImage(
                        "${AppConstants.API_BASE_URL}${sendHelp.mediaPath}",
                        useDiskCache: true,
                        // TODO change duration
                        cacheRule: CacheRule(
                          maxAge: const Duration(minutes: 7),
                        ),
                      ),
                      loadingWidget: LoadingIndicator(),
                      fit: BoxFit.cover,
                    ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Mount carmel logo in main donation type
                isPrimary
                    ? Image.asset(AppConstants.MT_CARMEL_LOGO_PATH, height: 120)
                    : Container(),
                //Name of donation
                Text(
                  sendHelp.name,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead
                      .copyWith(color: Colors.brown),
                ),
                // Description for other than shrine donation else location
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isPrimary
                      ? Text(
                          AppConstants.LOCATION_NAME,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subtitle
                              .copyWith(color: Colors.brown),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      : Text(
                          sendHelp.description,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subtitle
                              .copyWith(color: Colors.brown),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: isPrimary
                      ? const EdgeInsets.only(left: 60.0, right: 60.0)
                      : const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: RaisedButton(
                      onPressed: () async => {
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text(
                              'This feature is not yet available',
                              textAlign: TextAlign.center,
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        ),
//                      if (!_isLoggedIn)
//                        {
//                          _isLoggedIn = await Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) => LoginScreen(),
//                              )),
//                        },
                        //after login form
//                      if (_isLoggedIn)
//                        {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => SendHelpDetails(sendHelp),
//                            ),
//                          )
//                        }
                      },
                      color: Colors.white,
                      child: Text(
                        "Help Now",
                        style: Theme.of(context).primaryTextTheme.subhead,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
