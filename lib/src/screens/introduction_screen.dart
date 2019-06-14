import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../screens/tab_navigator.dart';
import '../helpers/screen_slider.dart';
import '../presentations/mount_carmel_icons.dart';
import '../helpers/shared_preference_helper.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  

  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> _slides = new List();

  @override
  initState(){
    super.initState();
        
        // First Slide
        _slides.add(
          Slide([
          SlideContentItem( widget: Container(child: Column(children: <Widget>[
                
                Text(AppConstants.INTRO_WELCOME,
                style: TextStyle(fontSize: 13, 
                fontFamily: 'Helvetica', 
                color: Colors.brown , 
                fontStyle: FontStyle.italic),
                textAlign: TextAlign.center, )
          ],
          ),
          margin: EdgeInsets.only(left: 100, right: 100),
          ),
    
          ),
          ],
          ),
        );
    
          // Second Slide
        _slides.add(
          Slide([
            // first item 
          SlideContentItem( widget: 
            _slideContentItem(
            iconData: MountCarmelIcons.events, 
            title: AppConstants.NEWS_AND_UPDATES,
            content: AppConstants.NEWS_AND_UPDATES_DESCRIPTION),),
          // second item
          SlideContentItem( widget: _slideContentItem(
            iconData: MountCarmelIcons.sendhelp, 
            title: AppConstants.SEND_HELP,
            content: AppConstants.SEND_HELP_DESCRIPTION)),
            ],
          )
        );
    
        _slides.add(
          Slide([
            // first item 
          SlideContentItem( widget: 
            _slideContentItem(
            iconData: MountCarmelIcons.services, 
            title: AppConstants.SERVICES_OFFERED,
            content: AppConstants.SERVICES_OFFERED_DESCRIPTION),),
          // second item
          SlideContentItem( widget: _slideContentItem(
            iconData: MountCarmelIcons.transparency, 
            title: AppConstants.TRANSPARENCY_FEATURE,
            content: AppConstants.TRANSPARENCY_FEATURE_DESCRIPTION)),
            ],
          )
        );
      }
    
      void onDonePress() {
        SharedPreferencesHelper.setFirstUsageFlag(false);
        Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TabNavigator(),
                ),
                );
      }
    
      Widget renderNextBtn() {
        return Icon(
          Icons.navigate_next,
          color: Color(0xffffcc5c),
          size: 35.0,
        );
      }
    
      Widget renderDoneBtn() {
        return Icon(
          Icons.done,
          color: Color(0xffffcc5c),
        );
      }
    
      Widget renderSkipBtn() {
        return Icon(
          Icons.skip_next,
          color: Color(0xffffcc5c),
        );
      }
    
      List<Widget> renderListCustomTabs() {
        List<Widget> tabs = List();
        for (int i = 0; i < _slides.length; i++) {
          Slide currentSlide = _slides[i];
            tabs.add(Container(
              width: double.infinity,
              height: double.infinity,
              child: Container(
                margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(child: currentSlide.container(),
                    ),
                  ],
                ),
              ),
            ));
        }
        return tabs;
      }
    
      @override
      Widget build(BuildContext context) {
        return ScreenSlider(
          // List slides
          slides: this._slides,
    
          // Skip button
          nameSkipBtn: 'skip',
          highlightColorSkipBtn: Colors.brown,
          styleNameSkipBtn: TextStyle(color: Colors.brown[200]),
    
          // Next button
          nameNextBtn: 'next',
    
    
          // Done button
          nameDoneBtn: 'finish',
          onDonePress: this.onDonePress,
          highlightColorDoneBtn: Colors.brown,
          styleNameDoneBtn: TextStyle(color: Colors.brown[200]),
    
          // Dot indicator
          colorDot: Colors.brown[200],
          colorActiveDot: Colors.brown[400],
          sizeDot: 8.0,
    
          // List custom tabs
          listCustomTabs: this.renderListCustomTabs(),
    
          // Show or hide status bar
          shouldHideStatusBar: false,
        );
      }

  Widget _slideContentItem({IconData iconData, String title, String content}){
    return Container(child: Column(
      children: <Widget>[
                
      Icon(iconData, 
        size: 100.0, 
        color: Colors.brown, ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(title,
        style: TextStyle(fontSize: 20, 
        fontFamily: 'Helvetica', 
        color: Colors.brown),
        textAlign: TextAlign.center),
      ),
      Text(content,
      style: TextStyle(fontSize: 13, 
      fontFamily: 'Helvetica', 
      color: Colors.brown, 
      fontStyle: FontStyle.italic
      ),
      textAlign: TextAlign.center,)
      ]
      ),
      margin: EdgeInsets.only(left: 60, right: 60),
      );
  }
}
