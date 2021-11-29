class User {
  final int id;
  final String name;
  final String? email;
  final String? phone;

  User({required this.id, required this.name, this.email, this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}