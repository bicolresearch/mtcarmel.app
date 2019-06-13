import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

enum ItemDirection {
  vertical,
  horizontal
}

Widget itemWidget({@required BuildContext context,
  String label, String value, 
  ItemDirection direction = ItemDirection.vertical}){
  if(direction == ItemDirection.horizontal){
    return Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text("$label",
                        style: AppConstants.OPTION_STYLE3,
                        textAlign: TextAlign.start,
                      ),
                ),
                SizedBox(width: 10.0,),
                Expanded(
                  child: Text("$value",
                        style: AppConstants.OPTION_STYLE2,
                        textAlign: TextAlign.left,
                      ),
                ),
              ],
            ),
            lineWidget(),
          ],
        ),
      );
    }
  else{ // vertical
      return Column(
        children: <Widget>[
          Text("$label",
                style: AppConstants.OPTION_STYLE2,
                textAlign: TextAlign.center,
              ),
          SizedBox(width: 10.0,),
          Text("$value",
                style: AppConstants.OPTION_STYLE1,
                textAlign: TextAlign.center,
              ),
          lineWidget(),
        ],
      );
    }
}