import 'package:calculator/ButtonDes.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  var userVar = '';
  var userAns = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userVar,
                        style: TextStyle(
                            fontFamily: 'Rokkitt',
                            fontSize: 40,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAns,
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Rokkitt',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userVar = '';
                          });
                        },
                        color: Colors.green,
                        textColor: Colors.white,
                        buttonText: buttons[index],
                      );
                    } else if (index == 1) {
                      return MyButton(
                        buttonTapped: (){
                          setState(() {
                            userVar = userVar.substring(0,userVar.length -1);
                          });
                        },
                        color: Colors.red,
                        textColor: Colors.white,
                        buttonText: buttons[index],
                      );
                    }
                    // = pressed
                    else if(index==buttons.length-1 || index == buttons.length-2){
                    return MyButton(
                    buttonTapped: (){
                      setState(() {
                        userAns=equals(userVar);
                      });

                    },
                    color: isOperator(buttons[index])
                    ? Colors.deepPurple
                        : Colors.white,
                    textColor: isOperator(buttons[index])
                    ? Colors.white
                        : Colors.deepPurple,
                    buttonText: buttons[index]);
                    }
                    else {
                      return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userVar += buttons[index];
                            });
                          },
                          color: isOperator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.white,
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                          buttonText: buttons[index]);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool isOperator(String x) {
  if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=')
    return true;
  return false;
}
String equals( String temp)
{
  print('before $temp');
  temp=temp.replaceAll('x', '*');
  print('after $temp');
  Parser p = Parser();
  Expression exp = p.parse(temp);
  ContextModel cm = ContextModel();
  // Evaluate expression:
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  return eval.toString();
}
/* */
