import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class ConfraternityDesciption extends StatefulWidget{
  @override
  _ConfraternityDesciptionState createState() => _ConfraternityDesciptionState();
}

class _ConfraternityDesciptionState extends State<ConfraternityDesciption> {
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Stack(children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                Text("Confraternity of Our Lady of Mount Carmel", style: AppConstants.OPTION_STYLE3,),
                //TODO create helper class for widgets such line
                // _line(),
                Divider(color: Colors.brown, height: 20.0,),
                _details(),                
              ],
            ),
            ),
          Container(
            width: double.infinity,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(                                    
                padding: const EdgeInsets.only(right: 10.0),
                child: RaisedButton(
                  //TODO implement the onPress button
                  onPressed: () => "",
                  color: Colors.brown,
                  child: Text("Accept", 
                    style: TextStyle(fontFamily: 'Helvetica',
                    color: Colors.white),                                        
                  ),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                    ),                                     
                ),
              ),
              Container(child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.keyboard_arrow_left)))
            ],
            )
            ),
          ],
        ),
      ),
    );
  }

  Widget _details(){
    return Container(
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text("Fees:",
            style: AppConstants.OPTION_STYLE1,),
          ),
          Container(
            child: Text("Application Fee, Scapular, Confraternity Manual and Certificate of Confraternity",
            style: AppConstants.OPTION_STYLE1,),
          ),
          Container(
            child: Text("200 php",
            style: AppConstants.OPTION_STYLE1,),
          ),
          Container(
            child: Text("You may settle your bill using your debit card, credit card or cash",
            style: AppConstants.OPTION_STYLE1,),
          ),
      ],
      )
    );
  }

  // Widget _line(){
  //   return //LINE
  //       Container(
  //       alignment: Alignment.center,
  //       child: Container(
  //       height: .9,
  //       color: Colors.brown,
  //     ),
  //     height: 20.0,
  //     width: double.infinity,
  //   );
  // }
}