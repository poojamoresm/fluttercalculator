import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  int firstnumber;
  int secondnumber;
  String res;
  String texttodisplay = '';
  String operator;

  Widget custombutton( String btnvalue){
    return Expanded(
      child:OutlineButton(
        splashColor: Colors.purple,
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnvalue),
        child: new Text("$btnvalue",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),)
    );
  }

  void btnclicked(String btnval){
    if(btnval == 'C')
      {
         texttodisplay = "";
         res = "";
         firstnumber =0;
         secondnumber = 0;
      }
else if(btnval == '+' || btnval == '-' || btnval == '/' || btnval == '*')
  {
   firstnumber = int.parse(texttodisplay);
   res = '';
   operator = btnval;
  }
else if(btnval == '=' ) {
  secondnumber = int.parse(texttodisplay);
  if(operator == "+")
  {
   res = (firstnumber + secondnumber).toString();
 }
  if(operator == "-")
  {
    res = (firstnumber - secondnumber).toString();
  }
  if(operator == "*")
  {
    res = (firstnumber * secondnumber).toString();
  }
  if(operator == "/")
  {
    res = (firstnumber / secondnumber).toString();
  }
    }
 else{
   res = int.parse(texttodisplay + btnval).toString();
    }
 setState(() {
   texttodisplay = res;
 });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(20.0),
                  child: new Text("$texttodisplay",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            )),

            Row(
              children: [
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+")
              ],
            ),
            Row(
              children: [
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-")
              ],
            ),
            Row(
              children: [
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("*")
              ],
            ),
            Row(
              children: [
                custombutton("0"),
                custombutton("C"),
                custombutton("="),
                custombutton("/")
              ],
            )
          ],
        ),
      ),
    );
  }
}
