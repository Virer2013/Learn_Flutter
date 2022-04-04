class User {
  final String name;
  final String country;

  const User({
    required this.name,
    required this.country,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          country == other.country;

  @override
  int get hashCode => name.hashCode ^ country.hashCode;

  // FOR EXAMPLE
  // var user1 = User(name: 'User1', country: 'Country1');
  // var user2 = User(name: 'User1', country: 'Country1');

  // print(user1 == user2); // RETURN TRUE
}