import 'package:flutter/material.dart';class TransfirForm extends StatefulWidget {  @override  _TransfirFormState createState() => _TransfirFormState();}class _TransfirFormState extends State<TransfirForm> {  @override  Widget build(BuildContext context) {    return Scaffold(      backgroundColor: Color(0xff2E2A97),      appBar: AppBar(        elevation: 0,        backgroundColor: Color(0xff2E2A97),        centerTitle: false,        title: Text(          'Send Money Form',          style: TextStyle(            fontFamily: 'Montserrat',            color: Colors.white,            fontSize: 18.0,          ),        ),      ),      body: ListView(        children: <Widget>[          Container(            height: MediaQuery.of(context).size.height - 0.2, //-300            decoration: BoxDecoration(              color: Colors.white,              borderRadius: BorderRadius.only(                topLeft: Radius.circular(75.0),              ),            ),            child: Padding(                padding: EdgeInsets.only(top: 32, left: 16, right: 16),              child: ListView(                children: <Widget>[                  Row(                    children: <Widget>[                      Text(                        'Name:',                        style: TextStyle(                            fontSize: 18,                            fontWeight: FontWeight.w600,                            color: Color(0xff2E2A97)),                      ),                      SizedBox(                        width: 8,                      ),                      Expanded(                        child: Text('Ahmed',                          maxLines: 3,                          style: TextStyle(                            fontSize: 18,                            fontWeight: FontWeight.w600,                          ),                        ),                      ),                    ],                  )                ],              ),            ),          ),        ],      ),    );  }}