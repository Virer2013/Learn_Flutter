class User {
  final String name;

  User({
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
    );
  }
}