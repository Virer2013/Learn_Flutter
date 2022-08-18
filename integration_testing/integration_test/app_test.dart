import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('app test', () {
    testWidgets('adding 20 and 58.2 and gets number from the service', (tester) async {
      // Можно вызывать все приложение по виджету, переданного в метод runApp
      // await tester.pumpWidget(const CalculatorApp());
      
      // Или таким образом
      app.main(); 
      // Wait for the load data
      await tester.pumpAndSettle();
      
      final topTextFieldFinder = find.byKey(const Key('textField_top_Adding'));
      final bottomTextFieldFinder =
          find.byKey(const Key('textField_bottom_Adding'));

      await tester.enterText(topTextFieldFinder, '20');
      await Future.delayed(const Duration(seconds: 2));

      await tester.enterText(bottomTextFieldFinder, '58.2');
      await Future.delayed(const Duration(seconds: 2));

      final textResultFinder = find.text('Result: 78.2');
      await tester.pump();

      expect(textResultFinder, findsOneWidget);

      final elevatedButtonFinder = find.byKey(const Key('elevated_button_Adding'));
      
      await tester.tap(elevatedButtonFinder);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      
      expect(find.textContaining('78 is the'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 5));
    });
  });
}