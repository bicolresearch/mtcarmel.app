import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constants/app_constants.dart';
import '../../presentations/mount_carmel_icons.dart';

class SendHelpDetails extends StatefulWidget {
  @override
  _SendHelpDetailsState createState() => _SendHelpDetailsState();
}

class _SendHelpDetailsState extends State<SendHelpDetails> 
with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                    image: NetworkImage('http://192.168.254.109/api/assets/images/church/mtcarmel_527x800.png'),
                    fit: BoxFit.cover),
              )
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                    child: Container(
                    margin: EdgeInsets.all(50.0),
                    padding: EdgeInsets.only(bottom: 50.0),
                    child: _detailsBox(context),
                  ),
                ),
                SizedBox(
                  height: 150.0
                ),
              ],
            ),
            _buttonsAndFields(),
          ],
        ),
      ),
    );
  }

  Widget _buttonsAndFields(){
    return Container(
      margin: EdgeInsets.only(bottom: 50.0),
      child: Column(children: <Widget>[
        SizedBox(height: 100,),
        Spacer(flex: 2,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: TextField(
              //keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                hintText: "Amount",
                labelText: "Amount",
                ),
                textAlign: TextAlign.center,
        ),
          ),
        ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            color: Colors.brown,
            child: Text("Send help", 
            style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              print("Send help pressed");
            },
          ),
          GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: Text("Back", 
            style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold), ))
        ],
      ),
    );
  }

  Widget _detailsBox(context){
    return _slider(
      children: [
        _first_item(),
        _second_item(),
        _third_item(),
        _first_item(),
        _second_item(),
        _third_item(),
      ],);
  }

  Widget _first_item(){ 
    return Container(
      color: Color.fromARGB(100, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(MountCarmelIcons.logo, 
            color: Colors.brown[600], 
            size: 100,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(AppConstants.COMPANY_NAME, 
              style: AppConstants.OPTION_STYLE3,),
            Text(AppConstants.LOCATION_NAME, 
              style: AppConstants.OPTION_STYLE1,),
            Divider(color: Colors.brown),
            Text(AppConstants.sample_message, 
              style: AppConstants.OPTION_STYLE1,),
        ],
      ),
    );
  }

  Widget _second_item(){
    return Container(child: Icon(Icons.access_alarm, size: 200,),);
  }

  Widget _third_item(){
    return Container(child: Icon(Icons.ac_unit, size: 200,), );
  }

  Widget _slider({List<Widget> children, }){

  var imagesController = TabController(length: children.length, 
    vsync: this);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      height: 250.0,
      child: Center(
        child: DefaultTabController(
          length: children.length,
          child: Stack(
            children: <Widget>[
              TabBarView(
                controller: imagesController,
                children: children,
              ),
              Container(
                alignment: FractionalOffset(0.5, 0.95),
                child: TabPageSelector(
                  controller: imagesController,
                  selectedColor: Colors.grey,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
       ),
      ),
    );
  }
}