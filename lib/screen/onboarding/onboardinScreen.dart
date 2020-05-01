import 'package:financy/screen/Authantication/login.dart';
import 'package:financy/screen/screenconfigration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


ScreenConfig screenConfig;
Widgetsize widgetsize;

class OnboardingScreen extends StatefulWidget {
  static const String id = '/OnboardingScreen';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: widgetsize.screenDotsHeight,
      width: isActive
          ? widgetsize.screenDotsWeight
          : widgetsize.screenDotsWeight - 5,
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenConfig = ScreenConfig(context);
    widgetsize = Widgetsize(screenConfig);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.4, 0.4, 0.9],
                  colors: [
                    Colors.white,
                    Color(0xFF340C4FF),
                    Color(0xFF340C4FF),
                    Color(0xFF2185b7),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, LoginPage.id),
                          child: Text(
                            'Skipe',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: widgetsize.titleFontSize),
                            textAlign: TextAlign.end,
                          )),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * .77,
                        child: PageView(
                          physics: ClampingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: <Widget>[
                            OnBoardingComponant(
                                imageName: 'onboarding0',
                                title: 'Diversity of revenue sources',
                                description:
                                'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.'),
                            OnBoardingComponant(
                                imageName: 'onboarding1',
                                title:
                                'Diversification of banking and financial services diversified',
                                description:
                                'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.'),
                            OnBoardingComponant(
                                imageName: 'onboarding2',
                                title: 'Encourage the stock market',
                                description:
                                'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.'),
                            OnBoardingComponant(
                                imageName: 'onboarding3',
                                title:
                                'Incorporation, finance, management, marketing',
                                description:
                                'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.'),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      ),
                      _currentPage != _numPages - 1
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: widgetsize.titleFontSize),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              return _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ],
                      )
                          : Text(''),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
        width: double.infinity,
        color: Colors.white,
        height: widgetsize.bottomheight,
        child: FlatButton(
          onPressed: () => Navigator.pushNamed(context, LoginPage.id),
          child: Text(
            'GetStart',
            style: TextStyle(
                fontSize: widgetsize.titleFontSize,
                color: Colors.orange,
                fontFamily: 'ComicNeue-BoldItalic'),
          ),
        ),
      )
          : Text(''),
    );
  }
}

// ignore: must_be_immutable

// ignore: must_be_immutable
class OnBoardingComponant extends StatelessWidget {
  String imageName, title, description;

  OnBoardingComponant({this.imageName, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    screenConfig = ScreenConfig(context);
    widgetsize = Widgetsize(screenConfig);
    print(widgetsize);
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Image(
                image: AssetImage(
                  'assets/images/$imageName.png',
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            title,
            style: TextStyle(
                fontSize: widgetsize.titleFontSize,
                color: Colors.white,
                fontFamily: 'ComicNeue-BoldItalic'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.0),
          Text(
            description,
            style: TextStyle(
                fontFamily: 'ComicNeue-BoldItalic',
                fontSize: widgetsize.descriptionFontSize,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
