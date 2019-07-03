/*
*	Filename		:	feed_detail_screen.dart
*	Purpose			:	Displays the particular post
* Created			: 2019-06-04 16:52:31 by Detective Conan
*	Updated			: 2019-07-03 11:17 by Detective conan
*	Changes			: Implemented caching of image.
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/feed.dart';
import 'package:flutter_html_textview_render/html_text_view.dart';

class FeedDetailScreen extends StatelessWidget {
  final Feed feed;

  FeedDetailScreen(this.feed);

  @override
  Widget build(BuildContext context) {
    print(feed.title);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 30.0),
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.brown[600],
                          border:
                              Border.all(color: Colors.transparent, width: 0.8),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          feed.title,
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Helvetica"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(),
                      Container(
                        width: double.infinity,
                        height: 250,
                        child: CachedNetworkImage(
                            key: Key(AppConstants.API_BASE_URL +
                                feed.coverPhoto.replaceAll("/", "")),
                            imageUrl:
                                AppConstants.API_BASE_URL + feed.coverPhoto,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                new Icon(Icons.error),
                            fit: BoxFit.contain),
                      ),
                      Divider(),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: HtmlTextView(
                            data:
                                "<div style='color: #5d4037'>${feed.content}</div>",
                            anchorColor: Color(0xFFFF0000),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.brown,
                child: Text(
                  "Close",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
