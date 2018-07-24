import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'calculation.dart';
import 'ensure_visible_when_focus.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class PersonData {
  String name = '';
  String level = '';

  String ctc='';
  String pli = '';
  String bonus = '';
  String basic = '';
  String foodcoupon = '';
  String ber= '';
  String hra = '';
  String saving = '';

  String washingAllowan;
  String medicalAllowan;
  String ltaFinal;

}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameInput = new TextEditingController();
  TextEditingController levelInput = new TextEditingController();
  TextEditingController ctcInput = new TextEditingController.fromValue(TextEditingValue.empty);
  TextEditingController pliInput = new TextEditingController.fromValue(TextEditingValue.empty);
  TextEditingController bonusInput = new TextEditingController.fromValue(TextEditingValue.empty);
  TextEditingController basicInput = new TextEditingController.fromValue(TextEditingValue.empty);
  TextEditingController berInput = new TextEditingController.fromValue(TextEditingValue.empty);
  TextEditingController hraInput = new TextEditingController.fromValue(TextEditingValue.empty);
  TextEditingController savingInput = new TextEditingController.fromValue(TextEditingValue.empty);

  final List<String> _allActivities = <String>['M-06', 'M-07', 'M-08', 'M-09', 'M-10', 'M-11'];
  String _getLevel = 'M-07';

  final List<String> _fcActivities = <String>['0', '1300', '2600', '3600'];
  String _getFC = '0';

  PersonData person = new PersonData();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  FocusNode _focusNodeName = new FocusNode();
  FocusNode _focusNodeCTC = new FocusNode();
  FocusNode _focusNodePLI = new FocusNode();
  FocusNode _focusNodeBonus = new FocusNode();
  FocusNode _focusNodeBasic = new FocusNode();
  FocusNode _focusNodeBER = new FocusNode();
  FocusNode _focusNodeHRA = new FocusNode();
  FocusNode _focusNodeSaving = new FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameInput.dispose();
    levelInput.dispose();
    ctcInput.dispose();
    pliInput.dispose();
    bonusInput.dispose();
    basicInput.dispose();
    berInput.dispose();
    hraInput.dispose();
    savingInput.dispose();
    super.dispose();
  }

  washingBool(bool value){
    setState(() {
      washingB = value;
    });
  }

  medicalBool(bool value){
    setState(() {
      medicalB = value;
    });
  }

  childBool(bool value){
    setState(() {
      childB = value;
    });
  }

  ltaBool(bool value){
    setState(() {
      ltaB = value;
    });
  }

  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _formKey.currentState;
    if (form == null || form.validate())
      return true;

    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: const Text('This Form has errors'),
          content: const Text('Really leave this form?'),
          actions: <Widget> [
            new FlatButton(
              child: const Text('YES',),
              onPressed: () { Navigator.of(context).pop(true); },
            ),
            new FlatButton(
              child: const Text('NO', style: const TextStyle(color: Colors.red),),
              onPressed: () { Navigator.of(context).pop(false); },
            ),
          ],
        );
      },
    ) ?? false;
  }

  Widget _bodyWidget(){
    return SafeArea(
      top: false,
      bottom: false,
      child: new Form(
        key: _formKey,
        onWillPop: _warnUserAboutInvalidData,
        child:  SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new ListTile(
                  title: new Text('Personal Details', style: TextStyle(fontSize: 15.0),)
              ),

              const SizedBox(height: 10.0),
              new EnsureVisibleWhenFocused(
                focusNode: _focusNodeName,
                child: new TextFormField(
                  autofocus: true,
                  enabled: true,
                  decoration: new InputDecoration(
                    labelText: "Name",
                    border: const UnderlineInputBorder(),
                    filled: true,
                    icon: const Icon(Icons.person),
                    hintText: 'What do people call you?',
                    suffixIcon: new IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: (){nameInput.clear();},
                      tooltip: 'Clear',
                     ),
                  ),
                  onSaved: (String value){person.name = value;},
                  validator: (value) {
                    if (value.isEmpty) {return 'Please enter Name';}
                    },
                  controller: nameInput,
                  focusNode: _focusNodeName,
                ),
              ),

              const SizedBox(height: 10.0),
              new InputDecorator(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.list),
                  filled: true,
                  labelText: "Level",
                  hintText: 'Choose an activity',
                ),
                isEmpty: _getLevel == null,
                child: DropdownButtonHideUnderline(
                  child: new DropdownButton<String>(
                    value: _getLevel,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        _getLevel = newValue;
                        person.level = _getLevel;
                      });
                    },
                    items: _allActivities.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),


              const SizedBox(height: 10.0),
              new Divider(
                height: 1.0,
                color: Colors.blue,
              ),
              new ListTile(
                title: new Text('Income Declaration', style: TextStyle(fontSize: 15.0),)
              ),

              const SizedBox(height: 10.0),
              new EnsureVisibleWhenFocused(
                focusNode: _focusNodeCTC,
                child: new TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  enabled: true,
                  decoration: new InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "CTC",
                    prefixIcon: new Image.asset('images/rupee.png', width: 17.0, height: 17.0, color: Colors.green,),
                    suffixText: 'INR',
                    suffixStyle: const TextStyle(color: Colors.green),
                    filled: true,
                    hintText: ' Your CTC deducting this year PLI?',
                  ),
                  onSaved: (String value){person.ctc = value;},
                  validator: (value) {
                    if (value.isEmpty) {return 'Please enter CTC amount';}
                  },
                  inputFormatters: <TextInputFormatter> [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  controller: ctcInput,
                  focusNode: _focusNodeCTC,
                ),
              ),

              const SizedBox(height: 10.0),
              new EnsureVisibleWhenFocused(
                focusNode: _focusNodePLI,
                child: new TextFormField(
                  autofocus: true,
                  enabled: true,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "PLI",
                    prefixIcon: new Image.asset('images/rupee.png', width: 17.0, height: 17.0, color: Colors.green,),
                    suffixText: 'INR',
                    suffixStyle: const TextStyle(color: Colors.green),
                    border: const OutlineInputBorder(),
                    filled: true,
                    hintText: ' What is you PLI last year?',
                  ),
                  onSaved: (String value){person.pli = value;},
                  validator: (value) {
                    if (value.isEmpty) {return 'Please enter PLI ammount';}
                  },
                  inputFormatters: <TextInputFormatter> [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  controller: pliInput,
                  focusNode: _focusNodePLI,
                ),
              ),

              const SizedBox(height: 10.0),
              new EnsureVisibleWhenFocused(
                focusNode: _focusNodeBonus,
                child: new TextFormField(
                  autofocus: true,
                  enabled: true,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Bonus",
                    prefixIcon: new Image.asset('images/rupee.png', width: 17.0, height: 17.0, color: Colors.green,),
                    suffixText: 'INR',
                    suffixStyle: const TextStyle(color: Colors.green),
                    border: const OutlineInputBorder(),
                    filled: true,
                    hintText: ' What is bonus this year?',
                  ),
                  onSaved: (String value){person.bonus = value;},
                  validator: (value) {
                    if (value.isEmpty) {return 'Please enter Bonus ammount';}
                  },
                  inputFormatters: <TextInputFormatter> [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  controller: bonusInput,
                  focusNode: _focusNodeBonus,
                ),
              ),

              const SizedBox(height: 10.0),
              new Divider(
                height: 1.0,
                color: Colors.blue,
              ),
              ListTile(
                  title: new Text('Monthly Declaration', style: TextStyle(fontSize: 15.0),)
              ),

              const SizedBox(height: 10.0),
              new EnsureVisibleWhenFocused(
                focusNode: _focusNodeBasic,
                child: new TextFormField(
                  autofocus: true,
                  enabled: true,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Basic",
                    prefixIcon: new Image.asset('images/rupee.png', width: 17.0, height: 17.0, color: Colors.green,),
                    suffixText: 'INR',
                    suffixStyle: const TextStyle(color: Colors.green),
                    border: const OutlineInputBorder(),
                    filled: true,
                    hintText: ' What is basic salary per month?',
                  ),
                  onSaved: (String value){person.basic = value;},
                  validator: (value) {
                    if (value.isEmpty) {return 'Please enter Basic ammount';}
                  },
                  inputFormatters: <TextInputFormatter> [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  controller: basicInput,
                  focusNode: _focusNodeBasic,
                ),
              ),

              const SizedBox(height: 10.0),
              new EnsureVisibleWhenFocused(
                focusNode: _focusNodeBER,
                child: new TextFormField(
                  autofocus: true,
                  enabled: true,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "BER",
                    prefixIcon: new Image.asset('images/rupee.png', width: 17.0, height: 17.0, color: Colors.green,),
                    suffixStyle: const TextStyle(color: Colors.green),
                    border: const OutlineInputBorder(),
                    filled: true,
                    hintText: ' What is BER per month?',
                  ),
                  onSaved: (String value){
                    person.ber = value;
                    },
                  validator: (value) {
                    if (value.isEmpty) {return 'Please enter BER ammount, if nill enter 0';}
                  },
                  inputFormatters: <TextInputFormatter> [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  controller: berInput,
                  focusNode: _focusNodeBER,
                ),
              ),

              const SizedBox(height: 10.0),
              new InputDecorator(
                decoration: const InputDecoration(
                  //icon: const Icon(Icons.restaurant),
                  border: const OutlineInputBorder(),
                  filled: true,
                  //prefixText: '\$ ',
                  //prefixStyle: const TextStyle(color: Colors.green),
                  //prefixIcon: new Image.asset('images/rupee.png', width: 17.0, height: 17.0, color: Colors.green,),
                  labelText: "Food Coupon",
                  hintText: 'Choose an activity',
                  suffixText: 'INR',
                  suffixStyle: const TextStyle(color: Colors.green),
                ),
                isEmpty: _getFC  == null,
                child: DropdownButtonHideUnderline(
                  child: new DropdownButton<String>(
                    value: _getFC ,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        _getFC  = newValue;
                        person.foodcoupon = _getFC;
                      });
                    },
                    items: _fcActivities.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),

              const SizedBox(height: 10.0),
              new EnsureVisibleWhenFocused(
                focusNode: _focusNodeHRA,
                child: new TextFormField(
                  autofocus: true,
                  enabled: true,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "HRA",
                    prefixIcon: new Image.asset('images/rupee.png', width: 17.0, height: 17.0, color: Colors.green),
                    suffixText: 'INR',
                    suffixStyle: const TextStyle(color: Colors.green),
                    border: const OutlineInputBorder(),
                    filled: true,
                    hintText: ' What is HRA per month as per receipt?',
                  ),
                  onSaved: (String value){
                    person.hra = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {return 'Please enter HRA ammount, if nill enter 0';}
                  },
                  inputFormatters: <TextInputFormatter> [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  controller: hraInput,
                  focusNode: _focusNodeHRA,
                ),
              ),

              const SizedBox(height: 10.0),
              new EnsureVisibleWhenFocused(
                focusNode: _focusNodeSaving,
                child: new TextFormField(
                  autofocus: true,
                  enabled: true,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Savings u/s 80C",
                    prefixIcon: new Image.asset('images/rupee.png', width: 17.0, height: 17.0, color: Colors.green),
                    suffixText: 'INR',
                    suffixStyle: const TextStyle(color: Colors.green),
                    border: const OutlineInputBorder(),
                    filled: true,
                    hintText: ' Savings u/s 80C',
                  ),
                  onSaved: (String value){
                    person.saving = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {return 'Please enter Saving ammount, if nill enter 0';}
                  },
                  inputFormatters: <TextInputFormatter> [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  controller: savingInput,
                  focusNode: _focusNodeSaving,
                ),
              ),

              const SizedBox(height: 10.0),
              new Divider(
                height: 1.0,
                color: Colors.blue,
              ),
              new ListTile(
                  title: new Text('Other Declaration & Allowance', style: TextStyle(fontSize: 15.0),)
              ),

              new ListTile(
                leading: const Icon(Icons.receipt, color: Colors.blueAccent,),
                title: new Text('Washing Allowance', style: TextStyle(fontSize: 15.0),),
                trailing: Checkbox(
                    value: washingB,
                    onChanged:(bool value){
                      washingBool(value);
                    }
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.local_hospital, color: Colors.blueAccent,),
                title: new Text('Medical Allowance', style: TextStyle(fontSize: 15.0),),
                trailing: Checkbox(
                    value: medicalB,
                    onChanged:(bool value){
                      medicalBool(value);
                    }
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.receipt, color: Colors.blueAccent,),
                title: new Text('Child Allowance', style: TextStyle(fontSize: 15.0),),
                trailing: Checkbox(
                    value: childB,
                    onChanged:(bool value){
                      childBool(value);
                    }
                 ),
              ),

              new ListTile(
                leading: const Icon(Icons.airplanemode_active, color: Colors.blueAccent,),
                title: new Text('LTA', style: TextStyle(fontSize: 15.0),),
                trailing: Checkbox(
                    value: ltaB,
                    onChanged:(bool value){
                      ltaBool(value);
                    }
                ),
              ),

              new Divider(
                height: 1.0,
                color: Colors.blue,
              ),

              const SizedBox(height: 10.0),
              new Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: new FlatButton(
                        child: const Text('CLEAR', style: const TextStyle( fontSize: 20.0),),
                        onPressed: _onClear,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: new FlatButton(
                        child: const Text('SUBMIT', style: const TextStyle( fontSize: 20.0),),
                        textTheme: ButtonTextTheme.accent,
                        onPressed: _onSubmit,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),

            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit(){

    if (_formKey.currentState.validate()){
      nameBlock(nameInput.text);
      levelBlock(_getLevel);
      ctcBlock(double.parse(ctcInput.text));
      pliBlock(double.parse(pliInput.text));
      bonusBlock(double.parse(bonusInput.text));
      basicBlock(double.parse(basicInput.text));
      berAllowance(double.parse(berInput.text));
      foodCoupons(double.parse(_getFC));
      savings(double.parse(savingInput.text));
      hra(double.parse(hraInput.text));
      washingAllowance(washingB);
      medicalAllowance(medicalB);
      childAllowance(childB);
      lta(ltaB);
      taxCalculations();
      Navigator.of(context).pushNamed("/SecondPage");
    }
  }

  void _onClear(){
    nameInput.clear();
    ctcInput.clear();
    pliInput.clear();
    bonusInput.clear();
    berInput.clear();
    basicInput.clear();
    savingInput.clear();
    hraInput.clear();

    setState(() {
      _getLevel = 'M-07';
      _getFC = '0';
      washingB = false;
      medicalB = false;
      childB = false;
      ltaB = false;
    });
  }


  Widget _appBar(){
   return new AppBar(
      title: new Text(widget.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _appBar(),
      body: _bodyWidget(),
      drawer: new Drawer(
        child: new ListView(
          padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("Developed By: Mohit Bariya"),
                accountEmail: new Text("bariya.mohit@gmail.com"),
                currentAccountPicture: new CircleAvatar(
                  //backgroundColor: Colors.blue,
                  child: new Image.asset('images/appicon.png',),
                  //child: new Text("MB"),
                  //backgroundImage: ,
                ),
              ),

              new AboutListTile(
                icon: new Icon(Icons.error_outline),
                applicationVersion: '1.0',
                applicationName: "Tax Projection",
                applicationIcon: new Image.asset('images/appicon.png', width: 50.0, height: 50.0,),
                aboutBoxChildren: <Widget>[
                  new Text("This application is developed By Mr. Mohit Bariya"),
                  new Text(""),
                  new Text("Contact: bariya.mohit@gmail.com"),
                  new Text(""),
                  new Text("Application is not for retail use, it is created for personal use only"),
                ],
              ),

              new ListTile(
                title: new Text("Close"),
                leading: new Icon(Icons.close),
                onTap: ()=>Navigator.of(context).pop(),
              ),
            ],
        ),
      ),
    );
  }
}
