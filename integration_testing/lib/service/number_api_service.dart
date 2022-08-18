import 'package:integration_testing/models/number.dart';
import 'package:http/http.dart' as http;

class NumberApiService {
  final http.Client client;

  NumberApiService({required this.client});

  Future<Number> getNumberFact(int number) async {
    final response = await client.get(
      Uri.parse('http://numbersapi.com/$number'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return Number.fromJson(response.body);
    } else {
      throw Exception('Failed to load number');
    }
  }
}