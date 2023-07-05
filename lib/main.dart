// import 'package:flutter/material.dart';
// import 'package:math_expressions/math_expressions.dart';

// void main() {
//   runApp(
//     const Calculator(),
//   );
// }

// class Calculator extends StatelessWidget {
//   const Calculator({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Simle Calculator",
//       theme: ThemeData(primaryColor: Colors.blue),
//       home: const SimpleCalculator(),
//     );
//   }
// }

// class SimpleCalculator extends StatefulWidget {
//   const SimpleCalculator({Key? key}) : super(key: key);

//   @override
//   State<SimpleCalculator> createState() => _SimpleCalculatorState();
// }

// class _SimpleCalculatorState extends State<SimpleCalculator> {
//   String equation = "0";
//   String result = "0";
//   String expression = "";
//   double equationSize = 38.0;
//   double resultSize = 48.0;

//   void buttonPressed(String buttonText) {
//     setState(() {
//       if (buttonText == "C") {
//         result = "0";
//         equation = "0";
//         equationSize = 38.0;
//         resultSize = 48.0;
//       } else if (buttonText == "⊗") {
//         equation = equation.substring(0, equation.length - 1);
//         if (equation.isEmpty) {
//           equation = "0";
//         }
//         equationSize = 48.0;
//         resultSize = 38.0;
//       } else if (buttonText == "=") {
//         equationSize = 38.0;
//         resultSize = 48.0;

//         expression = equation;
//         expression = expression.replaceAll("×", "*");
//         expression = expression.replaceAll("÷", "/");

//         try {
//           Parser p = Parser();
//           Expression exp = p.parse(expression);

//           ContextModel cm = ContextModel();
//           equation = "${exp.evaluate(EvaluationType.REAL, cm)}";
//           result = equation;
//         } catch (e) {
//           result = "Error";
//         }
//       } else {
//         if (equation == "0") {
//           equation = buttonText;
//         } else {
//           String lastChar = equation.substring(equation.length - 1);
//           if (_isOperator(lastChar) && _isOperator(buttonText)) {
//             equation = equation.substring(0, equation.length - 1);
//           }
//           equation += buttonText;
//         }

//         equationSize = 48.0;
//         resultSize = 38.0;
//       }
//     });
//   }

//   bool _isOperator(String text) {
//     final operators = ['+', '-', '×', '÷'];
//     return operators.contains(text);
//   }

//   Widget buildButton(
//       String buttonText, double buttonHeight, Color buttonColor) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * buttonHeight,
//       child: ElevatedButton(
//         onPressed: () => buttonPressed(buttonText),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: buttonColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(0.0),
//             side: const BorderSide(
//               color: Colors.white,
//               width: 1.0,
//               style: BorderStyle.solid,
//             ),
//           ),
//           padding: const EdgeInsets.all(16.0),
//         ),
//         child: Text(
//           buttonText,
//           style: const TextStyle(
//             fontSize: 30.0,
//             fontWeight: FontWeight.normal,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: MediaQuery.of(context).size.height * 0.1,
//         title: const Text(
//           "Simple Calculator",
//           style: TextStyle(fontSize: 30.0),
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           Container(
//             alignment: Alignment.centerRight,
//             padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
//             child: Text(
//               equation,
//               style: TextStyle(fontSize: equationSize, color: Colors.blue),
//             ),
//           ),
//           Container(
//             alignment: Alignment.centerRight,
//             padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
//             child: Text(
//               result,
//               style: TextStyle(fontSize: resultSize),
//             ),
//           ),
//           const Expanded(
//             child: Divider(color: Colors.white),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: MediaQuery.of(context).size.width * .75,
//                 child: Table(
//                   children: [
//                     TableRow(
//                       children: [
//                         buildButton("C", 0.1, Colors.redAccent),
//                         buildButton("⊗", 0.1, Colors.blue),
//                         buildButton("÷", 0.1, Colors.blue),
//                       ],
//                     ),
//                     TableRow(
//                       children: [
//                         buildButton("7", 0.1, Colors.black54),
//                         buildButton("8", 0.1, Colors.black54),
//                         buildButton("9", 0.1, Colors.black54),
//                       ],
//                     ),
//                     TableRow(
//                       children: [
//                         buildButton("4", 0.1, Colors.black54),
//                         buildButton("5", 0.1, Colors.black54),
//                         buildButton("6", 0.1, Colors.black54),
//                       ],
//                     ),
//                     TableRow(
//                       children: [
//                         buildButton("1", 0.1, Colors.black54),
//                         buildButton("2", 0.1, Colors.black54),
//                         buildButton("3", 0.1, Colors.black54),
//                       ],
//                     ),
//                     TableRow(
//                       children: [
//                         buildButton(".", 0.1, Colors.black54),
//                         buildButton("0", 0.1, Colors.black54),
//                         buildButton("00", 0.1, Colors.black54),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 color: Colors.white,
//                 width: MediaQuery.of(context).size.width * 0.25,
//                 child: Table(
//                   children: [
//                     TableRow(children: [
//                       buildButton("×", 0.1, Colors.blue),
//                     ]),
//                     TableRow(children: [
//                       buildButton("-", 0.1, Colors.blue),
//                     ]),
//                     TableRow(children: [
//                       buildButton("+", 0.1, Colors.blue),
//                     ]),
//                     TableRow(children: [
//                       buildButton("=", 0.2, Colors.redAccent),
//                     ]),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(
    const Calculator(),
  );
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Calculator",
      theme: ThemeData(primaryColor: Colors.blue),
      home: const SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationSize = 38.0;
  double resultSize = 48.0;
  bool evaluated = false;

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        result = "0";
        equation = "0";
        equationSize = 38.0;
        resultSize = 48.0;
        evaluated = false;
      } else if (buttonText == "⊗") {
        equation = equation.substring(0, equation.length - 1);
        if (equation.isEmpty) {
          equation = "0";
        }
        equationSize = 48.0;
        resultSize = 38.0;
      } else if (buttonText == "=") {
        equationSize = 38.0;
        resultSize = 48.0;

        expression = equation;
        expression = expression.replaceAll("×", "*");
        expression = expression.replaceAll("÷", "/");

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          equation = "${exp.evaluate(EvaluationType.REAL, cm)}";
          result = equation;
        } catch (e) {
          result = "Error";
        }

        evaluated = true;
      } else {
        if (evaluated) {
          equation = buttonText;
          evaluated = false;
        } else {
          if (equation == "0") {
            equation = buttonText;
          } else {
            String lastChar = equation.substring(equation.length - 1);
            if (_isOperator(lastChar) && _isOperator(buttonText)) {
              equation = equation.substring(0, equation.length - 1);
            }
            equation += buttonText;
          }
        }

        equationSize = 48.0;
        resultSize = 38.0;
      }
    });
  }

  bool _isOperator(String text) {
    final operators = ['+', '-', '×', '÷'];
    return operators.contains(text);
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * buttonHeight,
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: const BorderSide(
              color: Colors.white,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: const Text(
          "Simple Calculator",
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationSize, color: Colors.blue),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultSize),
            ),
          ),
          const Expanded(
            child: Divider(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 0.1, Colors.redAccent),
                        buildButton("⊗", 0.1, Colors.blue),
                        buildButton("÷", 0.1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("7", 0.1, Colors.black54),
                        buildButton("8", 0.1, Colors.black54),
                        buildButton("9", 0.1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("4", 0.1, Colors.black54),
                        buildButton("5", 0.1, Colors.black54),
                        buildButton("6", 0.1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("1", 0.1, Colors.black54),
                        buildButton("2", 0.1, Colors.black54),
                        buildButton("3", 0.1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(".", 0.1, Colors.black54),
                        buildButton("0", 0.1, Colors.black54),
                        buildButton("00", 0.1, Colors.black54),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("×", 0.1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("-", 0.1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("+", 0.1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("=", 0.2, Colors.redAccent),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

