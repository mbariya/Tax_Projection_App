import 'package:flutter/material.dart';
import 'main.dart';

class FinalInformation extends StatefulWidget {
  @override
  _FinalInformationState createState() => _FinalInformationState();
}

class _FinalInformationState extends State<FinalInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Final Information"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0,top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading: Icon(Icons.person, color: Colors.blueAccent,),
                title: Text('Name:  $name'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0,top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.list, color: Colors.blueAccent,),
                title: Text('Level:  $level'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.attach_money, color: Colors.blueAccent,),
                title: Text('CTC:   ${(finalCTC.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.attach_money, color: Colors.blueAccent,),
                title: Text('PLI:    ${(pli.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.attach_money, color: Colors.blueAccent,),
                title: Text('Bonus:    ${(bonus.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.attach_money, color: Colors.blueAccent,),
                title: Text('Basic:    ${(basic.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.directions_car, color: Colors.blueAccent,),
                title: Text('BER:    ${(ber.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.restaurant, color: Colors.blueAccent,),
                title: Text('Food Coupon:    ${(foodcoupon.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.receipt, color: Colors.blueAccent,),
                title: Text('Washing Allowance:    ${(washingAllowan.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.local_hospital, color: Colors.blueAccent,),
                title: Text('Medical Allowance:    ${(medicalAllowan.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.home, color: Colors.blueAccent,),
                title: Text('HRA:    ${(hraFinal.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.airplanemode_active, color: Colors.blueAccent,),
                title: Text('LTA:    ${(ltaFinal.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.attach_money, color: Colors.blueAccent,),
                title: Text('Gross Salary:    ${(totalTaxableIncome.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.attach_money, color: Colors.blueAccent,),
                title: Text('Agg of Chap VI:    ${(aggOfChapVI.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.attach_money, color: Colors.blueAccent,),
                title: Text('Exemption U/S 10:    ${(exemptionUS10.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.attach_money, color: Colors.blueAccent,),
                title: Text('Taxable Income:   ${(taxableIncome.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.attach_money, color: Colors.blueAccent,),
                title: Text('IncomeTax:    ${(incomeTax.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
            new Card(
              margin: EdgeInsets.only(left:20.0, right:20.0, top: 5.0, bottom: 5.0),
              child: new ListTile(
                leading:const Icon(Icons.attach_money, color: Colors.blueAccent,),
                title: Text('Surcharge & Cess :    ${(surcharge.toInt()).toString()}'),
                trailing: Text('INR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
