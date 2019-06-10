import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/model/total_transaction_amount.dart';
import 'package:mt_carmel_app/src/model/transaction.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';

class TransparencyScreen extends StatefulWidget {

  static const TextStyle optionStyle = TextStyle(
                      color: Colors.brown, fontSize: 13.0, fontWeight: FontWeight.bold);

  TransparencyScreen(BuildContext context);

  @override
  _TransparencyScreenState createState() => _TransparencyScreenState();
}

class _TransparencyScreenState extends State<TransparencyScreen> {

  var _totalDonated = 0.0;
  var _isLoading = true;
  var _isJsonFailed = false;
  var _isTotalLoading = true;
  var _isJsonTotalFailed = false;
  List<TotalTransactionAmount> _totalTransactionAmountList = [];

  List<Transaction> _transactionList = [];

  @override
  void initState() { 
    super.initState();
    this.getJasonData();
    this.getTotalAmt();
  }



  Future<void> getJasonData() async{

      var response = await http.get(AppConstants.TRANSACTION_JSON_URL);  
      if(this.mounted){
      setState(() 
        {
          if (response.statusCode == 200) {
             _transactionList = (json.decode(response.body) as List)
            .map((data) => new Transaction.fromJson(data))
            .toList();
            _isLoading = false;              
          } 
          else 
          {
          _isJsonFailed = true;
          _isLoading = false;
            }
          }
        );
      }
    }

  Future<void> getTotalAmt() async{

    var response = await http.get('http://192.168.254.109/api/transparency.json'); 
    if(this.mounted){
    setState(() 
      {
        if (response.statusCode == 200) {
            _totalTransactionAmountList = (json.decode(response.body) as List)
          .map((data) => new TotalTransactionAmount.fromJson(data))
          .toList();
          _isTotalLoading = false;              
        } 
        else 
        {
        _isJsonTotalFailed = true;
        _isTotalLoading = false;
          }
        }
      );
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 40.0, right: 40.0),
          child: 
          Column(children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Spacer(flex: 2),
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Icon(MountCarmelIcons.transparency, 
                    color: Colors.brown[600], 
                    size: 140,),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text("Transparency",
                        style: AppConstants.OPTION_STYLE3 ,
                        textAlign: TextAlign.justify,),
                    ),
                    Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text("Total help received online for this year",
                    style: AppConstants.OPTION_STYLE1 ,
                    textAlign: TextAlign.justify,),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(   
                        width: 200.0,  
                        height: 20.0,        
                        decoration: BoxDecoration(
                          color: Colors.brown[600],
                        border: Border.all(width: 0.8),
                        borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: getTotal()
                        ),
                        ),
                      IconButton(icon: Icon(MountCarmelIcons.refresh,
                        color: Colors.brown[600],),
                        onPressed: () {
                          print("Refresh button pressed.");
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              ),
              height: (MediaQuery.of(context).size.height)/2-50.0,
              width: double.infinity,
              ),  
            Divider(color: Colors.brown),
              //TRANSACTION LIST                  
          Container(
            height: (MediaQuery.of(context).size.height)/2 - 100.0,
            width: double.infinity,
            alignment: Alignment.center,
            child:Container(
              child: ListView.builder(
                itemCount: _transactionList.length,
                itemBuilder: (context,index){
                  return Container( 
                    child: _isLoading?CircularProgressIndicator():_transactionContent(_transactionList[index]) );
                      },
                    ),
                  )
                ),        
              ],
            ),
                height: MediaQuery.of(context).size.height,
          )
        ),
      );
    }
                
    Widget _transactionContent(Transaction transaction) {
      if (_isJsonFailed) 
        return Container();

    String url = AppConstants.API_BASE_URL+transaction.photo;
    if(Image.network(url)!=null){
      return Container(  
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[ 
            
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0,5.0),
            width: 40.0,
            child: CircleAvatar(backgroundImage: NetworkImage(url),
              radius: 20,
              backgroundColor: Colors.brown,
              ),
            ),
            Spacer(),
            Container(
              width: 100.0, 
              child: Text(transaction.name)),
            Spacer(flex: 2),
            Container(
              width: 75.0,
              child: Text('P ${transaction.amount}')),
            Spacer(),
            Container(
              width: 25.0,
              child: Text(transaction.hour)),
            Spacer(flex: 2),
            Container(
              width: 55.0,
              child: Text(transaction.module)),
            Spacer(),
          ],          
        ),
      );
    }  
    return Container(); 
    }

    Widget getTotal(){

      double total = 0.0; 

      if(_totalTransactionAmountList.isNotEmpty && _totalTransactionAmountList[0] != null){
        total = _totalTransactionAmountList[0].total;
      }

      return Text('Php $total', 
                            textAlign: TextAlign.center, 
                            style: TextStyle(color: Colors.white));
    }

    void close(){
      this.dispose();
    }
  
}