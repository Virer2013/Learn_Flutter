import 'package:tdd_example/entities/user.dart';

abstract class IUserRepository {
  Future<User?> getUser(int id);
}