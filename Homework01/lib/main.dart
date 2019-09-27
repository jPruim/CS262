import 'package:flutter/material.dart';

void main() => runApp(new MyCalculatorApp());

class MyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "MyCalculator",
          home:MyCalculator()
    );
  }
}
class MyCalculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Calculator();
  }
}

class Calculator extends State<MyCalculator> {
  String textToShow = "";
  // ignore: non_constant_identifier_names
  final controllerNumberA = TextEditingController();
  final controllerNumberB = TextEditingController();
  final myFormKey = GlobalKey<FormState>();

  String result = "";
  //sum function
  void sum(){
  if(myFormKey.currentState.validate()){
    int numberA = int.parse(controllerNumberA.text);
    int numberB = int.parse(controllerNumberB.text);
    int result = numberA + numberB;
    setState((){
      textToShow = "$numberA + $numberB = $result";
    }
    );
  }
}
  void minus(){
  if(myFormKey.currentState.validate())
  {
    int numberA = int.parse(controllerNumberA.text);
    int numberB = int.parse(controllerNumberB.text);
    int result = numberA - numberB;
    setState(()
    {
      textToShow = "$numberA - $numberB = $result";
    }
    );
  }
}
  void times(){
  if(myFormKey.currentState.validate()){
    int numberA = int.parse(controllerNumberA.text);
    int numberB = int.parse(controllerNumberB.text);
    int result = numberA * numberB;
    setState(()
    {
      textToShow = "$numberA * $numberB = $result";
    }
    );
  }
}
  void div(){
    if(myFormKey.currentState.validate()){
      int numberA = int.parse(controllerNumberA.text);
      int numberB = int.parse(controllerNumberB.text);
      double result = numberA / numberB;
      setState(()
      {
        textToShow = "$numberA / $numberB = $result";
      }
      );
    }
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(body:Form(key:myFormKey,child:
    Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
              controller: controllerNumberA,
              validator: (value) {
                if(value.isEmpty) {
                  return "Please enter nember";
                }
                return null;
              },
              decoration: InputDecoration(hintText: "Enter number"),
              keyboardType: TextInputType.number),
          TextFormField(
              controller: controllerNumberB,
              validator: (value){
                if(value.isEmpty) return "Please enter nember";
                return null;
              },
              decoration: InputDecoration(hintText: "Enter number"),
              keyboardType: TextInputType.number),
          Text(textToShow,style:TextStyle(fontSize: 20.0),),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
            RaisedButton(onPressed: sum, child: Text('+'),),
            RaisedButton(onPressed: minus, child: Text('-'),),
            RaisedButton(onPressed: times, child: Text('*'),),
            RaisedButton(onPressed: div, child: Text('/'),),

          ])
        ],
    )
    )
    );
  }
}