import 'package:flutter/material.dart';

enum ScreenType { SMALL, MEDIUM, LARGE }

class ScreenConfig {
  BuildContext context;
  MediaQuery mediaQuery;
  double screenWidth;
  double screenHeight;

  ScreenType screenType;

  ScreenConfig(BuildContext context) {
    this.screenWidth = MediaQuery.of(context).size.height;
    this.screenWidth = MediaQuery.of(context).size.width;

    _setScreen();
  }

  void _setScreen() {
    if (this.screenWidth >= 0 && this.screenWidth <330) {
      this.screenType = ScreenType.SMALL;
    }
    if (this.screenWidth >= 330 && this.screenWidth < 490) {
      this.screenType = ScreenType.MEDIUM;
    }
    if (this.screenWidth >= 490) {
      this.screenType = ScreenType.LARGE;
    }
  }
}

class Widgetsize {
  ScreenConfig screenConfig;

  double titleFontSize;
  double descriptionFontSize;
  double screenDotsWeight;
  double screenDotsHeight;
  double bottomWidth;
  double bottomheight;

  Widgetsize(ScreenConfig screenConfig) {
    this.screenConfig = screenConfig;
    _init();
  }

  void _init() {
    switch (this.screenConfig.screenType) {
      case ScreenType.SMALL:
        this.titleFontSize = 16;
        this.descriptionFontSize=14;
        this.screenDotsHeight=4;
        this.screenDotsWeight=24;
        this.bottomheight=30;
        this.bottomWidth=200;
        break;
      case ScreenType.MEDIUM:
        this.titleFontSize = 25;
        this.descriptionFontSize=19;
        this.screenDotsHeight=6;
        this.screenDotsWeight=28;
        this.bottomheight=50;
        this.bottomWidth=300;
        break;
      case ScreenType.LARGE:
        this.titleFontSize = 50;
        this.descriptionFontSize=32;
        this.screenDotsHeight=15;
        this.screenDotsWeight=50;
        this.bottomheight=100;
        this.bottomWidth=300;
        break;
      default:
        this.titleFontSize = 28;
        this.descriptionFontSize=20;
        this.screenDotsHeight=6;
        this.screenDotsWeight=28;
        this.bottomheight=50;
        this.bottomWidth=300;
    }

  }
}
