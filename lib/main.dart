


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  String result = "0";
  String output = "0";
  String operand = "";
  double n1 = 0.0;
  double n2 = 0.0;

  buttonpressed(String s)
  {
    if(s == "AC")
    {
      output = "0";
      operand = "";
      n1 = 0.0;
      n2 = 0.0;
    }

    else if(s == "+" || s == "-" || s == "x" || s == "/")
    {
      n1 = double.parse(result);
      operand = s;
      output = '0';
    }

    else if(s == '.')
    {
      if(output.contains('.'))
      {
        print("Already exists");
        return;
      }
      else
        output = output + s;
    }

    else if(s == '=')
    {
      n2 = double.parse(result);
      switch(operand)
      {
        case '+':output = (n1+n2).toString();
                 break;
        case '-':output = (n1-n2).toString();
                 break;
        case 'x':output = (n1*n2).toString();
                 break;
        case '/':output = (n1/n2).toString();
                 break;  
        case '%':output = (n1%n2).toString();                                  
                 break;
      }
      n1 = 0.0;
      n2 = 0.0;
      operand = "";
    }

    else 
    {
      output = output + s;
    }
    print(output);

    setState(() {
      result = double.parse(output).toStringAsFixed(2);      
    });
  }

  Widget button(String s) {
    return new Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(24.0),
        child: Text(
          s,
          style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          buttonpressed(s);
        },
        color: Colors.grey,
        textColor: Colors.black,
      ),
    );
  }

  Widget newbutton(String s) {
    return new Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(24.0),
        child: Text(
          s,
          style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          buttonpressed(s);
        },
        color: Colors.orange,
        textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column(children: <Widget>[
          new Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              child: new Text(
                result,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                ),
              )),
          new Expanded(
            child: new Divider(),
          ),
          new Column(children: [
            new Row(children: [
              button("AC"),
              button("+/-"),
              button("%"),
              newbutton("/"),
            ]),
            new Row(children: [
              button("7"),
              button("8"),
              button("9"),
              newbutton("x"),
            ]),
            new Row(children: [
              button("4"),
              button("5"),
              button("6"),
              newbutton("-"),
            ]),
            new Row(children: [
              button("1"),
              button("2"),
              button("3"),
              newbutton("+"),
            ]),
            new Row(children: [
              button("0"),
              button("."),
              button("="),
              
            ]),
          ]),
        ]),
      ),
    );
  }
}
