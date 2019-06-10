
import 'package:flutter/material.dart';

class SliderWidget {

  static Widget slider({TickerProviderStateMixin<StatefulWidget> context, List<Widget> children, }){

  var imagesController = TabController(length: children.length, 
    vsync: context);

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