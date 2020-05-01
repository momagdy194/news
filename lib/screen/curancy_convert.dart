import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Authantication/login.dart';

class CurrencyConverter extends StatefulWidget {
  static const id = '/CurrencyConverter';

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final fromTextController = TextEditingController();
  List<String> currencies;
  String fromCurrency = "USD";
  String toCurrency = "GBP";
  String result;

  @override
  void initState() {
    super.initState();
    _loadCurrencies();
  }


  Future<String> _loadCurrencies() async {
    String uri = "http://api.openrates.io/latest";
    var response = await http
        .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    Map curMap = responseBody['rates'];
    currencies = curMap.keys.toList();
    setState(() {});
    print(currencies);
    return "Success";
  }

  Future<String> _doConversion() async {
    String uri =
        "http://api.openrates.io/latest?base=$fromCurrency&symbols=$toCurrency";
    var response = await http
        .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    setState(() {
      result = (double.parse(fromTextController.text) *
          (responseBody["rates"][toCurrency]))
          .toString();
    });
    print(result);
    return "Success";
  }

  _onFromChanged(String value) {
    setState(() {
      fromCurrency = value;
    });
  }

  _onToChanged(String value) {
    setState(() {
      toCurrency = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currencies == null
          ? Center(child: CircularProgressIndicator())
          : Stack(
        children: <Widget>[

          ClipPath(
            clipper: CustomShapeClipper1(),
            child: Container(
              height: 300,
              color: Colors.lightBlueAccent,

            ),
          ),
          ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    color: Colors.white30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ListTile(
                          title: TextField(
                            controller: fromTextController,
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.black),
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: true),
                          ),
                          trailing: _buildDropDownButton(fromCurrency),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_downward),
                          onPressed: _doConversion,
                        ),
                        ListTile(
                          title: Chip(
                            label: result != null
                                ? Text(
                              result,
                              style: Theme.of(context)
                                  .textTheme
                                  .display1,
                            )
                                : Text(""),
                          ),
                          trailing: _buildDropDownButton(toCurrency),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropDownButton(String currencyCategory) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ), 
      child: DropdownButton(
        value: currencyCategory,
        items: currencies
            .map((String value) => DropdownMenuItem(
          value: value,
          child: Row(
            children: <Widget>[
              Text(value),
            ],
          ),
        ))
            .toList(),
        onChanged: (String value) {
          if (currencyCategory == fromCurrency) {
            _onFromChanged(value);
          } else {
            _onToChanged(value);
          }
        },
      ),
    );
  }
}
