import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail_example/models/number.dart';
import 'package:mocktail_example/service/number_api_service.dart';

class MockHTTPClient extends Mock implements http.Client {}

void main() {
  late MockHTTPClient mockHTTPClient;
  late NumberApiService numberApiService;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    numberApiService = NumberApiService(client: mockHTTPClient);
  });

  group('should get Number from the service', () {
    int number = 1;
    test(
        'should perform a GET request on a URL with a number being the endpoint and with apllication/json',
        () async {
      when(() => mockHTTPClient.get(Uri.parse('http://numbersapi.com/$number'),
              headers: {'Content-Type': 'application/json'}))
          .thenAnswer((invocation) async => http.Response(
              json.encode({'number': number, 'text': 'test'}), 200));
      
      numberApiService.getNumberFact(number);

      verify(() => mockHTTPClient.get(Uri.parse('http://numbersapi.com/$number'),
              headers: {'Content-Type': 'application/json'}));

    });

    test(
        'returns a Number if the http call completes successfully',
        () async {
      when(() => mockHTTPClient.get(Uri.parse('http://numbersapi.com/$number'),
              headers: {'Content-Type': 'application/json'}))
          .thenAnswer((invocation) async => http.Response(
              json.encode({'number': number, 'text': 'test'}), 200));
      
      final resultNumber = await numberApiService.getNumberFact(number);
      
      expect(resultNumber, isA<Number>());
      expect(resultNumber, equals(Number(text: 'test', number: number)));

    });

    test(
        'should throw a Exception when the response code is 404 or other',
        () async {
      when(() => mockHTTPClient.get(Uri.parse('http://numbersapi.com/$number'),
              headers: {'Content-Type': 'application/json'}))
          .thenAnswer((invocation) async => http.Response(
             'Something went wrong', 404));
      
      final resultNumber = numberApiService.getNumberFact;
      
      expect(() => resultNumber(number), throwsException);
      

    });
  });
}
