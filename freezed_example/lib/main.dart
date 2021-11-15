import 'package:freezed_example/models/location.dart';

import 'models/user.dart';

void main() {
  User userA =
      User(name: 'User A', age: 30, locations: [Location(zipcode: '59601')]);
  print(userA.toJson());
  // User userA = User(name: 'User', age: 30);
  // User userB = User(name: 'User', age: 30);

  // print(userA.hashCode);
  // print(userB.hashCode);

  // print(userA == userB);

  // print('User A: $userA');

  // final userCopyA = userA.copyWith(
  //   name: 'User A',
  //   age: null,
  // );

  // print('User A Copy: $userCopyA');

  // final json = userA.toJson();
  // print('User A toJson: $json');
  // print('User A fromJson: ${User.fromJson(json)}');

  // print(userA.infoUser());
}
