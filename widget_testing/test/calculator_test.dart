import 'package:flutter_test/flutter_test.dart';
import 'package:widget_testing/calculator.dart';

void main() {
  late Calculator calculator;

  // setUpAll(() => print('Runs BEFORE any test is executed'));

  setUp(() {
    calculator = Calculator();
  });

  // tearDown(() => print('Runs AFTER EVERY any test is executed'));

  // tearDownAll(() => print('Runs AFTER any test is executed'));

  group('add', () {
    test('the calculator return 5 when adding 1 and 4', () {
      // Arrange (Setup) -> create the calculator object
      // final calculator = Calculator();

      // Act (Action) -> collect the result you want to test
      final result = calculator.add(1, 4);

      // Assert (Result) -> compare the result against and expected value
      expect(result, 5.0, reason: 'It should be exactly 5');
    });

    test('Calculator creates a non null object', () {
      // Assert (Result) -> compare the result against and expected value
      expect(Calculator(), isNotNull);
    });

    test('the calculator returns an double number when adding 1 and 4', () {
      // Arrange (Setup) -> create the calculator object
      // final calculator = Calculator();

      // Act (Action) -> collect the result you want to test
      final result = calculator.add(1, 4);

      // Assert (Result) -> compare the result against and expected value
      expect(result, isA<double>());
    });
  });

  group('subtract', () {
    test('the calculator returns 5 when subtracting 6 and 1', () {
      // Arrange (Setup) -> create the calculator object
      // final calculator = Calculator();

      // Act (Action) -> collect the result you want to test
      final result = calculator.substract(6, 1);

      // Assert (Result) -> compare the result against and expected value
      expect(result, 5);
    });
  });

  group('multiple', () {
    test('the calculator returns 10 when multiplying 2 and 5', () {
      // Arrange (Setup) -> create the calculator object
      // final calculator = Calculator();

      // Act (Action) -> collect the result you want to test
      final result = calculator.multiply(2, 5);

      // Assert (Result) -> compare the result against and expected value
      expect(result, 10);
    });
  });

  group('divide', () {
    test('the calculator returns 5 when dividing 10 and 2', () {
      // Arrange (Setup) -> create the calculator object
      // final calculator = Calculator();

      // Act (Action) -> collect the result you want to test
      final result = calculator.divide(10, 2);

      // Assert (Result) -> compare the result against and expected value
      expect(result, 5);
    });

    test('the calculator trows an ArgumentError when diving by zero', () {
      // Arrange (Setup) -> create the calculator object
      // final calculator = Calculator();

      // Act (Action) -> collect the result you want to test
      //final result = calculator.divide(10, 2);

      // Assert (Result) -> compare the result against and expected value
      expect(() => calculator.divide(10, 0), throwsArgumentError);
    });
  });

  group('powerOftwo', () {
    test('the calculator returns 16 when the input is 4', () async {
      expect(await calculator.powerOfTwo(4), 16);
    });
  });

  group('fibonacci sequence', () {
    test('the calculator return [0, 1, 1, 2, 3, 5, 8, 13, 21]', () {
      expect(calculator.fibonacciSequence(),
          emitsInOrder([0, 1, 1, 2, 3, 5, 8, 13, 21]));
    });
  });
}
