import 'package:financy/screen/screenconfigration.dart';
import 'package:flutter/material.dart';

import 'ContinueOfRegister.dart';

ScreenConfig screenConfig;
Widgetsize widgetsize;

class RegisterPage extends StatefulWidget {
  static const String id = '/RegisterPage';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}
//======================================IIdentityType=============================================*/

class _RegisterPageState extends State<RegisterPage> {

  var _formKey = GlobalKey<FormState>();
  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      Navigator.pushNamed(context, RegisterIdentify.id);

    }}

  @override
  Widget build(BuildContext context) {
    screenConfig = ScreenConfig(context);
    widgetsize = Widgetsize(screenConfig);

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Image(image: AssetImage('assets/images/Register.png')),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Color.fromRGBO(143, 148, 251, .6),
                    ])),
              ),
              TextFieldComponant(
                icon: Icons.perm_identity,
                title: 'First Name',
                keyBoardType: TextInputType.text,
              ),
              TextFieldComponant(
                icon: Icons.perm_identity,
                title: 'Midel  Name',
                keyBoardType: TextInputType.text,
              ),
              TextFieldComponant(
                icon: Icons.perm_identity,
                title: 'Last Name',
                keyBoardType: TextInputType.text,
              ),
              TextFieldComponant(
                icon: Icons.email,
                title: 'Email',
                keyBoardType: TextInputType.text,
              ),
              TextFieldComponant(
                icon: Icons.phone,
                title: 'phone Number',
                keyBoardType: TextInputType.text,
              ),
              TextFieldComponant(
                icon: Icons.person,
                title: 'User Name',
                keyBoardType: TextInputType.text,
              ),
              TextFieldComponant(
                isPassword: true,
                icon: Icons.enhanced_encryption,
                title: 'Password',
                keyBoardType: TextInputType.text,
              ),
              TextFieldComponant(
                isPassword: true,
                icon: Icons.enhanced_encryption,
                title: 'confirm password',
                keyBoardType: TextInputType.text,
              ),
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
                  onPressed: _submit,
              )]),
          ),
        ),
      ),
    ));
  }
}
class TextFieldComponant extends StatelessWidget {
  bool isPassword;
  String title;
  TextInputType keyBoardType;
  IconData icon;

  TextFieldComponant(
      {this.title, this.keyBoardType, this.isPassword = false, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        // ignore: missing_return
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please enter $title';
          }
        },


        obscureText: isPassword,
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: title,
        ),

        keyboardType: keyBoardType,
        style: new TextStyle(
            fontFamily: "Poppins", fontSize: widgetsize.descriptionFontSize),
      ),
    );
  }
}

// ignore: must_be_immutable
