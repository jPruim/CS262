import 'package:flutter/material.dart'; //imported flutter material package

class HomePage extends StatefulWidget{ // creating a stateful widget
  @override
  State createState() => new HomePageState(); // creating the state
}

class HomePageState extends State<HomePage>{
  var ansStr = "0";
  _one() {
    setState(() {
      ansStr += "1";
    });
  }
  _two() {
    setState(() {
      ansStr += "2";
    });
  }
  _three() {
    setState(() {
      ansStr += "3";
    });
  }
  _four() {
    setState(() {
      ansStr += "4";
    });
  }
  _five() {
    setState(() {
      ansStr += "5";
    });
  }
  _six() {
    setState(() {
      ansStr += "6";
    });
  }
  _seven() {
    setState(() {
      ansStr += "7";
    });
  }
  _eight() {
    setState(() {
      ansStr += "8";
    });
  }

  @override
  Widget build(BuildContext context) { // creating the widget
    return new Scaffold(
        appBar: new AppBar( //defines the content of the Appbar
          title: new Text("Calculator"),
        ),

        body: Container(
          child: Column( //Since we have multiple children arranged vertically, we are using column
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal vertical space between all the children of column
            children: <Widget>[ // the column widget uses the children property
              Container( // Display Container
                constraints: BoxConstraints.expand( // Creating a boxed container
                  height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 100.0,
                ),
                alignment: Alignment.bottomRight, // Aligning the text to the bottom right of our display screen
                color: Colors.white, // Seting the background color of the container
                child: Text(
                 "$ansStr",
                  style: TextStyle( // Styling the text
                      fontSize: 50.0,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("9", _nine), // using custom widget _button
                  _button("8", _eight),
                  _button("7", _seven),
                  _button("+", _plus)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("6", _six), // using custom widget _button
                  _button("5", _five),
                  _button("4", _four),
                  _button("-", _minus)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("3", _three), // using custom widget _button
                  _button("2", _two),
                  _button("1", _one),
                  _button("*", _plus)
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("C", _clear), // using custom widget _button
                  _button("0", _zero),
                  _button("=", _disp),
                  _button("/", _div)
                ],
              )

            ],
          ),
        )
    );
  }
}
Widget _button (String number, Function() f){ // Creating a method of return type Widget with number and function f as a parameter
  return MaterialButton(
    height: 100.0,
    child: Text(number,
        style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
    textColor: Colors.black,
    color: Colors.grey[100],
    onPressed: f,
  );
}