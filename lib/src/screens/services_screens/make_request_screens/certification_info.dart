import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/make_request_screens/certification_form.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class CertificationInfo extends StatelessWidget {
  const CertificationInfo({Key key}) : super(key: key);

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
              child: Text("Certification", 
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
              Text("We furnish baptismal certificate and confirmation certificate for parishioners.", 
              style: AppConstants.OPTION_STYLE2,
              textAlign: TextAlign.left,), 
              SizedBox(height: 10.0),
              Text("For Purposes such as for Personal file, School, Confirmation, First Communion, Legal documents, SSS requirement, Travel documents, Issuance of Birth Certificate and Marriage.", 
              style: AppConstants.OPTION_STYLE2,
              textAlign: TextAlign.left,), 
              SizedBox(height: 10.0),
              Text("Fees:", 
              style: AppConstants.OPTION_STYLE2,
              textAlign: TextAlign.left,), 
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Printing Service", 
                style: AppConstants.OPTION_STYLE2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("50 php", style: AppConstants.OPTION_STYLE2,),
              ),
              Text("You may settle your bill using your debit card, credit card or cash.", style: AppConstants.OPTION_STYLE2,),
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
                    CertificationForm()
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