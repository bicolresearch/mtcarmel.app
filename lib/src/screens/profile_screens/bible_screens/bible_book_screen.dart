import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';
import 'package:mt_carmel_app/src/model/bible_reference.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class BibleBookScreen extends StatefulWidget {
  BibleBookScreen({Key key, 
    @required this.book}) : super(key: key);
  
  final BibleBook book;
  
  _BibleBookScreenState createState() => _BibleBookScreenState(book);
}

class _BibleBookScreenState extends State<BibleBookScreen> {
  _BibleBookScreenState(this.book);

  final BibleBook book;
  var currentChapter = 1;

  List<Verse> _verses = [];

  BibleReference _reference;

  var _isLoading = true;

  var _isJsonFailed = false;

  @override
  void initState() { 
    super.initState();   
    this.getJasonData();
  }

  Future<void> getJasonData() async{
    var response = await http.get(AppConstants.BIBLE_JSON_BASE_URL); 
    if(this.mounted){
      setState(() 
        {
          if (response.statusCode == 200) {
            //   _verses = (json.decode(response.body) as List)
            // .map((data) => new Verse.fromJson(data))
            // .toList();

            _reference = json.decode(response.body)
            .map((data) => BibleReference.fromJson(data));
            
            _isLoading = false;              
          } 
          else 
          {
            print(response.statusCode);
            _isJsonFailed = true;
            _isLoading = false;
          }
        }
      );
    }
  }
  
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(book.bookName),
          // Text(_reference.reference),
          // Text(_reference.translation_name),
          // Text(_reference.translation_note),
          //   Text(_reference.verses[0].book_id),
          //   Text(_reference.verses[0].book_name),
          //   Text(_reference.verses[0].verse),
          SizedBox(height: 40.0,),
          leftArrowBackButton(context: context),
        ],
      ),),
    );
  }
}