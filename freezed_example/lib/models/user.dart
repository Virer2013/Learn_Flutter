import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_example/models/location.dart';


part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  @JsonSerializable(explicitToJson: true)
  const factory User({
    required String name,
    int? age,
    required List<Location> locations,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String infoUser() {
    return 'My name is $name and I am $age years old';
  }
}

// class User {
//   final String name;
//   final int? age;

//   const User({
//     required this.name,
//     this.age,
//   });
// }
