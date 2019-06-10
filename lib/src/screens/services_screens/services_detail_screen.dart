import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class ServicesDetailScreen extends StatefulWidget {

  ServicesDetailScreen(this.title);

  final String title;

  @override
  _ServicesDetailScreenState createState() => _ServicesDetailScreenState();
}

class _ServicesDetailScreenState extends State<ServicesDetailScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.brown),
          backgroundColor: Colors.white,        
          title: Text(widget.title,
            maxLines: 1, 
            overflow: TextOverflow.ellipsis,
            style: AppConstants.OPTION_STYLE3,
          ),
        ),
    );
  }
}