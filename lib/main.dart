import 'package:flutter/material.dart';
import 'ui.dart';
import 'informationFinalUI.dart';


void main() => runApp(new MyApp());

String level;
String name;

double finalCTC;
double pli;
double bonus;
double basic;
double foodcoupon;
double ber;
double totalTaxableIncome;
double proTax=200.0*12;
double washingAllowan;
double medicalAllowan;
double hraFinal;
double ltaFinal;
double saving;
double aggOfChapVI;
double exemptionUS10;
double taxableIncome;
double incomeTax;
double surcharge;
double pf;
double childAllow;

bool washingB = false;
bool medicalB= false;
bool ltaB = false;
bool childB = false;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Tax Filling Form'),
      routes: <String, WidgetBuilder>{
        "/SecondPage":(BuildContext context) => new FinalInformation(),
      }
    );
  }
}

