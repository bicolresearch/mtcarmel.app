import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/make_request_screens/liturgical_service_form.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class LiturgicalServiceInfo extends StatelessWidget {
  const LiturgicalServiceInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(30.0, 50.0,30.0,50.0),
        child: Column(
          children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: GestureDetector(
              onTap: () {
                print("Tapped item");
              },
              child: Text("Liturgical Service", 
              style: AppConstants.OPTION_STYLE3,
              textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.0),
            child: lineWidget()),
          SizedBox(height: 30.0),
          Expanded(
              child: Container(
              width: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text("Liturgical Service for blessing of houses, businesses and cars, as well as annointing of the sickor for other purposes.", 
              style: AppConstants.OPTION_STYLE2,
              textAlign: TextAlign.left,), 
              SizedBox(height: 10.0),              
              Text("Parishioner may give the officiating priest a donation after the service.", 
              style: AppConstants.OPTION_STYLE2,
              textAlign: TextAlign.left,),
              SizedBox(height: 10.0),              
              Text("Exclusive for parishioners of Our Lady of Mount Carmel.", 
              style: AppConstants.OPTION_STYLE2,
              textAlign: TextAlign.left,),
            ],
            ),
            ),
          ),        
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            color: Colors.brown,
            child: Text("Accept", 
            style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                    LiturgicalServiceForm()
                  )
                );
                if(result)
                  Navigator.pop(context, true);
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context, false);
                print("tapped");
              },
              child: Icon(Icons.keyboard_arrow_left, 
              size: 50.0,
              color: Colors.brown,)),
          )
          ],
        ),
      ),
    );
  }
}