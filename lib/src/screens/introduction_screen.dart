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
  List<Slide> slides = new List();

  @override
  initState(){
    super.initState();
        
        
        slides.add(
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
    
        slides.add(
          Slide([SlideContentItem( widget: Container(child: Column(children: <Widget>[
                //Image.asset('assets/images/mt_logo.png'),
                Icon(MountCarmelIcons.events, size: 100.0, color: Colors.brown,),
                Text(AppConstants.NEWS_AND_UPDATES,
                style: TextStyle(fontSize: 20, 
                fontFamily: 'Helvetica', 
                color: Colors.brown),
                textAlign: TextAlign.center),
                Text(AppConstants.NEWS_AND_UPDATES_DESCRIPTION,
                style: TextStyle(fontSize: 13, 
                fontFamily: 'Helvetica', 
                color: Colors.brown, 
                fontStyle: FontStyle.italic),
                textAlign: TextAlign.center, )
          ],
          ),
          margin: EdgeInsets.only(left: 60, right: 60),
          ),
    
          ),
          SlideContentItem( widget: Container(child: Column(children: <Widget>[
                
                Icon(MountCarmelIcons.sendhelp, size: 100.0, color: Colors.brown, ),
                Text(AppConstants.SEND_HELP,
                style: TextStyle(fontSize: 20, 
                fontFamily: 'Helvetica', 
                color: Colors.brown),
                textAlign: TextAlign.center),
                Text(AppConstants.SEND_HELP_DESCRIPTION,
                style: TextStyle(fontSize: 13, 
                fontFamily: 'Helvetica', 
                color: Colors.brown, 
                fontStyle: FontStyle.italic
                ),
                textAlign: TextAlign.center,)
                ]
                ),
                margin: EdgeInsets.only(left: 60, right: 60),
                ),
    
          ),
          ],
          ),
        );
    
        slides.add(
          Slide([SlideContentItem( widget: Container(child: Column(children: <Widget>[
                //Image.asset('assets/images/mt_logo.png'),
                Icon(MountCarmelIcons.settings, size: 100.0, color: Colors.brown,),
                Text(AppConstants.SERVICES_OFFERED,
                style: TextStyle(fontSize: 20, 
                fontFamily: 'Helvetica', 
                color: Colors.brown),
                textAlign: TextAlign.center),
                Text(AppConstants.SERVICES_OFFERED_DESCRIPTION,
                style: TextStyle(fontSize: 13, 
                fontFamily: 'Helvetica', 
                color: Colors.brown, 
                fontStyle: FontStyle.italic),
                textAlign: TextAlign.center, )
          ],
          ),
          margin: EdgeInsets.only(left: 60, right: 60),
          ),
    
          ),
          SlideContentItem( widget: Container(child: Column(children: <Widget>[
                
                Icon(MountCarmelIcons.transparency, size: 100.0, color: Colors.brown, ),
                Text(AppConstants.TRANSPARENCY_FEATURE,
                style: TextStyle(fontSize: 20, 
                fontFamily: 'Helvetica', 
                color: Colors.brown),
                textAlign: TextAlign.center),
                Text(AppConstants.TRANSPARENCY_FEATURE_DESCRIPTION,
                style: TextStyle(fontSize: 13, 
                fontFamily: 'Helvetica', 
                color: Colors.brown, 
                fontStyle: FontStyle.italic
                ),
                textAlign: TextAlign.center,)
                ]
                ),
                margin: EdgeInsets.only(left: 60, right: 60),
                ),
    
          ),
          ],
          ),
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
        for (int i = 0; i < slides.length; i++) {
          Slide currentSlide = slides[i];
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
          slides: this.slides,
    
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
}
