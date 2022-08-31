import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_example/entities/user.dart';

void main() {
  group('Default User Test', () {
    User user = User();

    test('User has an id with type int', () {
      expect(user.id, isA<int>());
    });

    test('User has an name with type String', () {
      expect(user.name, isA<String>());
    });

    test('Default id = 0. Default name = "No name"', () {
      expect(user.id, equals(0));
      expect(user.name, equals('No name'));
    });
  });

  group('Custom User Test', () {
    User user1 = User(id: 1);
    User user2 = User(name: 'Test');
    User user3 = User(id: 1, name: 'Test');

    test('Single parameter (id) is valid', () {
      expect(user1.id, equals(1));
      expect(user1.name, equals('No name'));
    });

    test('Single parameter (name) is valid', () {
      expect(user2.id, equals(0));
      expect(user2.name, equals('Test'));
    });

    test('All params are correct', () {
      expect(user3.id, equals(1));
      expect(user3.name, equals('Test'));
    });
  });
}