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
      } else if (buttonText == '+') {
        _expression += buttonText;
      } else if (buttonText == 'x') {
        int? expressionHolder = int.tryParse(_expression);
        int? buttonTextHoler = int.tryParse(buttonText);
        if (expressionHolder != null) {
          expressionHolder *= buttonTextHoler!;
          _result = _evaluateExpression(expressionHolder.toString());
        } else {}
      } else if (buttonText == '/') {
        double? expressionHolder = double.tryParse(_expression);
        double? buttonTextHoler = double.tryParse(buttonText);

        if (expressionHolder != null && expressionHolder != 0) {
          expressionHolder /= buttonTextHoler!;
          _result = _evaluateExpression(expressionHolder.toString());
        } else {}
      } else if (buttonText == '-') {
        int? expressionHolder = int.tryParse(_expression);
        int? buttonTextHoler = int.tryParse(buttonText);
        if (expressionHolder != null && expressionHolder >= buttonTextHoler!) {
          expressionHolder -= buttonTextHoler;
          _result = _evaluateExpression(expressionHolder.toString());
        } else {}
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                _expression,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                    backgroundColor: Color.fromARGB(255, 230, 110, 13)),
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
