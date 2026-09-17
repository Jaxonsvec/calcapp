import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String display = '0';
  double firstNumber = 0;
  String operation = '';

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        display = '0';
        firstNumber = 0;
        operation = '';
      } else if (value == '+' ||
          value == '-' ||
          value == '×' ||
          value == '÷') {
        firstNumber = double.tryParse(display) ?? 0;
        operation = value;
        display = '0';
      } else if (value == '=') {
        double secondNumber = double.tryParse(display) ?? 0;
        double result = 0;

        if (operation == '+') {
          result = firstNumber + secondNumber;
        } else if (operation == '-') {
          result = firstNumber - secondNumber;
        } else if (operation == '×') {
          result = firstNumber * secondNumber;
        } else if (operation == '÷') {
          result = firstNumber / secondNumber;
        }

        display = result.toString();
        operation = '';
      } else {
        if (display == '0') {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                display,
                key: const Key('calculatorDisplay'),
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
          for (var row in [
            ['7', '8', '9', '÷'],
            ['4', '5', '6', '×'],
            ['1', '2', '3', '-'],
            ['C', '0', '=', '+'],
          ])
            Expanded(
              child: Row(
                children: row.map((value) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ElevatedButton(
                        key: Key('button$value'),
                        onPressed: () => buttonPressed(value),
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}