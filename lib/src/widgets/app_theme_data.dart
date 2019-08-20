import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

appThemeData(BuildContext context) {
  return ThemeData(
      iconTheme: IconThemeData(
        color: Colors.brown,
      ),
      dividerColor: Colors.brown,
      primarySwatch: Colors.brown,
      primaryColor: Colors.brown,
      disabledColor: Colors.brown[100],
      fontFamily: AppConstants.FONT_FAMILY,
      primaryTextTheme: TextTheme(
        display4: Theme.of(context).textTheme.display4.copyWith(
            color: Colors.brown, fontFamily: AppConstants.FONT_FAMILY),
        display3: Theme.of(context).textTheme.display3.copyWith(
            color: Colors.brown, fontFamily: AppConstants.FONT_FAMILY),
        display2: Theme.of(context).textTheme.display2.copyWith(
            color: Colors.brown, fontFamily: AppConstants.FONT_FAMILY),
        display1: Theme.of(context).textTheme.display1.copyWith(
            color: Colors.brown, fontFamily: AppConstants.FONT_FAMILY),
        headline: Theme.of(context).textTheme.headline.copyWith(
            color: Colors.brown, fontFamily: AppConstants.FONT_FAMILY),
        title: Theme.of(context).textTheme.title.copyWith(
            color: Colors.brown, fontFamily: AppConstants.FONT_FAMILY),
        subhead: Theme.of(context).textTheme.subhead.copyWith(
            color: Colors.brown, fontFamily: AppConstants.FONT_FAMILY),
        body2: Theme.of(context).textTheme.body2.copyWith(
            color: Colors.brown, fontFamily: AppConstants.FONT_FAMILY),
        body1: Theme.of(context).textTheme.body1.copyWith(
            color: Colors.brown, fontFamily: AppConstants.FONT_FAMILY),
        caption: Theme.of(context).textTheme.caption.copyWith(
            color: Colors.brown, fontFamily: AppConstants.FONT_FAMILY),
        subtitle:
            Theme.of(context).textTheme.subtitle.copyWith(color: Colors.brown),
      ),
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        color: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.brown,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      unselectedWidgetColor: Colors.brown);
}
