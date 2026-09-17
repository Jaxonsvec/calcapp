import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calcapp1/main.dart';

void main() {
  // Build Test 1
  testWidgets('Calculator app builds', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    expect(find.text('Calculator'), findsOneWidget);
  });

  // Build Test 2
  testWidgets('Calculator buttons are displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    expect(find.byKey(const Key('button7')), findsOneWidget);
    expect(find.byKey(const Key('button=')), findsOneWidget);
    expect(find.byKey(const Key('buttonC')), findsOneWidget);
  });

  // Behavior Test 1
  testWidgets('Calculator adds numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    await tester.tap(find.byKey(const Key('button2')));
    await tester.tap(find.byKey(const Key('button+')));
    await tester.tap(find.byKey(const Key('button3')));
    await tester.tap(find.byKey(const Key('button=')));
    await tester.pump();

    expect(
      tester.widget<Text>(
        find.byKey(const Key('calculatorDisplay')),
      ).data,
      '5.0',
    );
  });

  // Behavior Test 2
  testWidgets('Calculator subtracts numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    await tester.tap(find.byKey(const Key('button8')));
    await tester.tap(find.byKey(const Key('button-')));
    await tester.tap(find.byKey(const Key('button3')));
    await tester.tap(find.byKey(const Key('button=')));
    await tester.pump();

    expect(
      tester.widget<Text>(
        find.byKey(const Key('calculatorDisplay')),
      ).data,
      '5.0',
    );
  });

  // Behavior Test 3
  testWidgets('Calculator multiplies numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    await tester.tap(find.byKey(const Key('button4')));
    await tester.tap(find.byKey(const Key('button×')));
    await tester.tap(find.byKey(const Key('button3')));
    await tester.tap(find.byKey(const Key('button=')));
    await tester.pump();

    expect(
      tester.widget<Text>(
        find.byKey(const Key('calculatorDisplay')),
      ).data,
      '12.0',
    );
  });

  // Behavior Test 4
  testWidgets('Calculator divides numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    await tester.tap(find.byKey(const Key('button8')));
    await tester.tap(find.byKey(const Key('button÷')));
    await tester.tap(find.byKey(const Key('button2')));
    await tester.tap(find.byKey(const Key('button=')));
    await tester.pump();

    expect(
      tester.widget<Text>(
        find.byKey(const Key('calculatorDisplay')),
      ).data,
      '4.0',
    );
  });

  // Behavior Test 5
  testWidgets('Clear button resets calculator', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    await tester.tap(find.byKey(const Key('button9')));
    await tester.tap(find.byKey(const Key('buttonC')));
    await tester.pump();

    expect(
      tester.widget<Text>(
        find.byKey(const Key('calculatorDisplay')),
      ).data,
      '0',
    );
  });
}