import 'package:financy/screen/Authantication/Stepper.dart';
import 'package:financy/screen/animation/FadeAnimation.dart';
import 'package:financy/screen/curancy_convert.dart';
import 'package:financy/screen/dashboard.dart';
import 'package:financy/screen/screenconfigration.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

ScreenConfig screenConfig;
Widgetsize widgetsize;

class LoginPage extends StatefulWidget {
  static const String id = '/loginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  var _formKey = GlobalKey<FormState>();
 void _submit() {
    final form = _formKey.currentState;

    if (form.validate()) {
      Navigator.pushNamed(context, Dashboard.id);

    }}
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenConfig = ScreenConfig(context);
    widgetsize = Widgetsize(screenConfig);
    var h = MediaQuery.of(context).size.height;
//    var size = MediaQuery.of(context).size;
    // if (_controller.value == 0.8) _controller.reverse();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: h / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logos1.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 190,
                        child: FadeAnimation(
                            1,
                            Container(
                              height: widgetsize.bottomheight,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/curen1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 100,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: h * .65,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/curen2.png'))),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextFormField(
                                      // ignore: missing_return
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Please enter Email';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: widgetsize
                                                  .descriptionFontSize)),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      // ignore: missing_return
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Please enter Password';
                                        }
                                      },

                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize:
                                                widgetsize.descriptionFontSize),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          2,
                          Container(
                              height: widgetsize.bottomheight,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Colors.blue,
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: FlatButton(
                                onPressed:
                                _submit
                                ,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: widgetsize.descriptionFontSize),
                                ),
                              ))),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FadeAnimation(
                            1.5,
                            FlatButton(
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: widgetsize.descriptionFontSize),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          FadeAnimation(
                              1.5,
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, TabsView.id);
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize:
                                            widgetsize.descriptionFontSize),
                                  )))
                        ],
                      ),
                      Container(
                        height: widgetsize.bottomheight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Colors.white,
                              Color.fromRGBO(143, 148, 251, .6),
                            ])),
                        child: FlatButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      height: h, child: CurrencyConverter());
                                });
                          },
                          child: Text(
                            "Currency Converter",
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: widgetsize.descriptionFontSize),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

//Widget input(String hint, {bool isPass = false}) {
//  var _formKey =GlobalKey<FormState>();
//  return Form(
//    key: _formKey,
//    child: TextFormField(
//      obscureText: isPass,
//      decoration: InputDecoration(
//          hintText: hint,
//          hintStyle: TextStyle(color: Color(0xFFACACAC), fontSize: 14),
//          contentPadding: EdgeInsets.only(top: 20, bottom: 20, left: 38),
//          enabledBorder: OutlineInputBorder(
//            borderSide: BorderSide(color: Color(0xFFF1F1F1)),
//            borderRadius: BorderRadius.all(Radius.circular(30.0)),
//          ),
//          focusedBorder: OutlineInputBorder(
//            borderSide: BorderSide(color: Color(0xFFC7C7C7)),
//            borderRadius: BorderRadius.all(Radius.circular(30.0)),
//          )),
//  validator: (String value) {
//    if (value.isEmpty) {
//      return 'Please enter principal amount';
//    }
//  } ),
//  );
//}

class CustomShapeClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;
    var path = Path();
    path.lineTo(0, h - 200);
    path.quadraticBezierTo(w / 3, h / 2, w / 2, h - 100);
    path.quadraticBezierTo(w - (w / 3), h, w, h);

    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;

  DrawClip(this.move);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
