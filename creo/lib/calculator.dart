// import 'package:flutter/material.dart';

// class CalculatorScreen extends StatefulWidget {
//   @override
//   _CalculatorScreenState createState() => _CalculatorScreenState();
// }

// class _CalculatorScreenState extends State<CalculatorScreen> {
//   String _displayText = "0";
//   double _result = 0;
//   String? _currentOperator;
//   bool _isOperatorClicked = false;

//   void _onDigitButtonPressed(String digit) {
//     setState(() {
//       if (_displayText == "0" || _isOperatorClicked) {
//         _displayText = digit;
//         _isOperatorClicked = false;
//       } else {
//         _displayText += digit;
//       }
//     });
//   }

//   void _onOperatorButtonPressed(String operator) {
//     setState(() {
//       _isOperatorClicked = true;
//       _currentOperator = operator;
//       _result = double.parse(_displayText);
//     });
//   }

//   void _onEqualsButtonPressed() {
//     setState(() {
//       double secondOperand = double.parse(_displayText);
//       switch (_currentOperator) {
//         case "+":
//           _result += secondOperand;
//           break;
//         case "-":
//           _result -= secondOperand;
//           break;
//         case "×":
//           _result *= secondOperand;
//           break;
//         case "÷":
//           _result /= secondOperand;
//           break;
//       }
//       _displayText = _result.toString();
//     });
//   }

//   void _onClearButtonPressed() {
//     setState(() {
//       _displayText = "0";
//       _result = 0;
//       _currentOperator = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.all(16),
//               alignment: Alignment.bottomRight,
//               child: Text(
//                 _displayText,
//                 style: TextStyle(fontSize: 48, color: Colors.grey),
//               ),
//             ),
//           ),
//           Divider(height: 1),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   _buildButton("7"),
//                   _buildButton("4"),
//                   _buildButton("1"),
//                   _buildButton("."),
//                 ],
//               ),
//               Column(
//                 children: [
//                   _buildButton("8"),
//                   _buildButton("5"),
//                   _buildButton("2"),
//                   _buildButton("0"),
//                 ],
//               ),
//               Column(
//                 children: [
//                   _buildButton("9"),
//                   _buildButton("6"),
//                   _buildButton("3"),
//                   _buildEqualsButton(),
//                 ],
//               ),
//               Column(
//                 children: [
//                   _buildClearButton(),
//                   _buildOperatorButton("÷"),
//                   _buildOperatorButton("×"),
//                   _buildOperatorButton("-"),
//                   _buildOperatorButton("+"),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildButton(String label) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         primary: Colors.black54, // Background color of the button
//         onPrimary: Colors.white, // Text color
//         shape: RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.circular(0), // Circular shape for the button
//           side: const BorderSide(
//             color: Colors.grey,
//             width: 0,
//           ),
//         ),
//       ),
//       onPressed: () => _onDigitButtonPressed(label),
//       child: Text(label, style: TextStyle(fontSize: 24)),
//     );
//   }

//   Widget _buildOperatorButton(String operator) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         primary: Colors.white, // Background color of the button
//         onPrimary: Colors.black, // Text color
//         shape: RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.circular(0), // Circular shape for the button
//           side: const BorderSide(
//               color: Colors.grey, width: 1.0), // Border around the button
//         ),
//       ),
//       onPressed: () => _onOperatorButtonPressed(operator),
//       child: Text(operator, style: TextStyle(fontSize: 24)),
//     );
//   }

//   Widget _buildEqualsButton() {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.black45,
//         primary: Colors.black54, // Background color of the button
//         onPrimary: Colors.white, // Text color
//         shape: RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.circular(0), // Circular shape for the button
//           side: const BorderSide(
//               color: Colors.grey, width: 1.0), // Border around the button
//         ),
//       ),
//       onPressed: _onEqualsButtonPressed,
//       child: Text("=", style: TextStyle(fontSize: 24)),
//     );
//   }

//   Widget _buildClearButton() {
//     return ElevatedButton(
//       onPressed: _onClearButtonPressed,
//       child: Text("DEL", style: TextStyle(fontSize: 24)),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.black45,
//         primary: Colors.black54, // Background color of the button
//         onPrimary: Colors.white, // Text color
//         shape: RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.circular(0), // Circular shape for the button
//           side: const BorderSide(
//               color: Colors.grey, width: 1.0), // Border around the button
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        try {
          _result = _evaluateExpression(_expression);
        } catch (e) {
          _result = 'Error';
        }
      } else if (buttonText == 'C') {
        _expression = '';
        _result = '';
      } else {
        _expression += buttonText;
      }
    });
  }

  String _evaluateExpression(String expression) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toString();
    } catch (e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                _expression,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            color: Colors.black,
            height: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                _result,
                style: const TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCalculatorButton('7'),
                _buildCalculatorButton('8'),
                _buildCalculatorButton('9'),
                _buildCalculatorButton('/'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCalculatorButton('4'),
                _buildCalculatorButton('5'),
                _buildCalculatorButton('6'),
                _buildCalculatorButton('x'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCalculatorButton('1'),
                _buildCalculatorButton('2'),
                _buildCalculatorButton('3'),
                _buildCalculatorButton('-'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCalculatorButton('C', textColor: Colors.red),
                _buildCalculatorButton('0'),
                _buildCalculatorButton('=',
                    textColor: Colors.white,
                    backgroundColor: Colors.deepPurple),
                _buildCalculatorButton('+'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalculatorButton(String buttonText,
      {Color textColor = Colors.black, Color backgroundColor = Colors.white}) {
    return Expanded(
      child: MaterialButton(
        onPressed: () => _onButtonPressed(buttonText),
        color: backgroundColor,
        padding: EdgeInsets.all(24),
        shape: CircleBorder(),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24, color: textColor),
        ),
      ),
    );
  }
}
