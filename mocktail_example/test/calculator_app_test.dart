import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_example/calculator.dart';
import 'package:mocktail_example/main.dart';
import 'package:mocktail_example/operation.dart';
import 'package:mocktail_example/operation_widget.dart';

class MockCalculator extends Mock implements Calculator {}
void main() {
  late MockCalculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });
  group('CalculatorApp', () {
    testWidgets('Render 4 widgets of Type ListTile',
        (WidgetTester tester) async {
      // Create the widget - CalculatorApp()
      await tester.pumpWidget(const CalculatorApp());

      // Create the Finders
      final listTileFinder = find.byType(ListTile);

      // Comparing finder with matcher
      expect(listTileFinder, findsNWidgets(4));
    });
  });

  group('add', () {
    testWidgets('show result when gives two numbers', (tester) async {
      await tester.pumpWidget(const CalculatorApp());

      final topTextFieldFinder = find.byKey(const Key('textField_top_Adding'));
      final bottomTextFieldFinder =
          find.byKey(const Key('textField_bottom_Adding'));

      await tester.enterText(topTextFieldFinder, '3');
      await tester.enterText(bottomTextFieldFinder, '7');

      final textResultFinder = find.text('Result: 10.0');
      // await tester.pump();
      await tester.pumpAndSettle();
      expect(textResultFinder, findsOneWidget);
    });
  });

  group('Operation Widget', () {
    testWidgets('render 10 when 3 and 7 added', (tester) async {

      when(() => calculator.add(any(), any())).thenReturn(15);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: OperationWidget(
            operation: Operation.add,
            calculator: calculator,
          ),
        ),
      ));

      await tester.enterText(
          find.byKey(const Key('textField_top_Adding')), '3');
      await tester.enterText(
          find.byKey(const Key('textField_bottom_Adding')), '7');

      await tester.pumpAndSettle();

      expect(find.text('Result: 15.0'), findsOneWidget);
      verify(() => calculator.add(3, 7)).called(1);
    });

    testWidgets('render '' when 3 and 0 added', (tester) async {

      when(() => calculator.divide(3, 0)).thenThrow(Exception('Cannot divide by zero'));

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body:
              OperationWidget(operation: Operation.divide, calculator: calculator),
        ),
      ));

      await tester.enterText(
          find.byKey(const Key('textField_top_Division')), '3');
      await tester.enterText(
          find.byKey(const Key('textField_bottom_Division')), '0');

      await tester.pumpAndSettle();

      expect(find.text('Result: '), findsOneWidget);
    });
  });
}
