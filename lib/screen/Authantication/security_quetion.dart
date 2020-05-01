import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screenconfigration.dart';
import 'login.dart';

ScreenConfig screenConfig;
Widgetsize widgetsize;

class Securityquetion extends StatefulWidget {
  static String id = 'Securityquetion';

  @override
  _SecurityquetionState createState() => _SecurityquetionState();
}

class Income {
  int id;
  String name;

  Income(this.id, this.name);

  static List<Income> getCompanies() {
    return <Income>[
      Income(1, 'Selct quetion'),
      Income(1, 'what  is your countery'),
      Income(2, 'What is your father name'),
      Income(3, 'what is your fevoret calor '),
    ];
  }
}

class Nationality {
  int id;
  String name;

  Nationality(this.id, this.name);

  static List<Nationality> getNationality() {
    return <Nationality>[
      Nationality(0, 'Selct quetion'),
      Nationality(1, 'Where Are your Father form'),
      Nationality(2, ' what is your faverot  day '),
      Nationality(3, ' what is your  Couentary you was born '),
    ];
  }
}

class _SecurityquetionState extends State<Securityquetion> {
  var _formKey = GlobalKey<FormState>();

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      Navigator.pushNamed(context, Securityquetion.id);
    }
  }

  List<Income> _companies = Income.getCompanies();
  List<DropdownMenuItem<Income>> _dropdownMenuItems;
  Income _selectedCompany;

  List<Nationality> _nationalies = Nationality.getNationality();
  List<DropdownMenuItem<Nationality>> _dropdownMenuItem;
  Nationality _selectedNationality;

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

  List<DropdownMenuItem<Nationality>> buildDropdownMenuItems(List nationalies) {
    List<DropdownMenuItem<Nationality>> items = List();
    for (Nationality nationality in nationalies) {  
      items.add(
        DropdownMenuItem(
          value: nationality,
          child: Text(nationality.name),
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItem(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();

    _dropdownMenuItem = buildDropdownMenuItems(_nationalies);
    _selectedNationality = _dropdownMenuItem[0].value;
  }

  void dispose() {
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/images/Register.png')),
            Text(
              'select security question',
              style: TextStyle(
                  fontSize: widgetsize.titleFontSize, color: Colors.blue),
            ),
            DropdownButton(
              style: TextStyle(
                  color: Colors.black,
                  fontSize: widgetsize.descriptionFontSize),
              underline: SizedBox(),
              value: _selectedCompany,
              items: _dropdownMenuItems,
              onChanged: onChangeDropdownItems,
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.graphic_eq),
                labelText: 'Answer',
              ),
              style: new TextStyle(
                  fontFamily: "Poppins",
                  fontSize: widgetsize.descriptionFontSize),
            ),
            DropdownButton(
              style: TextStyle(
                  color: Colors.black,
                  fontSize: widgetsize.descriptionFontSize),
              underline: SizedBox(),
              items: _dropdownMenuItem,
              value: _selectedNationality,
              onChanged: onChangeDropdownItem,
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.graphic_eq),
                labelText: 'Answer',
              ),
              style: new TextStyle(
                  fontFamily: "Poppins",
                  fontSize: widgetsize.descriptionFontSize),
            ),
            FlatButton(
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: widgetsize.bottomheight,
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: widgetsize.descriptionFontSize),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Colors.blue,
                        Color.fromRGBO(143, 148, 251, .6),
                      ])),
                ),
                onPressed: _submit),
          ],
        ),
      ),
    );
  }

  onChangeDropdownItems(Income selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  onChangeDropdownItem(Nationality selectedNationality) {
    setState(() {
      _selectedNationality = selectedNationality;
    });
  }
}
