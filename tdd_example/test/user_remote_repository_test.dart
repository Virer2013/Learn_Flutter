import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_example/entities/user.dart';
import 'package:tdd_example/user_remote_repository/user_remote_repository.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
  });

  test('Get User Test (success)', () async {
    // Arrange
    when(() => mockDio.get('https://reqres.in/api/users/2'))
        .thenAnswer((_) async {
      return Future.value(Response<dynamic>(
        data: {
          "data": {
            "id": 2,
            "email": "janet.weaver@reqres.in",
            "first_name": "Janet",
            "last_name": "Weaver",
            "avatar": "https://reqres.in/img/faces/2-image.jpg"
          },
          "support": {
            "url": "https://reqres.in/#support-heading",
            "text":
                "To keep ReqRes free, contributions towards server costs are appreciated!"
          }
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: 'https://reqres.in/api/users/2'),
      ));
    });

    // Act
    User? user = await UserRemoteRepository(dio: mockDio).getUser(2);

    // Assert
    expect(user, isNotNull);
    expect(user?.id, equals(2));
    expect(user?.name, equals('Janet Weaver'));
  });

  test('Get User Test (failure)', () async {
    when(() => mockDio.get('https://reqres.in/api/users/23'))
        .thenAnswer((_) async {
      return Future.value(Response<dynamic>(
        data: {},
        statusCode: 404,
        requestOptions: RequestOptions(path: 'https://reqres.in/api/users/23'),
      ));
    });

    User? user = await UserRemoteRepository(dio: mockDio).getUser(2);

    expect(user, isNull);
    
  });
}
