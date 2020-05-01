import 'dart:io';

import 'package:financy/screen/Authantication/login.dart';
import 'package:financy/screen/Authantication/regiester.dart';
import 'package:financy/screen/Authantication/security_quetion.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../screenconfigration.dart';


ScreenConfig screenConfig;
Widgetsize widgetsize;

class RegisterIdentify extends StatefulWidget {
  static String id = 'RegisterPage2';

  @override
  _RegisterIdentifyState createState() => _RegisterIdentifyState();
}

class IIdentityType {
  int id;
  String name;

  IIdentityType(this.id, this.name);

  static List<IIdentityType> getIdentityType() {
    return <IIdentityType>[
      IIdentityType(0, 'IdentityType'),
      IIdentityType(1, 'Civil number'),
      IIdentityType(2, ' Military identity'),
      IIdentityType(3, ' Security card'),
      IIdentityType(4, ' Driving Licenser'),
    ];
  }
}

class Income {
  int id;
  String name;

  Income(this.id, this.name);

  static List<Income> getCompanies() {
    return <Income>[
      Income(0, 'Income'),
      Income(1, 'Salary and profit'),
      Income(2, 'Salary and profit'),
      Income(3, 'Salary'),
      Income(4, 'Salaries and bonuses'),
      Income(5, 'Butler salaries'),
      Income(6, 'Servant compensation'),
      Income(7, 'Driver\'s salary'),
      Income(8, 'Driver compensation'),
      Income(9, 'Maid salaries'),
    ];
  }
}

class Nationality {
  int id;
  String name;

  Nationality(this.id, this.name);

  static List<Nationality> getNationality() {
    return <Nationality>[
      Nationality(0, 'Nationality'),
      Nationality(1, 'Yemen'),
      Nationality(2, 'Saudi Arabia'),
      Nationality(3, 'U.A.E'),
      Nationality(4, 'Qatar'),
      Nationality(5, 'Bahrain'),
      Nationality(6, 'Kuwait'),
      Nationality(7, 'Jordan'),
      Nationality(8, 'Lebanon'),
      Nationality(9, 'Iraq'),
      Nationality(10, 'Syria'),
      Nationality(11, 'Egypt'),
      Nationality(12, 'Libya'),
      Nationality(13, 'Tunisia'),
      Nationality(14, 'Algeria'),
      Nationality(15, 'Morocco'),
      Nationality(16, 'Mauritania'),
      Nationality(17, 'Somalia'),
      Nationality(18, 'Dijbouti'),
      Nationality(19, 'Sudan'),
      Nationality(20, 'Palestinian Terrorities'),
      Nationality(21, 'Comoros'),
      Nationality(21, 'Oman')
    ];
  }
}


class _RegisterIdentifyState extends State<RegisterIdentify> {
  File _image;
  File _images2;
  int group = 1;
  DateTime _prithdayDate;
  DateTime _expairData;

  var _formKey = GlobalKey<FormState>();
  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      Navigator.pushNamed(context, Securityquetion.id);

    }}

  List<IIdentityType> _identityTypes = IIdentityType.getIdentityType();
  List<DropdownMenuItem<IIdentityType>> _dropdowenMenuItems;
  IIdentityType _selectIdentityType;

  List<Income> _companies = Income.getCompanies();
  List<DropdownMenuItem<Income>> _dropdownMenuItems;
  Income _selectedCompany;

  List<Nationality> _nationalies = Nationality.getNationality();
  List<DropdownMenuItem<Nationality>> _dropdownMenuItem;
  Nationality _selectedNationality;



  List<DropdownMenuItem<Nationality>> buildDropdownMenuItems(List nationalies) {
    List<DropdownMenuItem<Nationality>> items = List();
    for (Nationality nationality in nationalies) {
      items.add(
        DropdownMenuItem(
          value: nationality,
          child: Text(nationality.name,),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<Income>> buildDropdownMenuItem(List companies) {
    List<DropdownMenuItem<Income>> items = List();
    for (Income company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<IIdentityType>> builderDropDownMenu(
      // ignore: non_constant_identifier_names
      List IdentityTypes) {
    List<DropdownMenuItem<IIdentityType>> items = List();
    for (IIdentityType IdentityType in IdentityTypes) {
      items.add(DropdownMenuItem(
        value: IdentityType,
        child: Text(IdentityType.name),
      ));
    }
    return items;
  }

  @override
  void initState() {
    _dropdowenMenuItems = builderDropDownMenu(_identityTypes);
    _selectIdentityType = _dropdowenMenuItems[0].value;

    _dropdownMenuItems = buildDropdownMenuItem(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;

    _dropdownMenuItem = buildDropdownMenuItems(_nationalies);
    _selectedNationality = _dropdownMenuItem[0].value;
    super.initState();
  }

  @override
  void dispose() {
    _dropdowenMenuItems = builderDropDownMenu(_identityTypes);
    _selectIdentityType = _dropdowenMenuItems[0].value;

    _dropdownMenuItems = buildDropdownMenuItem(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;

    _dropdownMenuItem = buildDropdownMenuItems(_nationalies);
    _selectedNationality = _dropdownMenuItem[0].value;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    screenConfig = ScreenConfig(context);
    widgetsize = Widgetsize(screenConfig);

    // ignore: non_constant_identifier_names


    // ignore: non_constant_identifier_names
    void OpenGalery() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    }

    // ignore: non_constant_identifier_names
    void OpenGalery2() async {
      var images2 = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _images2 = images2;
      });
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            child: Form(
               key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(image: AssetImage('assets/images/Register.png'),fit: BoxFit.cover,),

                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                        underline: SizedBox(),
                        items: _dropdowenMenuItems,
                        value: _selectIdentityType,
                        onChanged: onChangeDropedowenItem,
                      ),
                    ),
                    TextFieldComponant(
                      title: 'ID Number',
                      keyBoardType: TextInputType.number,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Colors.blue,
                              Colors.white
                            ])),
                        child: FlatButton(
                            child: Text(
                              _prithdayDate == null
                                  ? 'Expaier Data'
                                  : _prithdayDate.toString(),
                              style: TextStyle(fontSize: widgetsize.descriptionFontSize,color: Colors.white),
                            ),
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: _prithdayDate == null
                                      ? DateTime.now()
                                      : _prithdayDate,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030))
                                  .then((date) {
                                setState(() {
                                  _prithdayDate = date;
                                });
                              });
                            })),
                    Row(
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                              OpenGalery();
                            },
                            child: _image == null
                                ? Column(
                              children: <Widget>[
                                Text('Upload Back side of ',style: TextStyle(fontSize: widgetsize.descriptionFontSize),),
                                Row(
                                  children: <Widget>[
                                    Text('your ID Card'),
                                    Icon(Icons.attach_file),
                                  ],
                                ),
                              ],
                            )
                                : Container(
                                height: 70,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Image.file(_image),
                                    Text('Change Photo',style: TextStyle(fontSize: widgetsize.descriptionFontSize),),
                                    Icon(Icons.attach_file)
                                  ],
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                              OpenGalery2();
                            },
                            child: _images2 == null
                                ? Column(
                              children: <Widget>[
                                Text('Upload Back side of ',style: TextStyle(fontSize: widgetsize.descriptionFontSize),),
                                Row(
                                  children: <Widget>[
                                    Text('your ID Card',style: TextStyle(fontSize: widgetsize.descriptionFontSize),),
                                    Icon(Icons.attach_file),
                                  ],
                                ),
                              ],
                            )
                                : Container(
                                height: 70,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Image.file(_images2),
                                    Text(
                                      'Change Photo',style: TextStyle(fontSize: widgetsize.descriptionFontSize),
                                    ),
                                    Icon(Icons.attach_file)
                                  ],
                                ))),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                        underline: SizedBox(),
                        items: _dropdownMenuItem,
                        value: _selectedNationality,
                        onChanged: onChangeDropdownItem,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                        underline: SizedBox(),
                        value: _selectedCompany,
                        items: _dropdownMenuItems,
                        onChanged: onChangeDropdownItems,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text('Sex :',style: TextStyle(fontSize: widgetsize.titleFontSize)),
                        Radio(
                            value: 1,
                            groupValue: group,
                            onChanged: (T) {
                              setState(() {
                                group = T;
                              });
                            }),
                        Text('male',style: TextStyle(fontSize: widgetsize.descriptionFontSize)),
                        Radio(
                            value: 2,
                            groupValue: group,
                            onChanged: (T) {
                              setState(() {
                                group = T;
                              });
                            }),
                        Text('Femail',style: TextStyle(fontSize: widgetsize.descriptionFontSize)),
                      ],
                    ),
                    TextFieldComponant(
                      title: 'Occupattion',
                      keyBoardType: TextInputType.text,

                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Colors.blue,
                              Colors.white
                            ])),
                        child: FlatButton(
                            child: Text(
                              _expairData == null
                                  ? 'Expaier Data'
                                  : _expairData.toString(),
                              style: TextStyle(fontSize: widgetsize.descriptionFontSize,color: Colors.white),
                            ),
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: _expairData == null
                                      ? DateTime.now()
                                      : _expairData,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030))
                                  .then((date) {
                                setState(() {
                                  _expairData = date;
                                });
                              });
                            })),
                    SizedBox(height: widgetsize.bottomheight,),
                    FlatButton(
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: widgetsize.bottomheight,
                          child: Text('Continue',style: TextStyle(fontSize: widgetsize.descriptionFontSize),),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Colors.blue,
                                Color.fromRGBO(143, 148, 251, .6),
                              ])),
                        ),
                        onPressed: _submit)
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }

  onChangeDropedowenItem(IIdentityType selectedIdentityType) {
    setState(() {
      _selectIdentityType = selectedIdentityType;
    });
  }

  onChangeDropdownItem(Nationality selectedNationality) {
    setState(() {
      _selectedNationality = selectedNationality;
    });
  }

  onChangeDropdownItems(Income selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

