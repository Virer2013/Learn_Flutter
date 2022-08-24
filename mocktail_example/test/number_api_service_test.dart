import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_example/models/number.dart';
import 'package:mocktail_example/service/number_api_service.dart';

class MockNumberAPIService extends Mock implements NumberApiService {}

void main() {
  late MockNumberAPIService mockNumberAPIService;

  setUp(() {
    mockNumberAPIService = MockNumberAPIService();
  });

  group('NumberApiService', () {
    test('should get fact for the number from the numberAPiService', () async {
      when(() => mockNumberAPIService.getNumberFact(any())).thenAnswer(
        (invocation) async => Number(text: 'test', number: 1),
      );

      final resultNumber = await mockNumberAPIService.getNumberFact(1);

      expect(resultNumber, equals(Number(text: 'test', number: 1)));
      verify(() => mockNumberAPIService.getNumberFact(1));
      verifyNoMoreInteractions(mockNumberAPIService);
    });
  });
}
